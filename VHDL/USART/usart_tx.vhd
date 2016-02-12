----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This file contains the UART Transmitter.  This transmitter is able
-- to transmit 8 bits of serial data, one start bit, one stop bit,
-- and no parity bit.  When transmit is complete o_TX_Done will be
-- driven high for one clock cycle.
--
-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of i_Clk)/(Frequency of UART)
-- Example: 10 MHz Clock, 115200 baud UART
-- (10000000)/(115200) = 87
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity USART_TX is
  port (
    USART_CLK       : in  std_logic;
    TX_DV     : in  std_logic;
    TX_BYTE   : in  std_logic_vector(7 downto 0);
    TX_ACTIVE : out std_logic;
    TX_SERIAL : out std_logic;
    TX_DONE   : out std_logic
    );
end USART_TX;


architecture RTL of USART_TX is

  type t_SM_Main is (s_Idle, s_TX_Start_Bit, s_TX_Data_Bits,
                     s_TX_Stop_Bit, s_Cleanup);
  signal r_SM_Main : t_SM_Main := s_Idle;

  signal r_Bit_Index : integer range 0 to 7 := 0;  -- 8 Bits Total
  signal r_TX_Data   : std_logic_vector(7 downto 0) := (others => '0');
  signal r_TX_Done   : std_logic := '0';

    attribute keep : string; 
    attribute keep of r_SM_Main : signal is "TRUE";
    attribute keep of r_Bit_Index : signal is "TRUE";  
    attribute keep of r_TX_Data : signal is "TRUE";  
    attribute keep of r_TX_Done : signal is "TRUE";
    attribute keep of TX_ACTIVE : signal is "TRUE";  
    attribute keep of TX_SERIAL : signal is "TRUE";  
    attribute keep of TX_DONE : signal is "TRUE";
begin

  
  p_UART_TX : process (USART_CLK)
  begin
    if rising_edge(USART_CLK) then
        
      case r_SM_Main is

        when s_Idle =>
          TX_ACTIVE <= '0';
          TX_SERIAL <= '1';         -- Drive Line High for Idle
          r_TX_Done   <= '0';
          r_Bit_Index <= 0;

          if TX_DV = '1' then
            r_TX_Data <= TX_BYTE;
            r_SM_Main <= s_TX_Start_Bit;
            TX_ACTIVE <= '1';
          else
            r_SM_Main <= s_Idle;
          end if;

          
        -- Send out Start Bit. Start bit = 0
        when s_TX_Start_Bit =>
            TX_ACTIVE <= '1';
            TX_SERIAL <= '0';
            r_SM_Main   <= s_TX_Data_Bits;


          
        -- Wait g_CLKS_PER_BIT-1 clock cycles for data bits to finish          
        when s_TX_Data_Bits =>
            TX_SERIAL <= r_TX_Data(r_Bit_Index);
            -- Check if we have sent out all bits
            if r_Bit_Index < 7 then
                r_Bit_Index <= r_Bit_Index + 1;
                r_SM_Main   <= s_TX_Data_Bits;
            else
                r_Bit_Index <= 0;
                r_SM_Main   <= s_TX_Stop_Bit;
            end if;



        -- Send out Stop bit.  Stop bit = 1
        when s_TX_Stop_Bit =>
            TX_SERIAL <= '1';
            r_TX_Done   <= '1';
            r_SM_Main   <= s_Cleanup;

        -- Stay here 1 clock
        when s_Cleanup =>
          TX_ACTIVE <= '0';
          r_TX_Done   <= '1';
          r_SM_Main   <= s_Idle;
          
        when others =>
          r_SM_Main <= s_Idle;

      end case;
    end if;
  end process p_UART_TX;

  TX_DONE <= r_TX_Done;
  
end RTL;
