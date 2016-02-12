------------------------------------------------------------------
--!   @file : hder_extractor.vhd
--!   @brief : extract important header information for downstream block
--!   @details : Selected HDR information are extracted and output validated on Tlast
--!
--!   $Rev $
--!   $Author $
--!   $Date $
--!   $Id $
--!   $URL $
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
use work.img_header_define.all;
use work.tel2000.all;
use work.calib_define.all;

entity axis16_hder_extractor is
   port(
      
      ARESETN           : in std_logic;
      CLK_STREAM        : in std_logic;
      CLK_HDROUT        : in std_logic; 
      
      IMG_DATA_MOSI     : in t_axi4_stream_mosi16;
      IMG_DATA_MISO     : in t_axi4_stream_miso;
      
      -- 
      DECODED_HDR       : out decoded_hdr_type;
      
      HDR_INFO_VALID    : out std_logic;
      
      --Enter requiered hdr info here
      EXPOSURE_TIME     : out std_logic_vector(31 downto 0);
      IMG_WIDTH         : out std_logic_vector(15 downto 0); 
      IMG_HEIGHT        : out std_logic_vector(15 downto 0); -- excluding hdr line
      EHDRI_INDEX       : out std_logic_vector(7 downto 0); 
      CAL_BLOCK_INDEX   : out cal_block_index_type;
      CAL_BLOCK_INDEX_VALID : out std_logic;
      IMG_HDR_LEN       : out std_logic_vector(15 downto 0); -- in pixel
      FW_POSITION       : out std_logic_vector(7 downto 0)
      
      );
   attribute dont_touch : string;
   attribute dont_touch of axis16_hder_extractor : entity is "yes";
end axis16_hder_extractor;


