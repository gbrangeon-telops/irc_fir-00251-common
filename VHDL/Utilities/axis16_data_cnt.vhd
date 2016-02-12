-------------------------------------------------------------------------------
--
-- Title       : axis16_data_cnt
-- Design      : fir-00251-camera
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : d:\Telops\FIR-00251-ALL\fir_00251_all\fir-00251-camera\src\axis16_data_cnt.vhd
-- Generated   : Sun Mar 30 16:27:05 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :  compte les données reçus dans une trame delimitée par un TLAST
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.TEL2000.all;

entity axis16_data_cnt is
   port(
      CLK        : in std_logic;
      ARESETN    : in std_logic;
      RX_MOSI    : in t_axi4_stream_mosi16;
      RX_MISO    : in t_axi4_stream_miso;
      D16_CNT        : out std_logic_vector(31 downto 0);
      D16_CNT_DVAL   : out std_logic
      );
   attribute dont_touch : string;
   attribute dont_touch of axis16_data_cnt : entity is "yes";
end axis16_data_cnt;



architecture axis16_data_cnt of axis16_data_cnt is
   
   component sync_resetn
      port(
         ARESETN : in STD_LOGIC;
         SRESETN : out STD_LOGIC;
         CLK    : in STD_LOGIC);
   end component;
   
   signal sresetn    : std_logic;
   signal d16_cnt_i  : unsigned(31 downto 0);
   
   
begin
   
   -- enter your statements here --
   reset : sync_resetn
   port map(ARESETN => ARESETN, CLK => CLK, SRESETN => sresetn);
   
   counter : process(CLK)
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then
            d16_cnt_i <= to_unsigned(1, d16_cnt_i'length);
            D16_CNT_DVAL <=  '0';
         else
            
            D16_CNT_DVAL <=  '0';
            if RX_MISO.TREADY = '1' then             
               if RX_MOSI.TVALID = '1' then 
                  d16_cnt_i <= d16_cnt_i + 1;                  
                  if RX_MOSI.TLAST = '1' then
                     d16_cnt_i <= to_unsigned(1, d16_cnt_i'length);
                     D16_CNT_DVAL <=  '1';
                  end if;
               end if;               
            end if;
            
            D16_CNT <= std_logic_vector(d16_cnt_i);   
            
         end if; 
      end if;
   end process;
   
   
   
end axis16_data_cnt;
