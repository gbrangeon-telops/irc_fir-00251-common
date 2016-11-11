-------------------------------------------------------------------------------
--
-- Title       : axis_pixel_cnt
-- Design      : fir-00251-camera
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : d:\Telops\FIR-00251-ALL\fir_00251_all\fir-00251-camera\src\axis_pixel_cnt.vhd
-- Generated   : Sun Mar 30 16:27:05 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {axis_pixel_cnt} architecture {axis_pixel_cnt}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_misc.all;
use work.TEL2000.all;

entity axis32_pixel_cnt is
   port(
      CLK : in STD_LOGIC;
      ARESETN : in STD_LOGIC;
      AXIS_MOSI : in t_axi4_stream_mosi32;
      AXIS_MISO : in t_axi4_stream_miso;
      CNT_RESET : in STD_LOGIC;
      PIXEL_CNT : out STD_LOGIC_VECTOR(31 downto 0)
      );
   attribute KEEP_HIERARCHY : string;
   attribute KEEP_HIERARCHY of axis32_pixel_cnt : entity is "true";
end axis32_pixel_cnt;

--}} End of automatically maintained section

architecture axis32_pixel_cnt of axis32_pixel_cnt is
   
   component sync_resetn
      port(
         ARESETN : in STD_LOGIC;
         SRESETN : out STD_LOGIC;
         CLK    : in STD_LOGIC);
   end component;
   
   signal sresetn : std_logic;
   signal cnt : unsigned(31 downto 0);
   signal cnt_prev_img : unsigned(31 downto 0);
   signal cnt_invalid : unsigned(31 downto 0);
   signal tlast : std_logic := '0';
   
   -- attribute MARK_DEBUG : string;
   -- attribute MARK_DEBUG of cnt : signal is "TRUE";
   -- attribute MARK_DEBUG of cnt_prev_img : signal is "TRUE";
   -- attribute MARK_DEBUG of cnt_invalid : signal is "TRUE";
   -- attribute MARK_DEBUG of tlast : signal is "TRUE";
   
--   attribute dont_touch : string;
--   attribute dont_touch of cnt             : signal is "true";
--   attribute dont_touch of cnt_prev_img    : signal is "true";
--   attribute dont_touch of cnt_invalid     : signal is "true";
--   attribute dont_touch of tlast           : signal is "true";
   
begin
   
   -- enter your statements here --
   reset : sync_resetn
   port map(ARESETN => ARESETN, CLK => CLK, SRESETN => sresetn);
   
   counter : process(CLK)
      variable inc : unsigned(31 downto 0) := (others => '0');
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then
            cnt_invalid <= (others => '0');
            cnt <= (others => '0');
            cnt_prev_img <= (others => '0');
            tlast <= '0';
         else
            inc := (others => '0');
            if AXIS_MOSI.tvalid = '1' and AXIS_MISO.tready = '1' then
               increment : for i in 0 to 1 loop
                  if AXIS_MOSI.TKEEP(2*i+1 downto 2*i) = "11" then
                     inc := inc + 1;
                  end if;
               end loop;
               
               if or_reduce(AXIS_MOSI.TKEEP) = '0' then
                  cnt_invalid <= cnt_invalid + 1;
               end if;
               
               if AXIS_MOSI.tlast = '1' then
                  tlast <= '1';
                  cnt_prev_img <= cnt + inc;
                  cnt <= (others => '0');
                  cnt_invalid <= (others => '0');
               else
                  cnt <= cnt + inc;
                  tlast <= '0';
               end if;
            end if;
         end if;
      end if;
   end process;
   
   PIXEL_CNT <= std_logic_vector(cnt);
   
end axis32_pixel_cnt;
