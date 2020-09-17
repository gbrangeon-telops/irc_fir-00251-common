library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_mgt_gt_common_wrapper is
  Port ( 
      gt_qpllclk_quad1_out : OUT STD_LOGIC;
      gt_qpllrefclk_quad1_out : OUT STD_LOGIC;
      GT0_GTREFCLK0_COMMON_IN : IN STD_LOGIC;
      GT0_QPLLLOCK_OUT : OUT STD_LOGIC;
      GT0_QPLLLOCKDETCLK_IN : IN STD_LOGIC;
      GT0_QPLLREFCLKLOST_OUT : OUT STD_LOGIC
  );
end data_mgt_gt_common_wrapper;

architecture Structural of data_mgt_gt_common_wrapper is

component data_mgt_gt_common_wrapper_impl is 
  Port ( 
      gt_qpllclk_quad1_out : OUT STD_LOGIC;
      gt_qpllrefclk_quad1_out : OUT STD_LOGIC;
      GT0_GTREFCLK0_COMMON_IN : IN STD_LOGIC;
      GT0_QPLLLOCK_OUT : OUT STD_LOGIC;
      GT0_QPLLLOCKDETCLK_IN : IN STD_LOGIC;
      GT0_QPLLREFCLKLOST_OUT : OUT STD_LOGIC
  );
end component data_mgt_gt_common_wrapper_impl;

begin

    U1 : data_mgt_gt_common_wrapper_impl
    PORT MAP (
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      GT0_GTREFCLK0_COMMON_IN => GT0_GTREFCLK0_COMMON_IN,
      GT0_QPLLLOCK_OUT => GT0_QPLLLOCK_OUT,
      GT0_QPLLLOCKDETCLK_IN => GT0_QPLLLOCKDETCLK_IN,
      GT0_QPLLREFCLKLOST_OUT => GT0_QPLLREFCLKLOST_OUT
    );

end Structural;
