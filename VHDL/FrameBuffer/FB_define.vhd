---------------------------------------------------------------------------------------------------
--                                                      ..`??!````??!..
--                                                  .?!                `1.
--                                               .?`                      i
--                                             .!      ..vY=!``?74.        i
--.........          .......          ...     ?      .Y=` .+wA..   ?,      .....              ...
--"""HMM"""^         MM#"""5         .MM|    :     .H\ .JQgNa,.4o.  j      MM#"MMN,        .MM#"WMF
--   JM#             MMNggg2         .MM|   `      P.;,jMt   `N.r1. ``     MMmJgMM'        .MMMNa,.
--   JM#             MM%````         .MM|   :     .| 1A Wm...JMy!.|.t     .MMF!!`           . `7HMN
--   JMM             MMMMMMM         .MMMMMMM!     W. `U,.?4kZ=  .y^     .!MMt              YMMMMB=
--                                          `.      7&.  ?1+...JY'     .J
--                                           ?.        ?""""7`       .?`
--                                             :.                ..?`
--
---------------------------------------------------------------------------------------------------
--
-- Title       : FrameBuffer_Define
-- Author      : Jean-Alexis Boulet
-- Company     : Telops Inc.
--
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package FB_Define is
   ------------------------------------------
   -- FRAME BUFFER MODE
   ------------------------------------------      
   CONSTANT FBMODE_STANDBYT_c       : std_logic_vector(2 downto 0):="000";   
   CONSTANT FBMODE_GIGE_STD_c       : std_logic_vector(2 downto 0):="001";
   CONSTANT FBMODE_GIGE_LOSSLESS_c  : std_logic_vector(2 downto 0):="010";
   CONSTANT FBMODE_CLINK_BASE_c     : std_logic_vector(2 downto 0):="011";
   CONSTANT FBMODE_SDI_STD_c        : std_logic_vector(2 downto 0):="100";
   CONSTANT FBMODE_PASSTHROUGH_c    : std_logic_vector(2 downto 0):="111";
   
   type FB_Config is
   record
      fb_mode        : std_logic_vector(2 downto 0);
      base_addr      : unsigned(31 downto 0);
      frame_size     : unsigned(31 downto 0); -- in pixel
      hdr_size       : unsigned(31 downto 0); -- in pixel
      img_size       : unsigned(31 downto 0); -- in pixel
      img_width      : unsigned(15 downto 0); -- in pixel
      img_height     : unsigned(15 downto 0); -- in pixel
      read_start_pix : unsigned(15 downto 0);
      read_width     : unsigned(15 downto 0); -- in pixel
      read_start_line: unsigned(15 downto 0);
      read_stop_line : unsigned(15 downto 0);
      config_valid   : std_logic;
   end record;
   
   ------------------------------------------
   -- FLOW MANAGER MODE
   ------------------------------------------      
   CONSTANT FLOWMODE_FULL_c               : std_logic_vector(2 downto 0) := "000";  -- 2 slaves are always enabled
   CONSTANT FLOWMODE_ONLY_S0_c            : std_logic_vector(2 downto 0) := "001";  -- Only slave 0 is enabled
   CONSTANT FLOWMODE_ONLY_S1_c            : std_logic_vector(2 downto 0) := "010";  -- Only slave 1 is enabled
   CONSTANT FLOWMODE_ALTERN_PRIOR_S0_c    : std_logic_vector(2 downto 0) := "011";  -- Alternate 2 slaves with priority on slave 0
   CONSTANT FLOWMODE_ALTERN_PRIOR_S1_c    : std_logic_vector(2 downto 0) := "100";  -- Alternate 2 slaves with priority on slave 1
   
   type flow_config_type is
   record
      flow_mode         : std_logic_vector(2 downto 0);
      switching_img_cnt : unsigned(15 downto 0); -- number of images to pass before switching the flow (used only with alternate modes)
      config_valid      : std_logic;
   end record;
   
end FB_Define;

package body FB_Define is
   
end package body FB_Define;
