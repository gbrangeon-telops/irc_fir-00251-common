library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exp_mgt_clock_module is
  Port ( 
    INIT_CLK_I : IN STD_LOGIC;
    INIT_CLK_O : OUT STD_LOGIC;
    CLK : IN STD_LOGIC;  
     CLK_LOCKED : IN STD_LOGIC;
    USER_CLK : OUT STD_LOGIC;
    SYNC_CLK : OUT STD_LOGIC;
    MMCM_NOT_LOCKED : OUT STD_LOGIC
  );
end exp_mgt_clock_module;

architecture Structural of exp_mgt_clock_module is

component exp_mgt_clock_module_impl is
  Port ( 
    INIT_CLK_I : IN STD_LOGIC;
    INIT_CLK_O : OUT STD_LOGIC;
    CLK : IN STD_LOGIC;  
    CLK_LOCKED : IN STD_LOGIC;
    USER_CLK : OUT STD_LOGIC;
    SYNC_CLK : OUT STD_LOGIC;
    MMCM_NOT_LOCKED : OUT STD_LOGIC
  );
end component exp_mgt_clock_module_impl;

begin
 
    U1 : exp_mgt_clock_module_impl
    PORT MAP (
      INIT_CLK_I => INIT_CLK_I,
      INIT_CLK_O => INIT_CLK_O,
      CLK  => CLK, 
      CLK_LOCKED => CLK_LOCKED,
      USER_CLK => USER_CLK,
      SYNC_CLK => SYNC_CLK,
      MMCM_NOT_LOCKED => MMCM_NOT_LOCKED
    );

end Structural;
