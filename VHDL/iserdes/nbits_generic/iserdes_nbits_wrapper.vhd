-------------------------------------------------------------------------------
--
-- Title       : iserdes_nbits_wrapper
-- Design      : FIR_00251
-- Author      : ALA
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- File        : iserdes_nbits_wrapper.vhd
-- Generated   : Thu Sep 21 14:00:15 2023
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
--{entity {iserdes_nbits_wrapper} architecture {rtl}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library	WORK;
use WORK.TEL2000.all;

entity iserdes_nbits_wrapper is
	generic (
		IOBDELAY : string := "NONE"; -- "IBUF" or "NONE"
		DATA_WIDTH : positive := 8
	);
	
	port (
		BITSLIP : in std_logic;
		CLK : in std_logic;
		CLKB : in std_logic;
		CLKDIV : in std_logic;
		D : in std_logic;
		DDLY : in std_logic;
		RST : in std_logic;
		O : out std_logic;
		Q : out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
end iserdes_nbits_wrapper;

--}} End of automatically maintained section

architecture rtl of iserdes_nbits_wrapper is
	function greatest_divisor (constant WIDTH : in positive) return integer is
		variable DIVISOR : integer;
	begin
		if (WIDTH mod 8) = 0 then
			DIVISOR := 8;
		elsif (WIDTH mod 7) = 0 then
			DIVISOR := 7;
		elsif (WIDTH mod 6) = 0 then
			DIVISOR := 6;
		elsif (WIDTH mod 5) = 0 then
			DIVISOR := 5;
		elsif (WIDTH mod 4) = 0 then
			DIVISOR := 4;
		elsif (WIDTH mod 3) = 0 then
			DIVISOR := 3;
		elsif (WIDTH mod 2) = 0 then
			DIVISOR := 2;
		else
			DIVISOR := 0;
			report "No valid divisor, width not supported" severity error;
		end if;
		
		return DIVISOR;
	end greatest_divisor;
	
	constant SERDES_WIDTH : integer := greatest_divisor(DATA_WIDTH);
	constant PIPELINE_STAGE_COUNT : natural := DATA_WIDTH / SERDES_WIDTH - 1;
	constant BITSLIP_INIT_COUNT : natural := min(2, SERDES_WIDTH - 1);
	
	type pipeline is array (0 to PIPELINE_STAGE_COUNT) of std_logic_vector(SERDES_WIDTH - 1 downto 0);
	signal SERDES_PIPELINE : pipeline;
	signal SERDES_OUTPUT : std_logic_vector(7 downto 0);
	
	signal CLOCK_CNT : natural range 0 to PIPELINE_STAGE_COUNT := 0;
	
	signal BITSLIP_SIG : std_logic;
	signal BITSLIP_LST : std_logic := '0';
	signal BITSLIP_CNT : natural range 0 to SERDES_WIDTH - 1 := BITSLIP_INIT_COUNT;
	
	signal PIPESLIP_CNT : natural range 0 to PIPELINE_STAGE_COUNT := 0;
	
	signal Q_SIG : std_logic_vector(Q'range);
	
	component iserdes_wrapper
		generic (
			IOBDELAY : string := "NONE"; -- "IBUF" or "NONE"
			DATA_WIDTH : integer := 7 -- Q8 est open si DATA_WIDTH = 7
		);
		port (
			BITSLIP : in std_ulogic;
			CLK : in std_ulogic;
			CLKB : in std_ulogic;
			CLKDIV : in std_ulogic;
			D : in std_ulogic;
			DDLY : in std_ulogic;
			RST : in std_ulogic;
			O : out std_ulogic;
			Q1 : out std_ulogic;
			Q2 : out std_ulogic;
			Q3 : out std_ulogic;
			Q4 : out std_ulogic;
			Q5 : out std_ulogic;
			Q6 : out std_ulogic;
			Q7 : out std_ulogic;
			Q8 : out std_ulogic
		);
	end component;
begin
	iserdes_wrapper_inst : iserdes_wrapper
	generic map (
		IOBDELAY =>	IOBDELAY,
		DATA_WIDTH => SERDES_WIDTH
	)
	port map (
		BITSLIP => BITSLIP_SIG,
		CLK => CLK,
		CLKB =>	CLKB,
		CLKDIV => CLKDIV,
		D => D,
		DDLY =>	DDLY,
		RST => RST,
		O => O,
		Q1 => SERDES_OUTPUT(0),
		Q2 => SERDES_OUTPUT(1),
		Q3 => SERDES_OUTPUT(2),
		Q4 => SERDES_OUTPUT(3),
		Q5 => SERDES_OUTPUT(4),
		Q6 => SERDES_OUTPUT(5),
		Q7 => SERDES_OUTPUT(6),
		Q8 => SERDES_OUTPUT(7)
	);
	
	SERDES_PIPELINE(0) <= SERDES_OUTPUT(SERDES_WIDTH - 1 downto 0);
	pipeline_proc : process (CLKDIV, RST)
	begin
		if RST = '1' then
			SERDES_PIPELINE(1 to PIPELINE_STAGE_COUNT) <= (others => (others => '0'));
		elsif rising_edge(CLKDIV) then
			SERDES_PIPELINE(1 to PIPELINE_STAGE_COUNT) <= SERDES_PIPELINE(0 to PIPELINE_STAGE_COUNT - 1);
		end if;
	end process;
	pipeline_gen : for I in 0 to PIPELINE_STAGE_COUNT generate
		Q_SIG((I + 1) * SERDES_WIDTH - 1 downto I * SERDES_WIDTH) <= SERDES_PIPELINE(I);
	end generate;
	
	clock_proc : process (CLKDIV, RST)
	begin
		if RST = '1' then
			CLOCK_CNT <= 0;
		elsif rising_edge(CLKDIV) then
			if CLOCK_CNT = PIPELINE_STAGE_COUNT	then
				CLOCK_CNT <= 0;
			else
				CLOCK_CNT <= CLOCK_CNT + 1;
			end if;
		end if;
	end process;
	
	BITSLIP_SIG <= BITSLIP when CLOCK_CNT = PIPESLIP_CNT and BITSLIP_LST = '0' else '0';
	slip_proc : process (CLKDIV, RST)
	begin
		if RST = '1' then
			BITSLIP_LST <= '0';
			BITSLIP_CNT <= BITSLIP_INIT_COUNT;
			PIPESLIP_CNT <= 0;
		elsif rising_edge(CLKDIV) then
			BITSLIP_LST <= BITSLIP_SIG;
			
			if BITSLIP_SIG = '1' then
				if BITSLIP_CNT = SERDES_WIDTH - 1 then
					BITSLIP_CNT <= 0;
					
					if PIPESLIP_CNT = PIPELINE_STAGE_COUNT then
						PIPESLIP_CNT <= 0;
					else
						PIPESLIP_CNT <= PIPESLIP_CNT + 1;
					end if;
				else
					BITSLIP_CNT <= BITSLIP_CNT + 1;
				end if;
			end if;
		end if;
	end process;
	
	q_proc : process (CLKDIV, RST)
	begin
		if RST = '1' then
			Q <= (others => '0');
		elsif rising_edge(CLKDIV) then
			if CLOCK_CNT = PIPESLIP_CNT and BITSLIP_LST = '0' then
				Q <= Q_SIG;
			end if;
		end if;
	end process;
end rtl;
