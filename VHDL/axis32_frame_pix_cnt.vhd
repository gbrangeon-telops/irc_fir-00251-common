------------------------------------------------------------------
--!   @file axis32_frame_pix_cnt.vhd
--!   @brief Count the number of pixels in frame.
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL: http://einstein/svn/firmware/FIR-00251-Common/branchs/2016-11-08%20Forrest%20Gump/VHDL/axis64_frame_rate.vhd $
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.TEL2000.all;

entity axis32_frame_pix_cnt is
   port(
      CLK         : in  STD_LOGIC;
      ARESETN     : in  STD_LOGIC;
      
      AXIS_MOSI   : in  t_axi4_stream_mosi32;
      AXIS_MISO   : in  t_axi4_stream_miso;
      
      MB_CLK      : in  STD_LOGIC;
      PIX_CNT     : out STD_LOGIC_VECTOR(31 downto 0);
      PIX_CNT_MIN : out STD_LOGIC_VECTOR(31 downto 0);
      PIX_CNT_MAX : out STD_LOGIC_VECTOR(31 downto 0)
   );
   attribute KEEP_HIERARCHY : string;
   attribute KEEP_HIERARCHY of axis32_frame_pix_cnt : entity is "true";

end axis32_frame_pix_cnt;

architecture rtl of axis32_frame_pix_cnt is

   component sync_resetn
      port(
         ARESETN : in  STD_LOGIC;
         SRESETN : out STD_LOGIC;
         CLK     : in  STD_LOGIC);
   end component;

   signal sresetn          : std_logic;
   signal pix_cnt_o        : unsigned(20 downto 0);   -- max 2097151 pix
   signal pix_cnt_min_o    : unsigned(pix_cnt_o'range);
   signal pix_cnt_max_o    : unsigned(pix_cnt_o'range);
   signal pix_cnt_mb       : unsigned(pix_cnt_o'range);
   signal pix_cnt_min_mb   : unsigned(pix_cnt_o'range);
   signal pix_cnt_max_mb   : unsigned(pix_cnt_o'range);
   
begin

	reset : sync_resetn port map(ARESETN => ARESETN, CLK => CLK, SRESETN => sresetn);
   
   PIX_CNT     <= std_logic_vector(resize(pix_cnt_mb, PIX_CNT'length));
   PIX_CNT_MIN <= std_logic_vector(resize(pix_cnt_min_mb, PIX_CNT_MIN'length));
   PIX_CNT_MAX <= std_logic_vector(resize(pix_cnt_max_mb, PIX_CNT_MAX'length));
   
   output : process(MB_CLK)
   begin
      if rising_edge(MB_CLK) then
         pix_cnt_mb <= pix_cnt_o;
         pix_cnt_min_mb <= pix_cnt_min_o;
         pix_cnt_max_mb <= pix_cnt_max_o;
      end if;
   end process;
   
   counter : process(CLK)
      variable pix_counter : unsigned(pix_cnt_o'range);
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then
            pix_counter := (others => '0');
            pix_cnt_o <= (others => '0');
            pix_cnt_min_o <= (others => '1');
            pix_cnt_max_o <= (others => '0');
         else
            
            if AXIS_MOSI.tvalid = '1' and AXIS_MISO.tready = '1' then
               -- Increment counter with number of pixels in this transaction
               increment : for i in 0 to AXIS_MOSI.tkeep'length/2-1 loop
                  if AXIS_MOSI.tkeep(2*i+1 downto 2*i) = "11" then
                     pix_counter := pix_counter + 1;
                  end if;
               end loop; 
               
               if AXIS_MOSI.tlast = '1' and AXIS_MOSI.tid = "0" then    -- ignore header tlast
                  -- Output results
                  pix_cnt_o <= pix_counter;
                  if pix_counter < pix_cnt_min_o then
                     pix_cnt_min_o <= pix_counter;
                  end if;
                  if pix_counter > pix_cnt_max_o then
                     pix_cnt_max_o <= pix_counter;
                  end if;
                  -- Reset counter
                  pix_counter := (others => '0');
               end if;
            end if;
            
         end if;
      end if;
   end process;

end rtl;
