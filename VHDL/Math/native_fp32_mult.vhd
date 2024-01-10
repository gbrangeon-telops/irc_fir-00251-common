-------------------------------------------------------------------------------
--
-- Title       : native_fp32_mult
-- Author      : JDE
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;
use work.tel2000.all;

entity native_fp32_mult is
    generic (
        IGNORE_RXA_ERR : boolean := false;
        IGNORE_RXB_ERR : boolean := false
    );
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      
      -- input A
      DIN_A      : in  std_logic_vector(31 downto 0);
      DIN_A_VAL  : in  std_logic;
      
      -- input B 
      DIN_B      : in  std_logic_vector(31 downto 0);
      DIN_B_VAL  : in  std_logic;
      
      -- output
      DOUT       : out std_logic_vector(31 downto 0);
      DOUT_VAL   : out std_logic;
      
      ERR        : out std_logic_vector(4 downto 0)
      
      );
end native_fp32_mult;


architecture RTL of native_fp32_mult is

   signal tx_tuser      : std_logic_vector(18 downto 0) := (others => '0');
   signal rxa_tready    : std_logic  := '0';
   signal rxb_tready    : std_logic  := '0';
   signal rxa_err       : std_logic  := '0';
   signal rxb_err       : std_logic  := '0';
   signal invalid_op    : std_logic  := '0';
   signal overflow      : std_logic  := '0';
   signal underflow     : std_logic  := '0';
   
   component ip_fp32_axis_mult
      port (
         aclk                 : in std_logic;
         aresetn              : in std_logic;
         s_axis_a_tvalid      : in std_logic;
         s_axis_a_tready      : out std_logic;
         s_axis_a_tdata       : in std_logic_vector(31 downto 0);
         s_axis_a_tuser       : in std_logic_vector(7 downto 0);
         s_axis_a_tlast       : in std_logic;
         s_axis_b_tvalid      : in std_logic;
         s_axis_b_tready      : out std_logic;
         s_axis_b_tdata       : in std_logic_vector(31 downto 0);
         s_axis_b_tuser       : in std_logic_vector(7 downto 0);
         s_axis_b_tlast       : in std_logic;
         m_axis_result_tvalid : out std_logic;
         m_axis_result_tready : in std_logic;
         m_axis_result_tdata  : out std_logic_vector(31 downto 0);
         m_axis_result_tuser  : out std_logic_vector(18 downto 0);
         m_axis_result_tlast  : out std_logic
         );
   end component;
   
begin                            
   
   ERR(4) <= rxb_err;
   ERR(3) <= rxa_err;
   ERR(2) <= invalid_op;
   ERR(1) <= overflow;
   ERR(0) <= underflow; 
   
   U1 : ip_fp32_axis_mult
   PORT MAP (
      aclk                 => CLK,
      aresetn              => ARESETN,
      s_axis_a_tvalid      => DIN_A_VAL,
      s_axis_a_tready      => rxa_tready,
      s_axis_a_tdata       => DIN_A,
      s_axis_a_tuser       => "00000000",
      s_axis_a_tlast       => '0',
      
      s_axis_b_tvalid      => DIN_B_VAL,
      s_axis_b_tready      => rxb_tready,
      s_axis_b_tdata       => DIN_B,
      s_axis_b_tuser       => "00000000",
      s_axis_b_tlast       => '0',
      
      m_axis_result_tvalid => DOUT_VAL,
      m_axis_result_tready => '1',
      m_axis_result_tdata  => DOUT,
      m_axis_result_tuser  => tx_tuser,
      m_axis_result_tlast  => open
      );
   
   U2 :  process(CLK)
   begin
      if rising_edge(CLK) then
         invalid_op <= tx_tuser(2);
         overflow <= tx_tuser(1);
         underflow <= tx_tuser(0); 
         if DIN_A_VAL = '1' and rxa_tready = '0' and IGNORE_RXA_ERR = false then 
            rxa_err <= '1';
         end if;
         if DIN_B_VAL = '1' and rxb_tready = '0' and IGNORE_RXB_ERR = false then 
            rxb_err <= '1';
         end if;
      end if;      
   end process; 
   
end RTL;
