-------------------------------------------------------------------------------
--
-- Title       : PWM_GEN
-- Design      : fan_tb
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00251-Common\VHDL\FAN_CTRL\simulations\src\PWM_GEN.vhd
-- Generated   : Wed Feb 12 09:05:57 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :  This generate the  PWM controler and 3 PWM output
--                Freq PWM = PWM_CLK  /  2^PWM_SIZE
--                Duty cycle high (%)= DATA / 2^PWM_SIZE * 100
--
-------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.all;

library work;
use work.tel2000.all;
use work.gh_pwm;

entity PWM_GEN_1 is
   generic(
     PWM_SIZE : integer := 12
   );
   port(
     AXIL_MOSI : in T_AXI4_LITE_MOSI;
     AXIL_MISO : out T_AXI4_LITE_MISO;
     PWM : out STD_LOGIC_VECTOR(0 downto 0);
     
     --
     ARESET : in STD_LOGIC;
     AXI_CLK : in STD_LOGIC;
     PWM_CLK : in STD_LOGIC
     
	  );
end PWM_GEN_1;



architecture PWM_GEN_1 of PWM_GEN_1 is

component gh_PWM is
   generic(size : INTEGER := 8);
	port(
		clk      : in STD_LOGIC;
		rst      : in STD_LOGIC;
		d_format : in STD_LOGIC:='0'; -- '0' = two's comp   '1' = offset binary
		DATA     : in STD_LOGIC_VECTOR(size-1 downto 0);
		PWMo     : out STD_LOGIC;
		ND       : out STD_LOGIC -- New Data sample strobe
		);   
end component gh_PWM;

component PWM_CTRL is
   generic( 
      PWM_SIZE : integer :=12
   );
        
   port(
      CLK : in STD_LOGIC; --! Clock at 100MHz
      ARESETN : in STD_LOGIC; --! Reset active low
       
		 --! Interface to access registers
      AXI4_LITE_MOSI : in t_axi4_lite_mosi; 
      AXI4_LITE_MISO : out t_axi4_lite_miso;

      --! PWM Signals
      DATA_OUT0 : out std_logic_vector((PWM_SIZE-1) downto 0);
      DATA_OUT1 : out std_logic_vector((PWM_SIZE-1) downto 0);
      DATA_OUT2 : out std_logic_vector((PWM_SIZE-1) downto 0)
   );
end component PWM_CTRL;



signal data_out0_s : std_logic_vector((PWM_SIZE-1) downto 0);

signal aresetn : std_logic;

begin
   
   aresetn <= not ARESET;
   
   
   fan_ctrl_inst :  component PWM_CTRL 
   generic map(
      PWM_SIZE => PWM_SIZE
   )
   port map(
      CLK  => AXI_CLK,
      ARESETN => aresetn,
       
      AXI4_LITE_MOSI => AXIL_MOSI,
      AXI4_LITE_MISO => AXIL_MISO,

      --! PWM Signals
      DATA_OUT0 => data_out0_s
   );
   
   pwm0 : component gh_pwm
   generic map(
   size => PWM_SIZE
   )
   port map(
   	clk => PWM_CLK,
		rst => ARESET,
		d_format => '1',
		DATA => data_out0_s,
		PWMo => PWM(0)--,
		--ND => 
   );


end PWM_GEN_1;
