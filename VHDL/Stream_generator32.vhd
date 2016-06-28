-------------------------------------------------------------------------------
--
-- Title       : Stream_generator32
-- Design      : FIR_00251
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00251-Common\VHDL\Stream_generator32.vhd
-- Generated   : Thu Mar  6 11:12:39 2014
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
--{entity {Stream_generator32} architecture {Stream_generator32}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library work;
use work.tel2000.all;

entity Stream_generator32 is
   generic(
      WIDTH : std_logic_vector(31 downto 0) := x"0000FFFF"
   );
   port(
      CLK : in STD_LOGIC;
      AXI4S_MISO : in t_axi4_stream_miso;
      aresetn : in STD_LOGIC;
      AXI4S_MOSI : out t_axi4_stream_mosi32
   );
end Stream_generator32;

--}} End of automatically maintained section

architecture Stream_generator32 of Stream_generator32 is

   component SYNC_RESETN is
      port(
         CLK     : in std_logic;
         ARESETN : in std_logic;
         SRESETN : out std_logic
         );
   end component;
   
   signal sresetn : std_logic;

signal data_to_send : std_logic_vector(31 downto 0);
signal cnt_end : std_logic;
signal cnt : unsigned(31 downto 0);


begin

sync_resetn_inst : sync_resetn port map(ARESETN => aresetn, SRESETN => sresetn, CLK => CLK);

   -- enter your statements here --
process(CLK)
begin
   if rising_edge(CLK) then
      if sresetn = '0' then
         AXI4S_MOSI.tvalid <= '0';
      else
         if AXI4S_MISO.tready = '1' then
            AXI4S_MOSI.tdata <= data_to_send;
            AXI4S_MOSI.tvalid <= '1';
            AXI4S_MOSI.tkeep <= (others => '1');
            AXI4S_MOSI.tstrb <= (others => '1');
            AXI4S_MOSI.tuser <= (others => '0');
            AXI4S_MOSI.tid <= (others => '0');
            AXI4S_MOSI.TDEST <= (others => '0');
            if cnt_end = '1' then
               AXI4S_MOSI.tlast <= '1';
            else
               AXI4S_MOSI.tlast <= '0';
            end if;
         end if;
      end if;
   end if;
end process;

process(CLK)
begin
   if rising_edge(CLK) then
      if sresetn = '0' then
         cnt_end <= '0';
         data_to_send <= (others => '0');
         cnt <= (others => '0');
      else
         if AXI4S_MISO.tready = '1' then
            data_to_send <= std_logic_vector(cnt);
            cnt <= cnt + 1;
         end if;
         
         if cnt = unsigned(WIDTH) then 
            cnt_end <= '1';
         else
            cnt_end <= '0';
         end if;
         
         if cnt >= unsigned(WIDTH) then
            cnt <= (others => '0');
         end if;
      end if;
   end if;
end process;


end Stream_generator32;
