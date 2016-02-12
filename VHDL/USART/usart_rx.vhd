----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This file contains the UART Receiver.  This receiver is able to
-- receive 8 bits of serial data, one start bit, one stop bit,
-- and no parity bit.  When receive is complete o_rx_dv will be
-- driven high for one clock cycle.
-- 
-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of i_Clk)/(Frequency of UART)
-- Example: 10 MHz Clock, 115200 baud UART
-- (10000000)/(115200) = 87
--
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity USART_RX is
  port (
    USART_CLK       : in  std_logic;
    RX_SERIAL : in  std_logic;
    RX_DV     : out std_logic;
    RX_BYTE   : out std_logic_vector(7 downto 0);
    STOP_BIT_ERROR : out std_logic;
    ARESETN     : in std_logic
    );
end USART_RX;


architecture rtl of USART_RX is

  type t_SM_Main is (s_Idle, s_RX_Start_Bit, s_RX_Data_Bits,
                     s_RX_Stop_Bit, s_Cleanup);
  signal r_SM_Main : t_SM_Main := s_Idle;

  signal r_RX_Data_R : std_logic := '0';
  signal r_RX_Data   : std_logic := '0';
  
  signal r_Bit_Index : integer range 0 to 7 := 0;  -- 8 Bits Total
  signal r_RX_Byte   : std_logic_vector(7 downto 0) := (others => '0');
  signal r_RX_DV     : std_logic := '0';
  
  signal stop_bit_error_o : std_logic := '0';
  
    attribute keep : string; 
   attribute keep of r_SM_Main : signal is "TRUE";  
   attribute keep of r_RX_Data_R : signal is "TRUE"; 
   attribute keep of r_RX_Data : signal is "TRUE"; 
   attribute keep of r_Bit_Index : signal is "TRUE";
    attribute keep of r_RX_Byte : signal is "TRUE"; 
    attribute keep of r_RX_DV : signal is "TRUE";
    attribute keep of RX_DV : signal is "TRUE"; 
    attribute keep of RX_BYTE : signal is "TRUE";     
  
begin

  -- Purpose: Double-register the incoming data.
  -- This allows it to be used in the UART RX Clock Domain.
  -- (It removes problems caused by metastabiliy)
  p_SAMPLE : process (USART_CLK)
  begin
    if rising_edge(USART_CLK) then
        if(ARESETN = '0') then
            r_RX_Data_R <= '1';
            r_RX_Data   <= '1';
        else
            r_RX_Data_R <= RX_SERIAL;
            r_RX_Data   <= r_RX_Data_R;    
        end if;
    end if;
  end process p_SAMPLE;
  
    STOP_BIT_ERROR <= stop_bit_error_o;
  
  -- Purpose: Control RX state machine
  p_USART_RX : process (USART_CLK)
  begin
    if rising_edge(USART_CLK) then
        if (ARESETN = '0') then
            r_SM_Main <= s_Idle;   
        else 
          case r_SM_Main is
    
            when s_Idle =>
              r_RX_DV     <= '0';
              r_Bit_Index <= 0;
              if r_RX_Data = '0' then       -- Start bit detected
                --r_SM_Main <= s_RX_Start_Bit;
                r_SM_Main <= s_RX_Data_Bits;
              else
                r_SM_Main <= s_Idle;
              end if;
    
            when s_RX_Data_Bits =>
    
                r_RX_Byte(r_Bit_Index) <= r_RX_Data;
                
                -- Check if we have sent out all bits
                if r_Bit_Index < 7 then
                  r_Bit_Index <= r_Bit_Index + 1;
                  r_SM_Main   <= s_RX_Data_Bits;
                else
                  r_Bit_Index <= 0;
                  r_SM_Main   <= s_RX_Stop_Bit;
                end if;
    
            -- Receive Stop bit.  Stop bit = 1
            --TODO CHECK FOR ERROR
            when s_RX_Stop_Bit =>
                if( r_RX_Data = '1' ) then   
                    r_RX_DV     <= '1';
                    r_SM_Main   <= s_Idle;
                else
                    stop_bit_error_o <= '1';
                    r_SM_Main   <= s_Cleanup;
                end if;
    
            -- Stay here 1 clock
            when s_Cleanup =>
                r_RX_DV   <= '0';
                stop_bit_error_o <= '1';
                if(r_RX_Data = '1') then  
                    r_SM_Main <= s_Idle;
                else
                    r_SM_Main <= s_Cleanup;
                end if;
                
    
            when others =>
              r_SM_Main <= s_Idle;
    
          end case;
        end if;
    end if;
  end process p_USART_RX;

  RX_DV   <= r_RX_DV;
  RX_BYTE <= r_RX_Byte;
  
end rtl;
