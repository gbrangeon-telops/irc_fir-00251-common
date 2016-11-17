-------------------------------------------------------------------------------
--
-- Title       : min_max_ctrl
-- Design      : FIR_00180_Sofradir
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : d:\Telops\FIR-00180\FIR_00180_Sofradir\src\min_max_ctrl.vhd
-- Generated   : Tue Nov 22 12:13:49 2011
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--library COMMON_HDL;
--use COMMON_HDL.Telops.all;

entity min_max_ctrl is
   port(
      PERIOD_LENGTH    : in std_logic_vector(31 downto 0);
      PERIOD_DONE      : in std_logic;
      --LOW_LENGTH     : in std_logic_vector(31 downto 0);
      --LOW_DONE       : in std_logic;
      ARESET         : in std_logic;
      CLK            : in std_logic;
      --LOW_MIN        : out STD_LOGIC_VECTOR(31 downto 0);
      --LOW_MAX        : out STD_LOGIC_VECTOR(31 downto 0);
      PERIOD_MIN       : out STD_LOGIC_VECTOR(31 downto 0);
      PERIOD_MAX       : out STD_LOGIC_VECTOR(31 downto 0);
      MEAS_DONE      : out std_logic
      );
end min_max_ctrl;



architecture RTL of min_max_ctrl is
   component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
         );
   end component;   
   
   signal sreset              : std_logic := '1';
   --signal sreset_in           : std_logic;
   --signal low_min_i           : unsigned(LOW_MIN'range); 
   signal PERIOD_min_i          : unsigned(PERIOD_MIN'range);
   --signal low_max_i           : unsigned(LOW_MAX'range); 
   signal PERIOD_max_i          : unsigned(PERIOD_MAX'range);
   --signal rst_cnt             : unsigned(31 downto 0);
   
   attribute keep : string; 
   --attribute keep of low_min_i    : signal is "true";  
   attribute keep of PERIOD_min_i   : signal is "true";
   --attribute keep of low_max_i    : signal is "true";  
   attribute keep of PERIOD_max_i   : signal is "true"; 
   
begin
   
   --LOW_MIN <=  std_logic_vector(low_min_i);
   --LOW_MAX <=  std_logic_vector(low_max_i);
   
   PERIOD_MIN <=  std_logic_vector(PERIOD_min_i); 
   PERIOD_MAX <=  std_logic_vector(PERIOD_max_i);
   
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1A : sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      );  
   
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
--   U1B : process(CLK)
--   begin
--      if rising_edge(CLK) then
--         if sreset_in = '1' then
--            rst_cnt <= (others => '0');
--            sreset <= '1';
--         else
--            rst_cnt <= rst_cnt + 1;
--            if rst_cnt = 1_000 then -- le reest dure 2 secondes de plus 
--               sreset <= '0';
--            end if;              
--         end if;
--      end if;
--   end process;    
   
   --------------------------------------------------
   -- detection de l'horloge par mesure de sa periode
   --------------------------------------------------  
   U2 : process(CLK)
   begin          
      if rising_edge(CLK) then 
         if sreset = '1' then 
            --low_min_i <= (others => '1');
            PERIOD_min_i <= (others => '1');
            --low_max_i <= (others => '0');
            PERIOD_max_i <= (others => '0');
         else 
            if PERIOD_DONE = '1' then
               if unsigned(PERIOD_LENGTH(PERIOD_min_i'range)) < PERIOD_min_i then 
                  PERIOD_min_i <= unsigned(PERIOD_LENGTH(PERIOD_min_i'range));
               end if;
               if unsigned(PERIOD_LENGTH(PERIOD_max_i'range)) > PERIOD_max_i then 
                  PERIOD_max_i <= unsigned(PERIOD_LENGTH(PERIOD_max_i'range));
               end if;
               
            end if;
            
            --if LOW_DONE = '1' then
--               if unsigned(LOW_LENGTH(low_min_i'range)) < low_min_i then 
--                  low_min_i <= unsigned(LOW_LENGTH(low_min_i'range));
--               end if;
--               if unsigned(LOW_LENGTH(low_max_i'range)) > low_max_i then 
--                  low_max_i <= unsigned(LOW_LENGTH(low_max_i'range));
--               end if;
--            end if;
            
            MEAS_DONE <= PERIOD_DONE;
            
            
         end if;
      end if;
   end process;
   
   
   
end RTL;
