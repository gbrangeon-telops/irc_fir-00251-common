------------------------------------------------------------------
--!   @file : axis16_hder_extractor.vhd
--!   @brief : extract important header information for downstream block
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
      
      ARESET            : in std_logic;
      CLK               : in std_logic; 
      
      IMG_DATA_MOSI     : in t_axi4_stream_mosi16;
      IMG_DATA_MISO     : in t_axi4_stream_miso;
      
      DECODED_HDR       : out decoded_hdr_type;
      CAL_BLOCK_INDEX   : out cal_block_index_type;
      CAL_BLOCK_INDEX_VALID : out std_logic
      
      );
   attribute KEEP_HIERARCHY : string;
   attribute KEEP_HIERARCHY of axis16_hder_extractor : entity is "yes";
end axis16_hder_extractor;


architecture rtl of axis16_hder_extractor is
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;
   
   signal sreset: std_logic;
   signal hdr_info_valid_o : std_logic;
   signal cal_block_index_valid_o : std_logic;
   
   
   signal img_exposuretime_o     : std_logic_vector(DECODED_HDR.exposure_time'range);
   signal img_width_o            : std_logic_vector(DECODED_HDR.width'range);
   signal img_height_o           : std_logic_vector(DECODED_HDR.height'range);
   signal img_offsetx_o          : std_logic_vector(DECODED_HDR.offsetx'range);
   signal img_offsety_o          : std_logic_vector(DECODED_HDR.offsety'range);
   signal img_FWPosition_o       : std_logic_vector(DECODED_HDR.fw_position'range);
   signal img_NDFPosition_o      : std_logic_vector(DECODED_HDR.ndf_position'range);
   signal img_ehdriindex_o       : std_logic_vector(DECODED_HDR.ehdri_index'range);
   signal cal_block_index_o      : std_logic_vector(CAL_BLOCK_INDEX'range);
   signal img_hdr_len_o          : unsigned(15 downto 0);	--in bytes
   signal uHdr_addr_loc8         : unsigned(15 downto 0);
   signal tid                    : std_logic := '1';
   
   
begin
   
   -- outputs
   CAL_BLOCK_INDEX <= cal_block_index_type(cal_block_index_o);
   CAL_BLOCK_INDEX_VALID <= cal_block_index_valid_o;
   
   DECODED_HDR.dval           <= hdr_info_valid_o;
   DECODED_HDR.exposure_time  <= img_exposuretime_o;
   DECODED_HDR.width          <= img_width_o;
   DECODED_HDR.height         <= img_height_o;
   DECODED_HDR.offsetx        <= img_offsetx_o;
   DECODED_HDR.offsety        <= img_offsety_o;
   DECODED_HDR.fw_position    <= img_FWPosition_o;
   DECODED_HDR.ndf_position   <= img_NDFPosition_o;
   DECODED_HDR.ehdri_index    <= img_ehdriindex_o;
   
   --Reset management
   r0: sync_reset port map(ARESET => ARESET, CLK => CLK, SRESET => sreset);
   
   
   -- Locate hdr stream information and extract it
   hdr_extract: process(CLK)
   begin
      if rising_edge(CLK) then
         if sreset = '1' then
            hdr_info_valid_o <= '0';
            cal_block_index_valid_o <= '0';
            uHdr_addr_loc8 <= (others => '0');
            tid <= '1';
            img_hdr_len_o <= (others => '0');
         else
            
            if(IMG_DATA_MISO.TREADY = '1' and IMG_DATA_MOSI.TVALID = '1' and tid = '1') then-- we are in a valid hdr transmit
               
               if (IMG_DATA_MOSI.TLAST = '1') then
                  if ((img_hdr_len_o - 2) = uHdr_addr_loc8) then
                      uHdr_addr_loc8 <= (others => '0');
                      hdr_info_valid_o <= '1';
                      tid <= not tid;
                  end if;
               else
                  uHdr_addr_loc8 <= uHdr_addr_loc8 + 2;
               end if;
               
               case std_logic_vector(uHdr_addr_loc8) is
                  
                  -- NE PAS UTILISER LES MASK ET LES SHIFT DE IMG_HEADER_DEFINE
                  -- Dans un mot de 16b, les champs sont en ordre de lsb à msb
                  
                  when resize(ImageHeaderLengthAdd8, uHdr_addr_loc8'length) =>
                     img_hdr_len_o  <= unsigned(IMG_DATA_MOSI.TDATA);
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
                     img_NDFPosition_o <= img_NDFPosition_o;
                  
                  when resize(ExposureTimeAdd8, uHdr_addr_loc8'length) =>
                     img_exposuretime_o(15 downto 0) <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
                     img_NDFPosition_o <= img_NDFPosition_o;

                  when resize(std_logic_vector(unsigned(ExposureTimeAdd8) + 2), uHdr_addr_loc8'length) =>
				  	      img_exposuretime_o(31 downto 16) <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
                     img_NDFPosition_o <= img_NDFPosition_o;
                  
                  when resize(WidthAdd8, uHdr_addr_loc8'length) =>
                     img_width_o    <= IMG_DATA_MOSI.TDATA;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
                     img_NDFPosition_o <= img_NDFPosition_o;

                  when resize(HeightAdd8, uHdr_addr_loc8'length) =>
                     img_height_o   <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
                     img_NDFPosition_o <= img_NDFPosition_o;
                  
                  when resize(OffsetXAdd8, uHdr_addr_loc8'length) =>
                     img_offsetx_o    <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
                     img_NDFPosition_o <= img_NDFPosition_o;

                  when resize(OffsetYAdd8, uHdr_addr_loc8'length) =>
                     img_offsety_o    <= IMG_DATA_MOSI.TDATA;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o  <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
                     img_NDFPosition_o <= img_NDFPosition_o;
                  
                  when resize(FWPositionAdd8, uHdr_addr_loc8'length) =>
                     img_FWPosition_o <= IMG_DATA_MOSI.TDATA(7 downto 0);
				  	      img_exposuretime_o <= img_exposuretime_o;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_NDFPosition_o <= img_NDFPosition_o;
                  
                  when resize(NDFilterPositionAdd8, uHdr_addr_loc8'length) =>
                     img_NDFPosition_o <= IMG_DATA_MOSI.TDATA(7 downto 0);
				  	      img_exposuretime_o <= img_exposuretime_o;
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
				  
                  when others =>
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_offsetx_o  <= img_offsetx_o;
                     img_offsety_o  <= img_offsety_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_exposuretime_o <= img_exposuretime_o;
                     img_ehdriindex_o <= img_ehdriindex_o;
                     cal_block_index_o <= cal_block_index_o;
                     img_FWPosition_o <= img_FWPosition_o;
                     img_NDFPosition_o <= img_NDFPosition_o;
                  
               end case;
               
               case (std_logic_vector(uHdr_addr_loc8 + 1)) is
                     
                  when resize(CalibrationBlockIndexAdd8, uHdr_addr_loc8'length) =>
                     cal_block_index_o <= resize(IMG_DATA_MOSI.TDATA(15 downto 8), cal_block_index_o'length);
                     cal_block_index_valid_o <= '1';
                     img_ehdriindex_o <= img_ehdriindex_o;
                  
                  when resize(EHDRIExposureIndexAdd8, uHdr_addr_loc8'length) =>
                     img_ehdriindex_o    <= IMG_DATA_MOSI.TDATA(15 downto 8);
                     cal_block_index_o <= cal_block_index_o;
                     
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
