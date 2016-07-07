--******************************************************************************
-- Destination: 
--
--	File: calib_define.vhd
-- Hierarchy: Package file
-- Use: 
--	Project: IRCDEV
--	By: Edem Nofodjie
-- Date: 22 october 2009	  
--
--******************************************************************************
--Description
--******************************************************************************
-- 1- Defines the global variables 
-- 2- Defines the project function
--******************************************************************************


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all; 

package calib_define is 
   
   -- Maximum number of calibration blocks
   constant NB_CALIB_BLOCK_MAX : integer := 8;
   subtype cal_block_index_type is unsigned(2 downto 0);
   constant CAL_BLOCK_INDEX_0 : cal_block_index_type  := to_unsigned(0, cal_block_index_type'length);
   constant CAL_BLOCK_INDEX_1 : cal_block_index_type  := to_unsigned(1, cal_block_index_type'length);
   constant CAL_BLOCK_INDEX_2 : cal_block_index_type  := to_unsigned(2, cal_block_index_type'length);
   constant CAL_BLOCK_INDEX_3 : cal_block_index_type  := to_unsigned(3, cal_block_index_type'length);
   constant CAL_BLOCK_INDEX_4 : cal_block_index_type  := to_unsigned(4, cal_block_index_type'length);
   constant CAL_BLOCK_INDEX_5 : cal_block_index_type  := to_unsigned(5, cal_block_index_type'length);
   constant CAL_BLOCK_INDEX_6 : cal_block_index_type  := to_unsigned(6, cal_block_index_type'length);
   constant CAL_BLOCK_INDEX_7 : cal_block_index_type  := to_unsigned(7, cal_block_index_type'length);
   
   -- Calibration block select mode values
   subtype calib_block_sel_mode_type is std_logic_vector(3 downto 0);
   constant CBSM_USER_SEL_0      : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(0, calib_block_sel_mode_type'length));
   constant CBSM_USER_SEL_1      : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(1, calib_block_sel_mode_type'length));
   constant CBSM_USER_SEL_2      : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(2, calib_block_sel_mode_type'length));
   constant CBSM_USER_SEL_3      : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(3, calib_block_sel_mode_type'length));
   constant CBSM_USER_SEL_4      : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(4, calib_block_sel_mode_type'length));
   constant CBSM_USER_SEL_5      : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(5, calib_block_sel_mode_type'length));
   constant CBSM_USER_SEL_6      : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(6, calib_block_sel_mode_type'length));
   constant CBSM_USER_SEL_7      : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(7, calib_block_sel_mode_type'length));
   constant CBSM_EXPOSURE_TIME   : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(8, calib_block_sel_mode_type'length));
   constant CBSM_FW_POSITION     : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(9, calib_block_sel_mode_type'length));
   constant CBSM_NDF_POSITION    : calib_block_sel_mode_type  := std_logic_vector(to_unsigned(10, calib_block_sel_mode_type'length));
   
   -- aoi
   type aoi_param_type is
   record
      width             : unsigned(15 downto 0);
      height            : unsigned(15 downto 0);
      offsetx           : unsigned(15 downto 0);
      offsety           : unsigned(15 downto 0);
   end record;
   
   -- calibration header
   type calib_hder_type is
   record
      cal_block_index   : cal_block_index_type;
      cal_block_posix   : std_logic_vector(31 downto 0);
      offset_fp32       : std_logic_vector(31 downto 0);
      data_exponent     : std_logic_vector(7 downto 0);
      block_act_posix   : std_logic_vector(31 downto 0);
      low_cut           : std_logic_vector(31 downto 0);
      high_cut          : std_logic_vector(31 downto 0);
   end record;
   
   -- Calibration block infos
   type calib_block_info_type is
   record
      sel_value   : std_logic_vector(31 downto 0);
      hder_info   : calib_hder_type;
   end record;
   type calib_block_array_type is array (0 to NB_CALIB_BLOCK_MAX-1) of calib_block_info_type;
   constant CALIB_BLOCK_ARRAY_TYPE_DEF : calib_block_array_type := ( 
      ((others => '0'), (CAL_BLOCK_INDEX_0, (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'))),
      ((others => '0'), (CAL_BLOCK_INDEX_1, (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'))),
      ((others => '0'), (CAL_BLOCK_INDEX_2, (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'))),
      ((others => '0'), (CAL_BLOCK_INDEX_3, (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'))),
      ((others => '0'), (CAL_BLOCK_INDEX_4, (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'))),
      ((others => '0'), (CAL_BLOCK_INDEX_5, (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'))),
      ((others => '0'), (CAL_BLOCK_INDEX_6, (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'))),
      ((others => '0'), (CAL_BLOCK_INDEX_7, (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'))) );
   
   -- error_type
   type error_reg_type is array (0 to 4) of std_logic_vector(31 downto 0);
   
   -- stat_reg
   type calib_stat_type is
   record
      done              : std_logic;
      error_reg         : error_reg_type;
   end record;    
   
end calib_define;

package body calib_define is
end package body calib_define; 
