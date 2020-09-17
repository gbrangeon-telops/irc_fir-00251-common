library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity exp_mgt_support_reset_logic is
  Port ( 
    RESET : IN STD_LOGIC;
    USER_CLK : IN STD_LOGIC;
    INIT_CLK : IN STD_LOGIC;
    GT_RESET_IN : IN STD_LOGIC;
    SYSTEM_RESET : OUT STD_LOGIC;
    GT_RESET_OUT : OUT STD_LOGIC
  );
end exp_mgt_support_reset_logic;

architecture Behavioral of exp_mgt_support_reset_logic is

component exp_mgt_support_reset_logic_impl is
  Port ( 
    RESET : IN STD_LOGIC;
    USER_CLK : IN STD_LOGIC;
    INIT_CLK : IN STD_LOGIC;
    GT_RESET_IN : IN STD_LOGIC;
    SYSTEM_RESET : OUT STD_LOGIC;
    GT_RESET_OUT : OUT STD_LOGIC
  );
end component exp_mgt_support_reset_logic_impl;

begin

    U1 : exp_mgt_support_reset_logic_impl
    PORT MAP (
      RESET => RESET,
      USER_CLK => USER_CLK,
      INIT_CLK => INIT_CLK,
      GT_RESET_IN => GT_RESET_IN,
      SYSTEM_RESET => SYSTEM_RESET,
      GT_RESET_OUT => GT_RESET_OUT
    );

end Behavioral;
