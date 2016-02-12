---------------------------------------------------------------------------------------------------
--  Copyright (c) Telops Inc. 2015
--
--  File: shift_registers_x.vhd
--  Use: Delay the signal by the generic value 
--  By: Jean-Alexis Boulet
--
--  $Revision$
--  $Author$
--  $LastChangedDate$
--
---------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity shift_registers_x is
    generic(
        delay_m1 : integer := 0
    );
    port(
        CLK : in std_logic;
        SI : in std_logic;
        SO : out std_logic);
end shift_registers_x;

architecture archi of shift_registers_x is
    signal tmp: std_logic_vector(32 downto 0) := (others => '0');
begin

    process (CLK)
    begin
        if (CLK'event and CLK='1') then
            for i in 0 to delay_m1 loop
                tmp(i+1) <= tmp(i);
            end loop;
            tmp(0) <= SI;
        end if;
    end process;

    SO <= tmp(delay_m1);

end archi;
