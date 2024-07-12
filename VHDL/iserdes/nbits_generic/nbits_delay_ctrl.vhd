------------------------------------------------------------------
--!   @file : nbits_delay_ctrl
--!   @brief
--!   @details
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.fpa_serdes_define.all;

entity nbits_delay_ctrl is
   generic (
      STABILITY_WIDTH_MIN : natural range 4 to 31 := 10; -- largeur minimale en dly_tap de la zone stabilité souhaitée (du début à la fin de la zone). En deça de cette valeur, on declare que la calibration a echouée.
      CLK_PERIOD_NS       : real                  := 10.0;
      DATA_WIDTH          : positive              := 7
      );
   port (
      CLK           : in  std_logic;
      ARESET        : in  std_logic;
      
      -- lancement du module
      EN            : in  std_logic;
      
      -- feedback pour savoir si le delay envoyé est un succès ou pas
      FDB_EN        : out std_logic;
      FDB_RDY       : in  std_logic;
      FDB_SUCCESS   : in  std_logic;
      
      -- données envoyées vers les idelay
      DLY_DATA1     : out std_logic_vector(4 downto 0);
      DLY_DATA2     : out std_logic_vector(4 downto 0);
      DLY_DVAL      : out std_logic;
      
      -- statut de fin de parcours
      DONE          : out std_logic;
      SUCCESS       : out std_logic;
      EDGES         : out std_logic_vector(31 downto 0)
      );
end nbits_delay_ctrl;

architecture rtl of nbits_delay_ctrl is
   constant C_BIT_TIME_NS         : real    := CLK_PERIOD_NS / real(DATA_WIDTH);
   constant C_BIT_PERIOD_FACTOR   : natural := integer(C_BIT_TIME_NS / C_DELAY_RESOLUTION_NS);
   constant C_BIT_PERIOD_FACTOR_D : natural := C_BIT_PERIOD_FACTOR / 2;
   
   component sync_reset is
      port (
         CLK    : in  std_logic;
         ARESET : in  std_logic;
         SRESET : out std_logic
         );
   end component;
   
   signal sreset : std_logic;
   
   type ctrl_fsm is (IDLE, START_POS, UPDATE_DLY, WAIT_FDB, INCR_POS, EYE_WINDOW, INCR_SKEW, OUTPUT_DLY, OUTPUT_STS);
   signal state : ctrl_fsm;
   signal skew  : integer range -C_BIT_PERIOD_FACTOR_D to C_BIT_PERIOD_FACTOR_D;
   signal dly1  : unsigned(4 downto 0);
   signal dly2  : unsigned(4 downto 0);
   signal fdb   : std_logic_vector(31 downto 0);
   
   signal i   : natural range 0 to 32;
   signal cnt : natural range 0 to 32;
   
   signal dly1_bst : unsigned(4 downto 0);
   signal dly2_bst : unsigned(4 downto 0);
   signal fdb_bst  : std_logic_vector(31 downto 0);
   signal cnt_bst  : natural range 0 to 32;
begin
   EDGES <= fdb;
   
   process(CLK)
   begin
      if rising_edge(CLK) then
         if sreset = '1' then
            FDB_EN    <= '0';
            DLY_DATA1 <= (others => '0');
            DLY_DATA2 <= (others => '0');
            DLY_DVAL  <= '0';
            DONE      <= '0';
            SUCCESS   <= '0';
            state     <= IDLE;
            skew      <= 0;
            dly1      <= (others => '0');
            dly2      <= (others => '0');
            fdb       <= (others => '0');
            i         <= 0;
            cnt       <= 0;
            dly1_bst  <= (others => '0');
            dly2_bst  <= (others => '0');
            fdb_bst   <= (others => '0');
            cnt_bst   <= 0;
         else
            case state is
               when IDLE =>
                  if EN = '1' then
                     skew    <= -C_BIT_PERIOD_FACTOR_D;
                     fdb_bst <= (others => '1');
                     cnt_bst <= STABILITY_WIDTH_MIN;
                     state   <= START_POS;
                  end if;
               when START_POS =>
                  if skew < 0 then
                     dly1 <= to_unsigned(-skew, dly1'LENGTH);
                     dly2 <= to_unsigned(0, dly2'LENGTH);
                  else
                     dly1 <= to_unsigned(0, dly1'LENGTH);
                     dly2 <= to_unsigned(skew, dly2'LENGTH);
                  end if;
                  fdb   <= (others => '1');
                  state <= UPDATE_DLY;
               when UPDATE_DLY =>
                  DLY_DATA1 <= std_logic_vector(dly1);
                  DLY_DATA2 <= std_logic_vector(dly2);
                  DLY_DVAL  <= '1';
                  state     <= WAIT_FDB;
               when WAIT_FDB =>
                  DLY_DVAL <= '0';
                  FDB_EN   <= '1';
                  if FDB_RDY = '1' then
                     FDB_EN                <= '0';
                     fdb(to_integer(dly1)) <= not FDB_SUCCESS;
                     state                 <= INCR_POS;
                  end if;
               when INCR_POS =>
                  if and(dly1) = '1' or and(dly2) = '1' then
                     dly1  <= to_unsigned(0, dly1'LENGTH);
                     dly2  <= to_unsigned(0, dly2'LENGTH);
                     state <= EYE_WINDOW;
                  else
                     dly1  <= dly1 + 1;
                     dly2  <= dly2 + 1;
                     state <= UPDATE_DLY;
                  end if;
               when EYE_WINDOW =>
                  if i = 32 or fdb(i) = '1' then
                     if cnt > cnt_bst then
                        dly1_bst <= to_unsigned(i - (cnt + 1) / 2       , dly1_bst'LENGTH);
                        dly2_bst <= to_unsigned(i - (cnt + 1) / 2 + skew, dly2_bst'LENGTH);
                        fdb_bst  <= fdb;
                        cnt_bst  <= cnt;
                     end if;
                     cnt <= 0;
                  else
                     cnt <= cnt + 1;
                  end if;
                  
                  if i = 32 then
                     i     <= 0;
                     state <= INCR_SKEW;
                  else
                     i     <= i + 1;
                  end if;
               when INCR_SKEW =>
                  if skew = C_BIT_PERIOD_FACTOR_D then
                     skew  <= -C_BIT_PERIOD_FACTOR_D;
                     state <= OUTPUT_DLY;
                  else
                     skew  <= skew + 1;
                     state <= START_POS;
                  end if;
               when OUTPUT_DLY =>
                  DLY_DATA1 <= std_logic_vector(dly1_bst);
                  DLY_DATA2 <= std_logic_vector(dly2_bst);
                  DLY_DVAL  <= '1';
                  state     <= OUTPUT_STS;
               when OUTPUT_STS =>
                  DLY_DVAL <= '0';
                  DONE     <= '1';
                  if cnt_bst = STABILITY_WIDTH_MIN then
                     SUCCESS <= '0';
                  else
                     SUCCESS <= '1';
                  end if;
                  fdb      <= fdb_bst;
            end case;
         end if;
      end if;
   end process;
   
   -------------------------------------------------- 
   -- synchro reset 
   --------------------------------------------------   
   U1 : sync_reset
   port map (
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      );
end rtl;
