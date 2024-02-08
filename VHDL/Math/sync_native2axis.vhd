----------------------------------------------------------------------------------
-- Company: Telops
-- Engineer: ALA
-- 
-- Create Date: 02/06/2024 02:12:07 PM
-- Design Name: 
-- Module Name: sync_native2axis - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use WORK.TEL2000.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sync_native2axis is
    Port (
        clk      : in  std_logic;
        aresetn  : in  std_logic;
        param    : in  std_logic_vector(31 downto 0);
        -- input A = pixels
        rxa_mosi : in  t_axi4_stream_mosi32;
        rxa_miso : out t_axi4_stream_miso;
        -- output A = pixels
        txa_mosi : out t_axi4_stream_mosi32;
        txa_miso : in  t_axi4_stream_miso;
        -- output B = params
        txb_mosi : out t_axi4_stream_mosi32;
        txb_miso : in  t_axi4_stream_miso
    );
end sync_native2axis;

architecture Behavioral of sync_native2axis is
    component sync_resetn is
       port(
          ARESETN : in  STD_LOGIC;
          SRESETN : out STD_LOGIC := '0';
          CLK     : in  STD_LOGIC
          );
    end component;
    
    -- type t_axi4_stream_mosi32 is record
    --    TVALID : std_logic; --! Stream Data Valid
    --    TDATA : std_logic_vector(31 downto 0); --! Stream Data 32 bit
    --    TSTRB : std_logic_vector(3 downto 0); --! Stream Data Strobe (4bits)
    --    TKEEP : std_logic_vector(3 downto 0); --! Stream Data Keep (4bits)
    --    TLAST : std_logic; --! Stream Data Last
    --    TID : std_logic_vector(0 downto 0); --! Stream ID
    --    TDEST : std_logic_vector(2 downto 0); --! Stream Destination
    --    TUSER : std_logic_vector(7 downto 0); --! Stream User Data (8 bits)
    -- end record;
    
    -- type t_axi4_stream_miso is record
    --    TREADY : std_logic; --! Stream Ready to Accept Data
    -- end record;
    
    signal tready : std_logic;
    signal tvalid : std_logic;
    signal resetn : std_logic;
    signal lparam : std_logic_vector(31 downto 0) := (others => '0');
    
    type latch_fsm_type is (UPDATE, LATCH);
begin
    tready <= txa_miso.tready and txb_miso.tready;
    tvalid <= rxa_mosi.tvalid and tready;
    
    txa_mosi.tvalid <= tvalid;
    txa_mosi.tdata  <= rxa_mosi.tdata;
    txa_mosi.tstrb  <= rxa_mosi.tstrb;
    txa_mosi.tkeep  <= rxa_mosi.tkeep;
    txa_mosi.tlast  <= rxa_mosi.tlast;
    txa_mosi.tid    <= rxa_mosi.tid;
    txa_mosi.tdest  <= rxa_mosi.tdest;
    txa_mosi.tuser  <= rxa_mosi.tuser;
    
    txb_mosi.tvalid <= tvalid;
    txb_mosi.tdata  <= lparam;
    txb_mosi.tstrb  <= rxa_mosi.tstrb;
    txb_mosi.tkeep  <= rxa_mosi.tkeep;
    txb_mosi.tlast  <= rxa_mosi.tlast;
    txb_mosi.tid    <= rxa_mosi.tid;
    txb_mosi.tdest  <= rxa_mosi.tdest;
    txb_mosi.tuser  <= rxa_mosi.tuser;
    
    rxa_miso.tready <= tready;
    
    process(clk)
        variable latch_fsm : latch_fsm_type := UPDATE;
    begin
        if rising_edge(clk) then
            if resetn = '0' then
                latch_fsm := UPDATE;
                lparam    <= (others => '0');
            else
                if tvalid = '1' then
                    if rxa_mosi.tlast = '1' then
                        latch_fsm := UPDATE;
                    else
                        latch_fsm := LATCH;
                    end if;
                end if;
                
                case latch_fsm is
                    when UPDATE =>
                        lparam <= param;
                    when LATCH =>
                        lparam <= lparam;
                end case;
            end if;
        end if;
    end process;
    
    sync_resetn_inst : sync_resetn
       port map(
          ARESETN => aresetn,
          SRESETN => resetn,
          CLK     => clk
          );
end Behavioral;
