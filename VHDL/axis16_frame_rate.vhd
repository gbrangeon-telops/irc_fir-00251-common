------------------------------------------------------------------
--!   @file axis16_frame_rate.vhd
--!   @brief Measure the frame rate of the AXI-Stream interface.
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.TEL2000.all;

entity axis16_frame_rate is
   generic(
      CLK_FREQ_MHZ   : real range 0.0 to 4294.0 := 100.0;
      HDER_TLAST_EN  : boolean := true
   );
   port(
      CLK            : in  STD_LOGIC;
      ARESETN        : in  STD_LOGIC;
      
      AXIS_MOSI      : in  t_axi4_stream_mosi16;
      AXIS_MISO      : in  t_axi4_stream_miso;

      MB_CLK         : in  STD_LOGIC;
      FRAME_RATE     : out STD_LOGIC_VECTOR(31 downto 0);
      FRAME_RATE_MIN : out STD_LOGIC_VECTOR(31 downto 0);
      FRAME_RATE_MAX : out STD_LOGIC_VECTOR(31 downto 0)
   );
end axis16_frame_rate;

architecture rtl of axis16_frame_rate is

   component sync_resetn
      port(
         ARESETN : in  STD_LOGIC;
         SRESETN : out STD_LOGIC;
         CLK     : in  STD_LOGIC);
   end component;

   signal sresetn           : std_logic;
   signal acq_started       : std_logic;
   signal gen_tid           : std_logic;
   signal sec_counter       : unsigned(31 downto 0);   -- max 4294 MHz
   signal frame_counter     : unsigned(16 downto 0);   -- max 131071 fps
   signal frame_rate_o      : unsigned(frame_counter'range);
   signal frame_rate_min_o  : unsigned(frame_counter'range);
   signal frame_rate_max_o  : unsigned(frame_counter'range);
   signal frame_rate_mb     : unsigned(frame_counter'range);
   signal frame_rate_min_mb : unsigned(frame_counter'range);
   signal frame_rate_max_mb : unsigned(frame_counter'range);
   
   constant CLK_CYCLES_PER_SEC : unsigned(sec_counter'range) := to_unsigned(integer(CLK_FREQ_MHZ * 1.0e6), sec_counter'length);
   
   attribute KEEP : string;
   attribute KEEP of frame_rate_mb      : signal is "true";
   attribute KEEP of frame_rate_min_mb  : signal is "true";
   attribute KEEP of frame_rate_max_mb  : signal is "true";
   
   
begin

   reset : sync_resetn port map(ARESETN => ARESETN, CLK => CLK, SRESETN => sresetn);
   
   FRAME_RATE     <= std_logic_vector(resize(frame_rate_mb, FRAME_RATE'length));
   FRAME_RATE_MIN <= std_logic_vector(resize(frame_rate_min_mb, FRAME_RATE_MIN'length));
   FRAME_RATE_MAX <= std_logic_vector(resize(frame_rate_max_mb, FRAME_RATE_MAX'length));
   
   output : process(MB_CLK)
   begin
      if rising_edge(MB_CLK) then
         frame_rate_mb <= frame_rate_o;
         frame_rate_min_mb <= frame_rate_min_o;
         frame_rate_max_mb <= frame_rate_max_o;
      end if;
   end process;
   
   acq_start : process(CLK)
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then
            acq_started <= '0';
         else
            if AXIS_MISO.tready = '1' and AXIS_MOSI.tvalid = '1' then
               acq_started <= '1';
            end if;
         end if;
      end if;
   end process;
   
   frame_cnt : process(CLK)
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then
            gen_tid <= '1';
            sec_counter <= (others => '0');
            frame_counter <= (others => '0');
            frame_rate_o <= (others => '0');
            frame_rate_min_o <= (others => '1');
            frame_rate_max_o <= (others => '0');
         else
            
            if acq_started = '1' then
               -- Frame counter
               if AXIS_MISO.tready = '1' and AXIS_MOSI.tvalid = '1' and AXIS_MOSI.tlast = '1' then
                  if HDER_TLAST_EN = true then
                     -- header tlast does not count as a frame
                     if gen_tid = '0' then
                        frame_counter <= frame_counter + 1;
                     end if;
                     gen_tid <= not gen_tid;
                  else
                     -- each tlast counts when header is not present or has no tlast 
                     frame_counter <= frame_counter + 1;
                  end if;
               end if;
               
               -- One second delay
               if sec_counter = CLK_CYCLES_PER_SEC-1 then
                  -- Reset counters
                  sec_counter <= (others => '0');
                  frame_counter <= (others => '0');
                  -- Output results
                  frame_rate_o <= frame_counter;
                  if frame_counter < frame_rate_min_o then
                     frame_rate_min_o <= frame_counter;
                  end if;
                  if frame_counter > frame_rate_max_o then
                     frame_rate_max_o <= frame_counter;
                  end if;
               else
                  sec_counter <= sec_counter + 1;
               end if;
            end if;
            
         end if;
      end if;
   end process;

end;
