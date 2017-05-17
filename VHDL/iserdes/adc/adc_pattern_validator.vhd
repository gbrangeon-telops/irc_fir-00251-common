------------------------------------------------------------------
--!   @file : adc_pattern_validator
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

entity adc_pattern_validator is
   port(
      ARESET         : in std_logic;
      CLK            : in std_logic;
      START          : in std_logic;
      REF_ADC_DATA   : in std_logic_vector(13 downto 0);
      ADC_DATA       : in std_logic_vector(13 downto 0);
      DONE           : out std_logic;
      SUCCESS        : out std_logic
      );
end adc_pattern_validator;


architecture rtl of adc_pattern_validator is
   
   component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
         );
   end component;
   
   type validator_fsm_type is (idle, pause_st); 
   
   signal validator_fsm  : validator_fsm_type;
   signal sreset         : std_logic;
   signal success_i      : std_logic;
   signal done_i         : std_logic;
   signal adc_data_latch : std_logic_vector(13 downto 0);
   
begin
   
   SUCCESS <= success_i;
   DONE <= done_i;
   
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
   -- lancement de la comparaison
   --------------------------------------------------  
   U2 : process(CLK)
   begin          
      if rising_edge(CLK) then         
         if sreset = '1' then 
            validator_fsm <= idle;
            done_i <= '0';
            success_i <= '0';
            
         else 
            
            if adc_data_latch = REF_ADC_DATA then
               success_i <= '1';
            else
               success_i <= '0';
            end if;
            
            case validator_fsm is  
               
               when idle =>
                  done_i <= '1';
                  adc_data_latch <= ADC_DATA;
                  if START = '1' then                     
                     validator_fsm <= pause_st;
                  end if;
               
               when pause_st =>       --
                  done_i <= '0';
                  if START = '0' then 
                     validator_fsm <= idle;
                  end if;
               
               when others =>
               
            end case;  
            
            
         end if;   
      end if;
   end process;  
   
end rtl;
