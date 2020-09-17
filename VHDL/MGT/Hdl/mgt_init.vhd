-------------------------------------------------------------------------------
--
-- Title       : mgt_init
-- Design      : FIR_00251
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00251-Common\VHDL\MGT\Hdl\mgt_init.vhd
-- Generated   : Mon Dec 16 09:19:50 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :  MGT initilization
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity mgt_init is
	 port(
		 DATA_USER_CLK : in STD_LOGIC;
		 INIT_CLK : in STD_LOGIC;
		 RESET : out STD_LOGIC;
		 GT_RESET : out STD_LOGIC
	     );
end mgt_init;

architecture RTL of mgt_init is

constant COUNT1_DEPTH : natural := 8;
constant COUNT2_DEPTH : natural := 10;

signal count1 : std_logic_vector(COUNT1_DEPTH downto 0) := (others => '0');
signal count2 : std_logic_vector(COUNT2_DEPTH downto 0) := (others => '0');
signal count1_en : std_logic;
signal count2_en : std_logic;
signal count2_start : std_logic;
signal count1_stop : std_logic;
signal count2_stop : std_logic;

begin
	
	-- GT_RESET counter
	count1_stop <= count1(COUNT1_DEPTH);
	count1_en <= not count1_stop;
	count1_proc: process (INIT_CLK)
	begin
   		if rising_edge(INIT_CLK) then
			if count1_en = '1' then
    			count1 <= std_logic_vector(unsigned(count1) + 1);
			end if;
   		end if;
	end process;
	
	-- GT_RESET generation
	GT_RESET <= '1' when count1_en = '1' else '0';


	-- RESET counter
	count2_stop <= count2(COUNT2_DEPTH);		  
	count2_start <= count1_stop;
	count2_en <= count2_start and not count2_stop;	
	count2_proc: process (DATA_USER_CLK)
	begin
   		if rising_edge(DATA_USER_CLK) then
			if count2_en = '1' then
    			count2 <= std_logic_vector(unsigned(count2) + 1);
			end if;
   		end if;
	end process;

	-- RESET generation
	RESET <= '1' when (count1_en = '1' or count2_en = '1') else '0';

end RTL;
