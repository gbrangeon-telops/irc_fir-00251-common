------------------------------------------------------------------
--!   @file : clink_validator_ctrler
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
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.all;

entity clink_validator_ctrler is
   
   generic(
      CLK_PERIOD_NS  : real := 10.0;  -- nanoseconds
      FRAME_RATE_MIN : real := 0.1    -- Hz
      );
   port( 		 
      
      ARESET            : in std_logic;
      CLK               : in std_logic;
      
      -- pulse de lancement du module
      START             : in std_logic;
      
      -- consignes
      FVAL              : in std_logic;                         -- signal FVAL 
      LVAL              : in std_logic;                         -- signal LVAL
      LVAL_LENGTH       : in std_logic_vector(10 downto 0);     -- durée de LVAL en coups d'horloge CLK
      LVAL_NUM          : in std_logic_vector(10 downto 0);     -- nombre de LVAL à l'intérieur d'un FVAL
      
      -- mesure de LVAL
      RUN_LVAL_MEAS     : out std_logic;                        -- '0', met le module de measure de lval en reset. à '1' pour la mesure et doiut y rester tout au long
      LVAL_LENGTH_MEAS  : in std_logic_vector(10 downto 0);     -- mesure de la durée de lval
      LVAL_LENGTH_DVAL  : in std_logic;                         -- pulse de validation de la mesure
      
      PATTERN_SUCCESS   : out std_logic;                        -- signal de sortie du module signifiant à '1' qu'un patron (FVAL, LVAL) valide est détecté. Sinon à '0'
      PATTERN_DONE      : out std_logic                         -- valide le PATTERN_VALID
      );
end clink_validator_ctrler;



