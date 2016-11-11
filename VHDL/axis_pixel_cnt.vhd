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
use work.TEL2000.all;

entity axis_pixel_cnt is
	 port(
		 CLK : in STD_LOGIC;
		 ARESETN : in STD_LOGIC;
       AXIS_MOSI : in t_axi4_stream_mosi32;
       AXIS_MISO : in t_axi4_stream_miso;
		 CNT_RESET : in STD_LOGIC;
		 PIXEL_CNT : out STD_LOGIC_VECTOR(31 downto 0)
	     );
        attribute KEEP_HIERARCHY : string;
        attribute KEEP_HIERARCHY of axis_pixel_cnt : entity is "yes";
end axis_pixel_cnt;

--}} End of automatically maintained section

architecture axis_pixel_cnt of axis_pixel_cnt is

   component sync_resetn
      port(
         ARESETN : in STD_LOGIC;
         SRESETN : out STD_LOGIC;
         CLK    : in STD_LOGIC);
   end component;

   signal sresetn : std_logic;
   signal cnt : unsigned(31 downto 0);
   
   
begin

	 -- enter your statements here --
   reset : sync_resetn
   port map(ARESETN => ARESETN, CLK => CLK, SRESETN => sresetn);
   
   counter : process(CLK)
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then
            cnt <= (others => '0');
         else
            if AXIS_MOSI.tvalid = '1' and AXIS_MISO.tready = '1' then
               if AXIS_MOSI.tlast = '1' then
                  cnt <= (others => '0');
               else
                  cnt <= cnt + 1;
               end if;
            end if;
         end if;
      end if;
   end process;
   
   PIXEL_CNT <= std_logic_vector(cnt);

end axis_pixel_cnt;
