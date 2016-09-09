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

entity hder_extractor is
   port(
      
      ARESET            : in std_logic;
      CLK_STREAM        : in std_logic;
      CLK_HDROUT        : in std_logic; 
      
      IMG_DATA_MOSI     : in t_axi4_stream_mosi32;
      IMG_DATA_MISO     : in t_axi4_stream_miso;
      
      -- 
      DECODED_HDR       : out decoded_hdr_type;
      
      HDR_INFO_VALID    : out std_logic;
      
      --Enter requiered hdr info here
      IMG_WIDTH         : out std_logic_vector(15 downto 0); 
      IMG_HEIGHT        : out std_logic_vector(15 downto 0); -- excluding hdr line
      
      IMG_HDR_LEN       : out std_logic_vector(15 downto 0); -- in pixel
      IMG_FWPOSITION    : out std_logic_vector(7 downto 0);
      IMG_NDFPOSITION    : out std_logic_vector(7 downto 0)
      
      );
   attribute dont_touch : string;
   attribute dont_touch of hder_extractor : entity is "yes";
end hder_extractor;


architecture rtl of hder_extractor is
   
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
   
   constant EXPOSURETIME_SIZE       : integer := 32;
   constant WIDTH_SIZE              : integer := 16;
   constant HEIGHT_SIZE             : integer := 16;
   constant OFFSETX_SIZE            : integer := 16;
   constant OFFSETY_SIZE            : integer := 16;
   constant IMAGEHEADERLENGTH_SIZE  : integer := 16;
   constant IMG_FWPOSITION_SIZE     : integer := 8;
   constant IMG_NDFPOSITION_SIZE    : integer := 8;
   
   -- Default value
   constant IMG_WIDTH_DEF : std_logic_vector(WIDTH_SIZE-1 downto 0) := std_logic_vector(to_unsigned(640,WIDTH_SIZE));
   constant IMG_HEIGHT_DEF : std_logic_vector(HEIGHT_SIZE-1  downto 0) := std_logic_vector(to_unsigned(512,HEIGHT_SIZE));
   constant IMF_HDR_LEN_DEF : unsigned(IMAGEHEADERLENGTH_SIZE-1  downto 0) := to_unsigned(0,IMAGEHEADERLENGTH_SIZE);
   constant IMG_EXPOSURE_DEF : std_logic_vector(EXPOSURETIME_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0,EXPOSURETIME_SIZE));
   constant IMG_FWPOSITION_DEF : std_logic_vector(IMG_FWPOSITION_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0,IMG_FWPOSITION_SIZE));
   constant IMG_NDFPOSITION_DEF : std_logic_vector(IMG_NDFPOSITION_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0,IMG_NDFPOSITION_SIZE));
   
   --Constant type cast
   --constant iWidthAdd32 : unsigned(15 downto 0) := TO_UNSIGNED(WidthAdd32,16);
   
   signal sreset: std_logic;
   signal hdr_info_valid_o : std_logic;
   
   signal uHdr_addr_loc32        : unsigned(12 downto 0);
   signal Hdr_addr_loc32         : std_logic_vector(12 downto 0);
   signal img_exposuretime_o     : std_logic_vector(EXPOSURETIME_SIZE-1 downto 0);
   signal img_width_o            : std_logic_vector(WIDTH_SIZE-1 downto 0);
   signal img_height_o           : std_logic_vector(HEIGHT_SIZE-1  downto 0);
   signal img_offsetx_o          : std_logic_vector(15 downto 0);
   signal img_offsety_o          : std_logic_vector(15 downto 0);
   signal img_FWPosition_o       : std_logic_vector(7 downto 0);
   signal img_NDFPosition_o       : std_logic_vector(7 downto 0);
   signal img_hdr_len_o          : unsigned(IMAGEHEADERLENGTH_SIZE-1  downto 0);	--in bytes
   signal test                   : unsigned(IMAGEHEADERLENGTH_SIZE-1  downto 0);
   signal tid                    : std_logic := '1';

   signal hder_info_valid_sync   : std_logic;
   signal img_exposuretime_sync  : std_logic_vector(img_exposuretime_o'length-1 downto 0);
   signal img_width_sync         : std_logic_vector(img_width_o'length-1 downto 0);
   signal img_height_sync        : std_logic_vector(img_height_o'length-1 downto 0);
   signal img_offsetx_sync       : std_logic_vector(img_offsetx_o'length-1 downto 0);
   signal img_offsety_sync       : std_logic_vector(img_offsety_o'length-1 downto 0);
   signal img_FWPosition_sync    : std_logic_vector(img_FWPosition_o'length-1 downto 0);
   signal img_NDFPosition_sync    : std_logic_vector(img_NDFPosition_o'length-1 downto 0);
   
   --signal iHdr_addr_loc32:integer ;
begin
   
   -- outputs (legacy)
   IMG_WIDTH <= img_width_sync;
   IMG_HEIGHT <= img_height_sync;
   HDR_INFO_VALID <= hder_info_valid_sync;
   IMG_FWPOSITION <= img_FWPosition_sync;
   IMG_NDFPOSITION <= img_NDFPosition_sync;
   
   -- single output
   DECODED_HDR.DVAL             <= hder_info_valid_sync;
   DECODED_HDR.EXPOSURE_TIME    <= unsigned(img_exposuretime_sync);
   DECODED_HDR.WIDTH   <= unsigned(img_width_sync);
   DECODED_HDR.HEIGHT  <= unsigned(img_height_sync);
   DECODED_HDR.OFFSETX <= unsigned(img_offsetx_sync);
   DECODED_HDR.OFFSETY <= unsigned(img_offsety_sync);
   DECODED_HDR.FW_POSITION <= unsigned(img_FWPosition_sync);
   DECODED_HDR.NDF_POSITION <= unsigned(img_NDFPosition_sync);
   
   --Reset management
   r0: sync_reset port map(ARESET => ARESET, CLK => CLK_STREAM, SRESET => sreset);
   
   --Signal sync crossing
   s3 : double_sync_vector port map(D => img_width_o,    Q => img_width_sync,      CLK => CLK_HDROUT);
   s4 : double_sync_vector port map(D => img_height_o,   Q => img_height_sync,     CLK => CLK_HDROUT);
   s5 : double_sync_vector port map(D => std_logic_vector(img_hdr_len_o),  Q => IMG_HDR_LEN,    CLK => CLK_HDROUT);
   s6 : double_sync port map(D => hdr_info_valid_o,  Q => hder_info_valid_sync, RESET=>sreset,    CLK => CLK_HDROUT);
   s7 : double_sync_vector port map(D => img_offsetx_o,   Q => img_offsetx_sync,     CLK => CLK_HDROUT);
   s8 : double_sync_vector port map(D => img_offsety_o,   Q => img_offsety_sync,     CLK => CLK_HDROUT);
   s9 : double_sync_vector port map(D => img_exposuretime_o,   Q => img_exposuretime_sync,     CLK => CLK_HDROUT);
   s10 : double_sync_vector port map(D => img_FWPosition_o, Q => img_FWPosition_sync,    CLK => CLK_HDROUT);
   s11 : double_sync_vector port map(D => img_NDFPosition_o, Q => img_NDFPosition_sync,    CLK => CLK_HDROUT);
   
   Hdr_addr_loc32 <= std_logic_vector(uHdr_addr_loc32); --type change
   -- Locate hdr stream information and extract it
   hdr_extract: process(CLK_STREAM)
   begin
      if rising_edge(CLK_STREAM) then
         if sreset = '1' then
            img_width_o <= IMG_WIDTH_DEF;
            img_height_o <= IMG_HEIGHT_DEF;
            img_hdr_len_o <= IMF_HDR_LEN_DEF;
            img_exposuretime_o <= IMG_EXPOSURE_DEF;
            img_FWPosition_o <= IMG_FWPOSITION_DEF;
            img_NDFPosition_o <= IMG_NDFPOSITION_DEF;
         else
            
            if(IMG_DATA_MISO.TREADY = '1' and IMG_DATA_MOSI.TVALID = '1' and tid = '1') then-- we are in a valid hdr transmit
               
               case Hdr_addr_loc32 is
                  
                  when resize(WidthAdd32,13) =>  --  WidthAdd32=0x08 and HeightAdd32=0x08
                     --img_width_o    <= IMG_DATA_MOSI.TDATA(WIDTH_SIZE+WIDTHSHIFT-1 downto WIDTHSHIFT);
                     --img_height_o   <= IMG_DATA_MOSI.TDATA(HEIGHT_SIZE+HEIGHTSHIFT-1 downto HEIGHTSHIFT);
                     img_width_o    <= IMG_DATA_MOSI.TDATA(HEIGHT_SIZE+HEIGHTSHIFT-1 downto HEIGHTSHIFT); --temp DEBUG
                     img_height_o   <= IMG_DATA_MOSI.TDATA(WIDTH_SIZE+WIDTHSHIFT-1 downto WIDTHSHIFT); --temp
                     img_hdr_len_o  <= img_hdr_len_o;
                  
                  when resize(OffsetXAdd32,13) =>
                     img_offsetx_o    <= IMG_DATA_MOSI.TDATA(OFFSETX_SIZE + OffsetXShift - 1 downto OffsetXShift);
                     img_offsety_o    <= IMG_DATA_MOSI.TDATA(OFFSETY_SIZE + OffsetYShift - 1 downto OffsetYShift);
                  
                  when resize(ImageHeaderLengthAdd32,13) => --ImageHeaderLengthAdd32=0x01
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_hdr_len_o  <= unsigned(IMG_DATA_MOSI.TDATA(IMAGEHEADERLENGTH_SIZE-1 downto 0));
                     --Add other case decoder below
                     -- when  => 
                     -- frame_width_o  <= frame_width_o;
                     -- frame_height_o <= frame_height_o;
                     -- img_width_o    <= img_width_o;
                     -- img_height_o   <= img_height_o;
                  -- img_hdr_len_o  <= img_hdr_len_o;
                  
                  when resize(ExposureTimeAdd32,13) => --ExposureTimeAdd32=0x06
                     img_exposuretime_o    <= IMG_DATA_MOSI.TDATA(EXPOSURETIME_SIZE-1 downto 0);
  
                  when resize(FWPositionAdd32,13) =>   --FWPositionAdd32=0x20
                     img_FWPosition_o    <= IMG_DATA_MOSI.TDATA(IMG_FWPosition_SIZE - 1 downto 0); -- FTA: FWPositionShift non valide dans img_header_define.vhd
                     img_NDFPosition_o    <= IMG_DATA_MOSI.TDATA((IMG_NDFPOSITION_SIZE + 16) - 1 downto 16);
                     
                     
                  when others =>
                     img_width_o    <= img_width_o;
                     img_height_o   <= img_height_o;
                     img_hdr_len_o  <= img_hdr_len_o;
                     img_FWPosition_o <= img_FWPosition_o;
                  
               end case;
               
            end if;
         end if;
      end if;
   end process hdr_extract;
   
   -- Locate hdr stream position
   hdr_position: process(CLK_STREAM)
   begin
      if rising_edge(CLK_STREAM) then
         if sreset = '1' then
            hdr_info_valid_o <= '0';
            uHdr_addr_loc32 <= (others => '0');
            tid <= '1';

         else
            
            if(IMG_DATA_MISO.TREADY = '1' and IMG_DATA_MOSI.TVALID = '1'and tid = '1') then-- we are in a valid hdr transmit
               --manage hdr_location 
               --if tlast reset the counter else increment, we start at addr 0

               if(IMG_DATA_MOSI.TLAST = '1' and (shift_right(img_hdr_len_o,2)-1 = uHdr_addr_loc32) ) then  --we divide by 4 because im_hdr_len is in bytes and uhdr_addr_loc is in 32 bit
                  uHdr_addr_loc32 <= (others => '0');
                  hdr_info_valid_o <= '1';
                  tid <= not tid;
               else
                  uHdr_addr_loc32 <= uHdr_addr_loc32 + 1;
                  hdr_info_valid_o <= '0';
               end if;
            elsif(IMG_DATA_MISO.TREADY = '1' and IMG_DATA_MOSI.TVALID = '1'and tid = '0' and IMG_DATA_MOSI.TLAST = '1') then
               tid <= not tid;
            end if;
         end if;
      end if;
   end process hdr_position;
   
end rtl;
