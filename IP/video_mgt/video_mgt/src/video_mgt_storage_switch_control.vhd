------------------------------------------------------------------------------
-- (c) Copyright 2008 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
--
--  STORAGE_SWITCH_CONTROL
--
--
--
--  Description: STORAGE_SWITCH_CONTROL selects the input chunk for each storage chunk mux
--
--              This module supports 4 4-byte lane designs
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity video_mgt_STORAGE_SWITCH_CONTROL is

    port (

            LEFT_ALIGNED_COUNT : in std_logic_vector(0 to 2);
            STORAGE_COUNT      : in std_logic_vector(0 to 2);
            END_STORAGE        : in std_logic;
            START_WITH_DATA    : in std_logic;
            STORAGE_SELECT     : out std_logic_vector(0 to 19);
            USER_CLK           : in std_logic

         );

end video_mgt_STORAGE_SWITCH_CONTROL;

architecture RTL of video_mgt_STORAGE_SWITCH_CONTROL is

-- Parameter Declarations --

    constant DLY : time := 1 ns;

-- External Register Declarations --

    signal STORAGE_SELECT_Buffer : std_logic_vector(0 to 19);

-- Internal Register Declarations --

    signal end_r            : std_logic;
    signal lac_r            : std_logic_vector(0 to 2);
    signal stc_r            : std_logic_vector(0 to 2);
    signal storage_select_c : std_logic_vector(0 to 19);

-- Wire Declarations --

    signal overwrite_c   : std_logic;

    
   
begin

    STORAGE_SELECT <= STORAGE_SELECT_Buffer;

-- Main Body of Code --

    -- Combine the end signals.

    overwrite_c <= END_STORAGE or START_WITH_DATA;


    -- Generate switch signals --

    process (overwrite_c, LEFT_ALIGNED_COUNT, STORAGE_COUNT)

        variable vec : std_logic_vector(0 to 5);

    begin

        if (overwrite_c = '1') then

            storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

        else

            vec := LEFT_ALIGNED_COUNT & STORAGE_COUNT;

            case vec is

when "001000" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

when "001100" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

when "010000" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

when "010011" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(1,5);

when "010100" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

when "011000" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

when "011010" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(2,5);

when "011011" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(1,5);

when "011100" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

when "100000" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

when "100001" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(3,5);

when "100010" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(2,5);

when "100011" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(1,5);

when "100100" =>

storage_select_c(0 to 4) <= conv_std_logic_vector(0,5);

                when others =>

                    storage_select_c(0 to 4) <= (others => 'X');

            end case;

        end if;

    end process;


    process (overwrite_c, LEFT_ALIGNED_COUNT, STORAGE_COUNT)

        variable vec : std_logic_vector(0 to 5);

    begin

        if (overwrite_c = '1') then

            storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

        else

            vec := LEFT_ALIGNED_COUNT & STORAGE_COUNT;

            case vec is

when "001000" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

when "001001" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(0,5);

when "001100" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

when "010000" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

when "010001" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(0,5);

when "010011" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(2,5);

when "010100" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

when "011000" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

when "011001" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(0,5);

when "011010" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(3,5);

when "011011" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(2,5);

when "011100" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

when "100000" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

when "100010" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(3,5);

when "100011" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(2,5);

when "100100" =>

storage_select_c(5 to 9) <= conv_std_logic_vector(1,5);

                when others =>

                    storage_select_c(5 to 9) <= (others => 'X');

            end case;

        end if;

    end process;


    process (overwrite_c, LEFT_ALIGNED_COUNT, STORAGE_COUNT)

        variable vec : std_logic_vector(0 to 5);

    begin

        if (overwrite_c = '1') then

            storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

        else

            vec := LEFT_ALIGNED_COUNT & STORAGE_COUNT;

            case vec is

when "001000" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

when "001001" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(1,5);

when "001010" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(0,5);

when "001100" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

when "010000" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

when "010001" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(1,5);

when "010010" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(0,5);

when "010011" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(3,5);

when "010100" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

when "011000" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

when "011001" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(1,5);

when "011011" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(3,5);

when "011100" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

when "100000" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

when "100011" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(3,5);

when "100100" =>

storage_select_c(10 to 14) <= conv_std_logic_vector(2,5);

                when others =>

                    storage_select_c(10 to 14) <= (others => 'X');

            end case;

        end if;

    end process;


    process (overwrite_c, LEFT_ALIGNED_COUNT, STORAGE_COUNT)

        variable vec : std_logic_vector(0 to 5);

    begin

        if (overwrite_c = '1') then

            storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

        else

            vec := LEFT_ALIGNED_COUNT & STORAGE_COUNT;

            case vec is

when "001000" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

when "001001" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(2,5);

when "001010" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(1,5);

when "001011" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(0,5);

when "001100" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

when "010000" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

when "010001" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(2,5);

when "010010" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(1,5);

when "010100" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

when "011000" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

when "011001" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(2,5);

when "011100" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

when "100000" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

when "100100" =>

storage_select_c(15 to 19) <= conv_std_logic_vector(3,5);

                when others =>

                    storage_select_c(15 to 19) <= (others => 'X');

            end case;

        end if;

    end process;


    -- Register the storage select signals.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            STORAGE_SELECT_Buffer <= storage_select_c after DLY;

        end if;

    end process;

end RTL;
