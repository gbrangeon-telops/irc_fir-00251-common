library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_mgt_SUPPORT_RESET_LOGIC is
  Port ( 
    RESET : IN STD_LOGIC; 
    USER_CLK : IN STD_LOGIC; 
    INIT_CLK : IN STD_LOGIC; 
    GT_RESET_IN : IN STD_LOGIC; 
    SYSTEM_RESET : OUT STD_LOGIC; 
    GT_RESET_OUT : OUT STD_LOGIC 
  );
end data_mgt_SUPPORT_RESET_LOGIC;

architecture Structural of data_mgt_SUPPORT_RESET_LOGIC is

component data_mgt_SUPPORT_RESET_LOGIC_impl is
  Port ( 
    RESET : IN STD_LOGIC; 
    USER_CLK : IN STD_LOGIC; 
    INIT_CLK : IN STD_LOGIC; 
    GT_RESET_IN : IN STD_LOGIC; 
    SYSTEM_RESET : OUT STD_LOGIC; 
    GT_RESET_OUT : OUT STD_LOGIC 
  );
end component data_mgt_SUPPORT_RESET_LOGIC_impl;

begin
    
    U1 : data_mgt_SUPPORT_RESET_LOGIC_impl
    PORT MAP (
      RESET => RESET,
      USER_CLK => USER_CLK, 
      INIT_CLK => INIT_CLK,
      GT_RESET_IN => GT_RESET_IN,
      SYSTEM_RESET => SYSTEM_RESET,
      GT_RESET_OUT => GT_RESET_OUT
    );

end Structural;