architecture rtl of axis16_hder_extractor is
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;
   
   component double_sync_vector is
      port(
         D : in STD_LOGIC_vector;
         Q : out STD_LOGIC_vector;
         CLK : in STD_LOGIC -- use the output clk
         );
   end component;
   
   component double_sync
      generic(
         INIT_VALUE : BIT := '0');
      port(
         D : in STD_LOGIC;
         Q : out STD_LOGIC;
         RESET : in STD_LOGIC;
         CLK : in STD_LOGIC);
   end component; 
   
   constant HDR_BITWIDTH : integer := 6;
   
   constant EXPOSURETIME_SIZE       : integer := EXPOSURE_TIME'length;
   constant WIDTH_SIZE              : integer := 16;
   constant HEIGHT_SIZE             : integer := 16;
   constant OFFSETX_SIZE            : integer := 16;
   constant OFFSETY_SIZE            : integer := 16;
   constant EHDRIINDEX_SIZE         : integer := 8;
   constant FWPOSITION_SIZE         : integer := 8;
   constant CAL_BLOCK_INDEX_SIZE    : integer := CAL_BLOCK_INDEX'length;
   constant IMAGEHEADERLENGTH_SIZE  : integer := 16;
   
   -- Default value
   constant IMG_WIDTH_DEF : std_logic_vector(WIDTH_SIZE-1 downto 0) := std_logic_vector(to_unsigned(640,WIDTH_SIZE));
   constant IMG_HEIGHT_DEF : std_logic_vector(HEIGHT_SIZE-1  downto 0) := std_logic_vector(to_unsigned(512,HEIGHT_SIZE));
   constant IMF_HDR_LEN_DEF : std_logic_vector(IMAGEHEADERLENGTH_SIZE-1  downto 0) := std_logic_vector(to_unsigned(0,IMAGEHEADERLENGTH_SIZE));
   constant IMG_EXPOSURE_DEF : std_logic_vector(EXPOSURETIME_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0,EXPOSURETIME_SIZE));
   constant IMG_EHDRIINDEX_DEF : std_logic_vector(EHDRIINDEX_SIZE-1 downto 0) := std_logic_vector(to_unsigned(5,EHDRIINDEX_SIZE));
   constant IMG_FWPOSITION_DEF : std_logic_vector(FWPOSITION_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0,FWPOSITION_SIZE));
   constant CAL_BLOCK_INDEX_DEF : std_logic_vector(CAL_BLOCK_INDEX_SIZE-1 downto 0) := std_logic_vector(CAL_BLOCK_INDEX_0);
   constant IMG_OFFSETX_DEF : std_logic_vector(OFFSETX_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0,OFFSETX_SIZE));
   constant IMG_OFFSETY_DEF : std_logic_vector(OFFSETY_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0,OFFSETY_SIZE));
   
   --Constant type cast
   --constant iWidthAdd32 : unsigned(15 downto 0) := TO_UNSIGNED(WidthAdd32,16);
   
   signal areset: std_logic;
   signal sreset: std_logic;
   signal hdr_info_valid_o : std_logic;
   signal cal_block_index_valid_o : std_logic;
   
   signal uHdr_addr_loc8         : unsigned(12 downto 0);
   signal img_exposuretime_o     : std_logic_vector(EXPOSURETIME_SIZE-1 downto 0);
   signal img_ehdriindex_o       : std_logic_vector(EHDRIINDEX_SIZE-1 downto 0);
   signal cal_block_index_o      : std_logic_vector(CAL_BLOCK_INDEX_SIZE-1 downto 0);
   signal img_width_o            : std_logic_vector(WIDTH_SIZE-1 downto 0);
   signal img_height_o           : std_logic_vector(HEIGHT_SIZE-1  downto 0);
   signal img_offsetx_o          : std_logic_vector(15 downto 0);
   signal img_offsety_o          : std_logic_vector(15 downto 0);
   signal img_hdr_len_o          : std_logic_vector(IMAGEHEADERLENGTH_SIZE-1  downto 0);
   signal img_fwposition_o       : std_logic_vector(FWPOSITION_SIZE-1 downto 0);
   signal tid                    : std_logic := '1';

   signal hder_info_valid_sync   : std_logic;
   signal cal_block_index_valid_sync : std_logic;
   signal img_exposuretime_sync  : std_logic_vector(img_exposuretime_o'length-1 downto 0);
   signal img_ehdriindex_sync    : std_logic_vector(img_ehdriindex_o'length-1 downto 0);
   signal cal_block_index_sync   : std_logic_vector(cal_block_index_o'length-1 downto 0);
   signal img_width_sync         : std_logic_vector(img_width_o'length-1 downto 0);
   signal img_height_sync        : std_logic_vector(img_height_o'length-1 downto 0);
   signal img_offsetx_sync       : std_logic_vector(img_offsetx_o'length-1 downto 0);
   signal img_offsety_sync       : std_logic_vector(img_offsety_o'length-1 downto 0);
   signal img_fwposition_sync    : std_logic_vector(img_fwposition_o'length-1 downto 0);
   
   --signal iHdr_addr_loc32:integer ;
begin
   
   -- outputs (legacy)
   EXPOSURE_TIME <= img_exposuretime_sync;
   IMG_WIDTH <= img_width_sync;
   IMG_HEIGHT <= img_height_sync;
   HDR_INFO_VALID <= hder_info_valid_sync;
   EHDRI_INDEX <= img_ehdriindex_sync;
   CAL_BLOCK_INDEX <= unsigned(cal_block_index_sync);
   CAL_BLOCK_INDEX_VALID <= cal_block_index_valid_sync;
   FW_POSITION <= img_fwposition_sync;
   
   -- single output
   DECODED_HDR.DVAL             <= hder_info_valid_sync;
   DECODED_HDR.EXPOSURE_TIME    <= unsigned(img_exposuretime_sync);
   DECODED_HDR.WIDTH   <= unsigned(img_width_sync);
   DECODED_HDR.HEIGHT  <= unsigned(img_height_sync);
   DECODED_HDR.OFFSETX <= unsigned(img_offsetx_sync);
   DECODED_HDR.OFFSETY <= unsigned(img_offsety_sync);
   
   --Reset management
   areset <= not ARESETN;
   r0: sync_reset port map(ARESET => areset, CLK => CLK_STREAM, SRESET => sreset);
   
   --Signal sync crossing
   s3 : double_sync_vector port map(D => img_width_o,    Q => img_width_sync,      CLK => CLK_HDROUT);
   s4 : double_sync_vector port map(D => img_height_o,   Q => img_height_sync,     CLK => CLK_HDROUT);
   s5 : double_sync_vector port map(D => img_hdr_len_o,  Q => IMG_HDR_LEN,    CLK => CLK_HDROUT);
   s6 : double_sync port map(D => hdr_info_valid_o,  Q => hder_info_valid_sync, RESET=> sreset,    CLK => CLK_HDROUT);
   s7 : double_sync_vector port map(D => img_offsetx_o,   Q => img_offsetx_sync,     CLK => CLK_HDROUT);
   s8 : double_sync_vector port map(D => img_offsety_o,   Q => img_offsety_sync,     CLK => CLK_HDROUT);
   s9 : double_sync_vector port map(D => img_exposuretime_o,   Q => img_exposuretime_sync,     CLK => CLK_HDROUT);
   s10: double_sync_vector port map(D => img_ehdriindex_o,   Q => img_ehdriindex_sync,     CLK => CLK_HDROUT);
   s11: double_sync_vector port map(D => cal_block_index_o,   Q => cal_block_index_sync,     CLK => CLK_HDROUT);
   s12: double_sync port map(D => cal_block_index_valid_o,  Q => cal_block_index_valid_sync, RESET=> sreset,    CLK => CLK_HDROUT);
   s13: double_sync_vector port map(D => img_fwposition_o,  Q => img_fwposition_sync, CLK => CLK_HDROUT);
   
   -- Locate hdr stream information and extract it
   hdr_extract: process(CLK_STREAM)
   begin
      if rising_edge(CLK_STREAM) then
         if sreset = '1' then
            img_width_o <= IMG_WIDTH_DEF;
            img_height_o <= IMG_HEIGHT_DEF;
            img_hdr_len_o <= IMF_HDR_LEN_DEF;
            img_exposuretime_o <= IMG_EXPOSURE_DEF;
            img_offsetx_o <= IMG_OFFSETX_DEF;
            img_offsety_o <= IMG_OFFSETY_DEF;
            img_ehdriindex_o <= IMG_EHDRIINDEX_DEF;
            cal_block_index_o <= CAL_BLOCK_INDEX_DEF;
            img_fwposition_o <= IMG_FWPOSITION_DEF;

            hdr_info_valid_o <= '0';
            cal_block_index_valid_o <= '0';
            uHdr_addr_loc8 <= (others => '0');
            tid <= '1';
         else
            
            if(IMG_DATA_MISO.TREADY = '1' and IMG_DATA_MOSI.TVALID = '1' and tid = '1') then-- we are in a valid hdr transmit
               
               if (IMG_DATA_MOSI.TLAST = '1') then
                  if ((unsigned(img_hdr_len_o) - 2) = uHdr_addr_loc8) then
                      uHdr_addr_loc8 <= (others => '0');
                      hdr_info_valid_o <= '1';
                      tid <= not tid;
                  end if;
               else
                  uHdr_addr_loc8 <= uHdr_addr_loc8 + 2;
               end if;
               
               case std_logic_vector(uHdr_addr_loc8) is
                  
                  when resize(WidthAdd8, uHdr_addr_loc8'length) =>
                     img_width_o    <= IMG_DATA_MOSI.TDATA;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_fwposition_o <= img_fwposition_o;

                  when resize(HeightAdd8, uHdr_addr_loc8'length) =>
                     img_height_o   <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_fwposition_o <= img_fwposition_o;
                  
                  when resize(OffsetXAdd8, uHdr_addr_loc8'length) =>
                     img_offsetx_o    <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_fwposition_o <= img_fwposition_o;

                  when resize(OffsetYAdd8, uHdr_addr_loc8'length) =>
                     img_offsety_o    <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_fwposition_o <= img_fwposition_o;
                  
                  when resize(ImageHeaderLengthAdd8, uHdr_addr_loc8'length) =>
                     img_hdr_len_o  <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_fwposition_o <= img_fwposition_o;
                  
                  when resize(ExposureTimeAdd8, uHdr_addr_loc8'length) =>
                     img_exposuretime_o(15 downto 0) <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_fwposition_o <= img_fwposition_o;

                  when resize(std_logic_vector(unsigned(ExposureTimeAdd8) + 2), uHdr_addr_loc8'length) =>
				  	      img_exposuretime_o(31 downto 16) <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_fwposition_o <= img_fwposition_o;
                  
                  when resize(FWPositionAdd8, uHdr_addr_loc8'length) =>
                     img_fwposition_o <= IMG_DATA_MOSI.TDATA(7 downto 0);
				  	      img_exposuretime_o <= img_exposuretime_o;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
				  
                  when others =>
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_fwposition_o <= img_fwposition_o;
                  
               end case;
               
               case (std_logic_vector(uHdr_addr_loc8 + 1)) is
                  
                  when resize(EHDRIExposureIndexAdd8, uHdr_addr_loc8'length) =>
                     img_ehdriindex_o    <= IMG_DATA_MOSI.TDATA(15 downto 8);
                     cal_block_index_o <= cal_block_index_o;
                     
                  when resize(CalibrationBlockIndexAdd8, uHdr_addr_loc8'length) =>
                     cal_block_index_o <= resize(IMG_DATA_MOSI.TDATA(15 downto 8), cal_block_index_o'length);
                     cal_block_index_valid_o <= '1';
                     img_ehdriindex_o <= img_ehdriindex_o;
                     
                  when others =>
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                  
               end case;
            elsif(IMG_DATA_MISO.TREADY = '1' and IMG_DATA_MOSI.TVALID = '1' and tid = '0' and IMG_DATA_MOSI.TLAST = '1') then
               tid <= not tid;
               hdr_info_valid_o <= '0';
               cal_block_index_valid_o <= '0';
        end if;
         end if;
      end if;
   end process hdr_extract;
   
end rtl;
