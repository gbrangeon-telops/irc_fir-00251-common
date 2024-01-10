-------------------------------------------------------------------------------
--
-- Title       : native_fi32tofp32
-- Author      : JDE
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;
use work.tel2000.all;

entity native_fi32tofp32 is
   generic(
      input_signed  : boolean := false;
      input_efflen  : natural := 12     -- largeur effective des données en entrée
      );
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      DIN        : in  std_logic_vector(31 downto 0);
      DIN_VAL    : in  std_logic;
      DOUT       : out std_logic_vector(31 downto 0);
      DOUT_VAL   : out std_logic
      );
end native_fi32tofp32;


architecture RTL of native_fi32tofp32 is
   
   component ip_axis_fi32tofp32
      port (
         aclk : in std_logic;
         aresetn : in std_logic;
         s_axis_a_tvalid : in std_logic;
         s_axis_a_tready : out std_logic;
         s_axis_a_tdata : in std_logic_vector(31 downto 0);
         s_axis_a_tuser : in std_logic_vector(7 downto 0);
         s_axis_a_tlast : in std_logic;
         m_axis_result_tvalid : out std_logic;
         m_axis_result_tready : in std_logic;
         m_axis_result_tdata : out std_logic_vector(31 downto 0);
         m_axis_result_tuser : out std_logic_vector(7 downto 0);
         m_axis_result_tlast : out std_logic
         );
   end component;
 
   signal data_in       : std_logic_vector(31 downto 0);
   
begin
   
   signed_case: if input_signed generate
      begin
      data_in <= std_logic_vector(to_signed(to_integer(signed(DIN(input_efflen-1 downto 0))), data_in'length));     
   end generate;
   
   unsigned_case: if not input_signed generate
      begin
      data_in <= std_logic_vector(to_unsigned(to_integer(unsigned(DIN(input_efflen-1 downto 0))), data_in'length));     
   end generate;
   
   U1 : ip_axis_fi32tofp32
   PORT MAP (
      aclk                 => CLK,
      aresetn              => ARESETN,
      s_axis_a_tvalid      => DIN_VAL,
      s_axis_a_tready      => open,
      s_axis_a_tdata       => data_in,
      s_axis_a_tuser       => "00000000",
      s_axis_a_tlast       => '0',
      m_axis_result_tvalid => DOUT_VAL,
      m_axis_result_tready => '1',
      m_axis_result_tdata  => DOUT,
      m_axis_result_tuser  => open,
      m_axis_result_tlast  => open
      );
   
end RTL;