architecture rtl of clink_validator_ctrler is
   
   
   constant FRAME_LENGTH_MAX_NS : real := real(1E9) / FRAME_RATE_MIN;
   constant C_TIMEOUT_CNT_MAX : unsigned(30 downto 0) := to_unsigned(integer(FRAME_LENGTH_MAX_NS/CLK_PERIOD_NS), 31);
   
   component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
         );
   end component;
   
   type ctler_fsm_type is (idle, wait_eof_st, discard_1st_lval_st, dly_run_st, lval_meas_st, fetch_result_st, check_result_st1, check_result_st2, check_result_st3, output_st); 
   type timeout_fsm_type is (check_rate_st, timeout_st);
   
   signal ctler_fsm              : ctler_fsm_type;
   signal timeout_fsm            : timeout_fsm_type;
   signal run_lval_meas_i        : std_logic;
   signal pattern_success_i      : std_logic;
   signal pattern_done_i         : std_logic;
   signal sreset                 : std_logic;
   signal lval_num_min           : unsigned(LVAL_NUM'length-1 downto 0);
   signal timeout_rst            : std_logic;
   signal min_max_rst            : std_logic;
   signal fval_i                 : std_logic;
   signal fval_last              : std_logic;
   signal fval_fe                : std_logic;
   signal lval_i                 : std_logic;
   signal lval_last              : std_logic;
   signal lval_re                : std_logic;
   signal lval_fe                : std_logic;
   signal result_fail            : std_logic;
   signal lval_cnt               : unsigned(LVAL_NUM'length-1 downto 0);
   signal lval_length_min_i      : unsigned(LVAL_LENGTH_MEAS'length-1 downto 0);
   signal lval_length_max_i      : unsigned(LVAL_LENGTH_MEAS'length-1 downto 0);
   signal lval_length_min_reg    : unsigned(LVAL_LENGTH_MEAS'length-1 downto 0);
   signal lval_length_max_reg    : unsigned(LVAL_LENGTH_MEAS'length-1 downto 0);
   signal lval_cnt_reg           : unsigned(LVAL_NUM'length-1 downto 0);
   signal timeout_occurred       : std_logic;
   signal fval_timeout_cnt       : unsigned(C_TIMEOUT_CNT_MAX'length-1 downto 0);
   signal lval_timeout_cnt       : unsigned(C_TIMEOUT_CNT_MAX'length-1 downto 0);
   signal signal_present         : std_logic;
   
begin
   
   RUN_LVAL_MEAS <= run_lval_meas_i;
   PATTERN_SUCCESS <= pattern_success_i;
   PATTERN_DONE <= pattern_done_i;
   
   
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1 : sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      );
   
   
   --------------------------------------------------
   -- lancement de la measure de lval
   --------------------------------------------------  
   U2 : process(CLK)
   begin          
      if rising_edge(CLK) then         
         if sreset = '1' then 
            ctler_fsm <= idle;
            timeout_rst <= '1';
            min_max_rst <= '1';
            run_lval_meas_i <= '0';
            pattern_done_i <= '0';
            pattern_success_i <= '0';
            
         else 
            
            lval_num_min <= unsigned(LVAL_NUM) - 2;        -- moins 2 pour tenir compte du premier lval qui est ecarté et de la mesure du dernier qui peut arriver après le falling_edge de FVAL
            
            fval_i <= FVAL;
            lval_i <= LVAL;
            
            fval_last <= fval_i;
            lval_last <= lval_i;                  
            fval_fe <= not fval_i and fval_last;
            lval_fe <= not lval_i and lval_last;
            lval_re <= lval_i and not lval_last;
            
            case ctler_fsm is  
               
               when idle =>
                  timeout_rst <= '1';
                  min_max_rst <= '1';
                  run_lval_meas_i <= '0';
                  result_fail <= '0';
                  pattern_done_i <= '0';
                  if START = '1' then 
                     ctler_fsm <= wait_eof_st;
                  end if;
               
               when wait_eof_st =>
                  timeout_rst <= '0';     -- on active le timeout en quittant idle
                  if fval_fe = '1' then   -- falling edge on FVAL
                     ctler_fsm <= discard_1st_lval_st;
                  end if;  
               
               when discard_1st_lval_st =>             -- le premier lval est peut-etre un header. Donc on ne le mesure, ni le dénombre
                  if lval_re = '1' then   
                     ctler_fsm <= dly_run_st;
                  end if;
               
               when dly_run_st =>                 
                  ctler_fsm <= lval_meas_st;
               
               when lval_meas_st =>                    -- mesure de la durée des lval et leur dénombrement
                  min_max_rst <= '0';
                  run_lval_meas_i <= '1';
                  if fval_fe = '1' then 
                     ctler_fsm <= fetch_result_st;
                  end if; 
               
               when fetch_result_st =>                 -- latch des resultats avant le reset/l'arret des mesureurs
                  lval_length_min_reg <= lval_length_min_i;
                  lval_length_max_reg <= lval_length_max_i;
                  lval_cnt_reg <= lval_cnt;
                  ctler_fsm <= check_result_st1;
               
               when check_result_st1 =>
                  timeout_rst <= '1';       -- machine de timeout en reset pour ne pas perturber le bilan
                  min_max_rst <= '1';       -- machine de min_max en reset pour faire le bilan
                  run_lval_meas_i <= '0';   -- machine de mesure de lval arrêtée  pour faire le bilan
                  if lval_length_min_reg /= unsigned(LVAL_LENGTH) then 
                     result_fail <= '1';
                  end if;
                  ctler_fsm <= check_result_st2;
               
               when check_result_st2 =>
                  if lval_length_max_reg /= unsigned(LVAL_LENGTH) then 
                     result_fail <= '1';
                  end if;
                  ctler_fsm <= check_result_st3;
               
               when check_result_st3 =>
                  if lval_cnt_reg < lval_num_min then   -- on n'a pas un nombre minimal de lval
                     result_fail <= '1';
                  end if;
                  ctler_fsm <= output_st;
               
               when output_st => 
                  pattern_success_i <= not result_fail;
                  pattern_done_i <= '1';
                  ctler_fsm <= idle;   
               
               when others =>
               
            end case;  
            
            -- gestion du timeout
            if timeout_occurred = '1' then
               timeout_rst <= '1';       -- machine de timeout en reset sinon plantage
               ctler_fsm <= fetch_result_st;
            end if;            
            
         end if;   
      end if;
   end process;
   
   
   --------------------------------------------------
   -- capture des measures et recherche du min max
   --------------------------------------------------  
   U3 : process(CLK)
   begin          
      if rising_edge(CLK) then          
         if min_max_rst = '1' then 
            lval_length_min_i <= (others => '1');
            lval_length_max_i <= (others => '0');
            lval_cnt <= (others => '0');
         else 
            
            if LVAL_LENGTH_DVAL = '1' then 
               
               -- recherche du minimum 
               if unsigned(LVAL_LENGTH_MEAS) < lval_length_min_i then 
                  lval_length_min_i <= unsigned(LVAL_LENGTH_MEAS);
               end if;
               
               -- recherche du maximum
               if unsigned(LVAL_LENGTH_MEAS) > lval_length_max_i then 
                  lval_length_max_i <= unsigned(LVAL_LENGTH_MEAS);
               end if;
               
               -- compteur de lval
               lval_cnt <= lval_cnt + 1;         -- il peut faire un wrap, pas de problème. Si cela arrive, forcément que LVAL_LENGTH_MEAS ne serapas celle escompté. Les min_mmax trancheront
               
            end if;
            
         end if;         
      end if;
   end process;
   
   
   --------------------------------------------------
   -- génération du timeout
   --------------------------------------------------  
   --en l'absence de transition sur FVAL ou de mesure de LAVL durant 10 sec, on sort un timeout
   U4: process(CLK)
   begin          
      if rising_edge(CLK) then         
         if  timeout_rst = '1' then
            timeout_occurred <= '0';
            fval_timeout_cnt <= C_TIMEOUT_CNT_MAX;
            lval_timeout_cnt <= C_TIMEOUT_CNT_MAX;
            timeout_fsm <= check_rate_st;
            
         else            
            
            case timeout_fsm is
               
               when check_rate_st =>
                  fval_timeout_cnt <= fval_timeout_cnt - 1;
                  lval_timeout_cnt <= lval_timeout_cnt - 1;
                  if fval_fe = '1' then
                     fval_timeout_cnt <= C_TIMEOUT_CNT_MAX;
                  end if;
                  if lval_fe = '1' then
                     lval_timeout_cnt <= C_TIMEOUT_CNT_MAX;
                  end if;
                  if fval_timeout_cnt = 0 or lval_timeout_cnt = 0 then 
                     timeout_fsm <= timeout_st;
                  end if;
               
               when timeout_st =>
                  timeout_occurred <= '1';    -- seul timeout_rst = '1' ou sreset = '1' permet de sortir de cet état
               
               when others =>
               
            end case;
            
         end if;
      end if;
   end process;
   
end rtl;
