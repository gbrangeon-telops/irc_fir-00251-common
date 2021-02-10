------------------------------------------------------------------
--!   @file : clink_delay_validator_core
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity clink_delay_validator_core is
   port(
      CLK              : in std_logic;
      ARESET           : in std_logic;                   
      
      DLY_FDB_EN       : in std_logic;
      
      RST              : out std_logic;
      START            : out std_logic;
      
      SUCCESS          : in std_logic_vector(7 downto 0);
      DONE             : in std_logic_vector(7 downto 0);    
      
      DLY_FDB_RDY      : out std_logic;
      DLY_FDB_SUCCESS  : out std_logic
      );
end clink_delay_validator_core;


architecture rtl of clink_delay_validator_core is
   
   component sync_reset is
      port(
         CLK    : in std_logic;
         ARESET : in std_logic;
         SRESET : out std_logic
         );
   end component;
   
   constant C_ALL_ONES        : std_logic_vector(DONE'LENGTH-1 downto 0) := (others => '1');
   constant C_TEMP_POS_MAX    : integer := SUCCESS'LENGTH-1;
   
   type core_fsm_type is (idle, start_stretch_st, wait_data_st, rst_validator_st1, rst_validator_st2, output_st, pause_st);   
   
   signal core_fsm            : core_fsm_type;
   signal sreset              : std_logic;
   signal dly_fdb_success_i   : std_logic;
   signal dly_fdb_rdy_i       : std_logic;
   signal done_latch          : std_logic_vector(DONE'LENGTH-1 downto 0);
   signal success_latch       : std_logic_vector(SUCCESS'LENGTH-1 downto 0);
   signal start_i             : std_logic;
   signal rst_i               : std_logic;
   signal rst_cnt             : unsigned(3 downto 0);
   
   
begin
   
   START <=  start_i;
   DLY_FDB_SUCCESS <= dly_fdb_success_i;
   DLY_FDB_RDY  <= dly_fdb_rdy_i;
   RST <= rst_i;
   
   
   -------------------------------------------------- 
   -- synchro reset 
   --------------------------------------------------   
   U1: sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      );
   
   
   -------------------------------------------------- 
   -- fsm de contrôle
   -------------------------------------------------- 
   U2: process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            core_fsm <= idle;
            start_i <= '0';
            dly_fdb_success_i <= '0';
            dly_fdb_rdy_i <= '0';                   
            rst_i <= '1';
         else
            
            -- latch des résultats
            for ii in 0 to (DONE'LENGTH - 1) loop
               if DONE(ii) = '1' then 
                  done_latch(ii) <= '1';
                  success_latch(ii) <= SUCCESS(ii);
               end if;                    
            end loop; 
            
            --    
            case  core_fsm is
               
               when idle =>              
                  dly_fdb_success_i <= '0';
                  dly_fdb_rdy_i <= '0';
                  rst_i <= '0';
                  done_latch <= (others => '0');
                  success_latch <= (others => '0');
                  if DLY_FDB_EN = '1' then 
                     start_i <= '1';
                     core_fsm <= start_stretch_st; 
                  end if;
               
               when start_stretch_st =>
                  rst_cnt <= (others => '0');
                  core_fsm <= wait_data_st;   --  juste pour etirer le start_i                   
               
               when wait_data_st =>                         -- attendre que les données de tous les verificateurs soient disponibles
                  start_i <= '0';                  
                  if unsigned(success_latch) /= 0 then             -- voir s'il y a un vérificateur qui a eu du succès dans la détection de FVAL et LVAL
                     dly_fdb_success_i <= '1'; 
                     core_fsm <= rst_validator_st1;
                  end if;
                  if done_latch = C_ALL_ONES then                  -- tant que tous les vérificateurs n'ont pas terminé leur travail, on reste dans cet état
                     core_fsm <= rst_validator_st1; 
                  end if;
               
               when rst_validator_st1 =>                     
                  rst_i <= '1';
                  rst_cnt <= rst_cnt + 1;
                  if rst_cnt(3) = '1' then
                     core_fsm <= rst_validator_st2;
                  end if;
               
               when rst_validator_st2 =>                     
                  rst_i <= '0';
                  core_fsm <= output_st;
               
               when output_st =>                    -- lancer la seconde fsm qui se chargera de generer dly_fdb_success_i
                  dly_fdb_rdy_i <= '1';
                  core_fsm <= pause_st;
               
               when pause_st =>
                  dly_fdb_rdy_i <= '0';
                  if DLY_FDB_EN = '0' then          -- ainsi on est certain qu'on aura un seul DLY_FDB_EN pour un DLY_FDB_RDY
                     core_fsm <= idle; 
                  end if;
               
               when others => 
               
            end case;
            
         end if;    
      end if;
   end process;
   
end rtl;
