-------------------------------------------------------------------------------
--
-- Title       : axis_lane_stim
-- Design      : clink_tb
-- Author      :
-- Company     :
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00251-Output\src\Clink\Simulations\clink_tb\src\axis_lane_stim.vhd
-- Generated   : Thu Jan 30 13:26:14 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all; 
use work.decimator_define.all;

entity stim is
   port(                                
      
      ARESETN : out STD_LOGIC;
            
      CLK_MB           : out std_logic;
      CLK_DATA         : out std_logic;
      
      MB_MISO          : in t_axi4_lite_miso;
      MB_MOSI          : out  t_axi4_lite_mosi;
         
         
      AXIS_MOSI : out t_axi4_stream_mosi64;     
      AXIS_MISO : in t_axi4_stream_miso


      );
end stim;

architecture stim of stim is

------------------- Constants definition -------------------------- 
-- Clocks frequency 
constant CLK85_PERIOD : time := 11.764 ns; 
constant CLK100_PERIOD : time := 10 ns; 



--IMAGE PARAM
constant FRAME_WIDTH : unsigned := to_unsigned(64,32);
constant FRAME_HEIGHT : unsigned := to_unsigned(6,32);
constant FRAME_SIZE : unsigned := FRAME_HEIGHT * FRAME_WIDTH;
constant IMG_DLY : unsigned := to_unsigned(16,32);
constant HDR_DLY : unsigned := to_unsigned(16,32);
  
constant ROW_WIDTH              : std_logic_vector(31 downto 0) := std_logic_vector(FRAME_WIDTH); 

constant VIDEO_FREEZE           : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(0,32)); 
constant VIDEO_SELECTOR_ENABLE  : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(0,32)); 
constant VIDEO_FWPOSITION       : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(9,32)); 
constant SDI_VIDEO_EHDRIINDEX   : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(5,32)); 





type  frame_gen_state_t is (Frame_Reset, transmit_hdr, hdr_delay_st ,transmit_img, img_delay_st);
signal frame_gen_state : frame_gen_state_t :=  Frame_Reset;
signal transmit : std_logic := '0';  
   
signal clk_mb_o : std_logic := '0';
signal clk_data_o : std_logic := '0';
signal rst_n : std_logic := '0';
  
signal cnt : unsigned(31 downto 0) ; 
signal frame_width_i : unsigned(31 downto 0) := FRAME_WIDTH;
signal frame_height_i : unsigned(31 downto 0) := FRAME_HEIGHT;
signal frame_size_i : unsigned(31 downto 0) :=  resize(FRAME_HEIGHT*FRAME_WIDTH,32);

signal pixel_index : unsigned(15 downto 0);



begin  
   
   -- Assign clock
   CLK_DATA <= clk_data_o;
   CLK_MB <= clk_mb_o;

   ARESETN <= rst_n; 
   --! Output Clock generation 
   
   CLK_DATA_GENERATION: process(clk_data_o)
   begin
   clk_data_o <= not clk_data_o after CLK85_PERIOD/2;
   end process;
   
   CLK_MB_GENERATION: process(clk_mb_o)
   begin
   clk_mb_o <= not clk_mb_o after CLK100_PERIOD/2;
   end process;

   frame_gen : process(clk_data_o)
   begin
      if rising_edge(clk_data_o) then 

         if rst_n = '0' then  
            frame_gen_state <=  Frame_Reset; 
            pixel_index <= (others => '0');
            cnt <= (others => '0');
            AXIS_MOSI.TDATA <= (others => '0');
            AXIS_MOSI.TVALID  <= '0';
            AXIS_MOSI.TLAST <= '0';
            AXIS_MOSI.TKEEP <= (others => '1');
            AXIS_MOSI.TDEST <= (others => '0');
            AXIS_MOSI.TUSER   <= (others => '0');
            AXIS_MOSI.TID     <= "0"; 
            AXIS_MOSI.TSTRB     <= (others => '1');
                     
         else   
            
            case frame_gen_state is   
            
                  when Frame_Reset =>
                     AXIS_MOSI.TDATA <= (others => '0');
                     AXIS_MOSI.TVALID  <= '0';
                     AXIS_MOSI.TLAST <= '0';
                     AXIS_MOSI.TKEEP <= (others => '1');
                     AXIS_MOSI.TDEST <= (others => '0');
                     AXIS_MOSI.TUSER   <= (others => '0');
                     AXIS_MOSI.TID     <= (others => '1');
                     AXIS_MOSI.TSTRB     <= (others => '1');
                     pixel_index <= (others => '0');
                     
                     if transmit = '1' then 
                        frame_gen_state <= transmit_hdr;
                     else
                        frame_gen_state <= Frame_Reset;
                     end if; 
                     
                  when transmit_hdr => 
                  
                  AXIS_MOSI.TVALID  <= '1';
                  
                     
                        
                        case pixel_index is 
                             when to_unsigned(0,16) => -- correspond to first half of 32 bit hdr
                                 AXIS_MOSI.TDATA(15 downto 0) <= x"43" & x"54";    --TC
                                 AXIS_MOSI.TDATA(31 downto 16) <= x"00" & x"01";   --XML_MINOR_VER & XML_MAJOR_VER
                                 AXIS_MOSI.TDATA(47 downto 32) <= (others => '0'); --IMG_HDR_LEN & x"0000"
                                 AXIS_MOSI.TDATA(63 downto 48) <= (others => '0');
                              
                              when to_unsigned(4,16) =>
                                 AXIS_MOSI.TDATA(15 downto 0) <= (others => '0');
                                 AXIS_MOSI.TDATA(31 downto 16) <= (others => '0');
                                 AXIS_MOSI.TDATA(47 downto 32) <= (others => '0');
                                 AXIS_MOSI.TDATA(63 downto 48) <= (others => '0');
                              when to_unsigned(16,16) =>
                                 AXIS_MOSI.TDATA(31 downto 16) <= (others => '0');
                                 AXIS_MOSI.TDATA(15 downto 0) <= (others => '0');
                                 AXIS_MOSI.TDATA(47 downto 32) <= (others => '0');
                                 AXIS_MOSI.TDATA(63 downto 48) <= (others => '0'); 
                                 
                              when to_unsigned(128,16) =>
                                 AXIS_MOSI.TDATA(31 downto 16) <= (others => '0');
                                 AXIS_MOSI.TDATA(15 downto 0) <= (others => '0');
                                 AXIS_MOSI.TDATA(47 downto 32) <= (others => '0');
                                 AXIS_MOSI.TDATA(63 downto 48) <= (others => '0');
                                 
                              when others =>
                                 AXIS_MOSI.TDATA(15 downto 0)  <= std_logic_vector(pixel_index + 0);
                                 AXIS_MOSI.TDATA(31 downto 16) <= std_logic_vector(pixel_index + 1);
                                 AXIS_MOSI.TDATA(47 downto 32) <= std_logic_vector(pixel_index + 2);
                                 AXIS_MOSI.TDATA(63 downto 48) <= std_logic_vector(pixel_index + 3);
                        end case; 

                        
                        
                     if AXIS_MISO.TREADY = '1' then    
                        
                        pixel_index <= pixel_index + 4;
                        
                        if(pixel_index = frame_width_i*2-4) then 
                           AXIS_MOSI.TLAST <= '1';  
                           cnt <= (others => '0');
                           frame_gen_state <= hdr_delay_st;
                        else  
                           AXIS_MOSI.TLAST <= '0';
                           frame_gen_state <= transmit_hdr;
                        end if; 
                     end if;   
                        
                  when hdr_delay_st => 
                     if AXIS_MISO.TREADY = '1' then
                        AXIS_MOSI.TLAST <= '0';
                        AXIS_MOSI.TDATA <= (others => '0');
                        AXIS_MOSI.TVALID  <= '0'; 
                        AXIS_MOSI.TID     <= (others => '0');
                     end if;    
                     
                     if cnt > HDR_DLY then
                        frame_gen_state <= transmit_img;
                     else
                        cnt <= cnt + 1;
                     end if;
                  
                  when transmit_img => 
                     
                     AXIS_MOSI.TVALID  <= '1';
                     AXIS_MOSI.TDATA(15 downto 0)  <= std_logic_vector(pixel_index + 0);
                     AXIS_MOSI.TDATA(31 downto 16) <= std_logic_vector(pixel_index + 1);
                     AXIS_MOSI.TDATA(47 downto 32) <= std_logic_vector(pixel_index + 2);
                     AXIS_MOSI.TDATA(63 downto 48) <= std_logic_vector(pixel_index + 3);
                                 
                     if AXIS_MISO.TREADY = '1' then    
                        
                        pixel_index <= pixel_index + 4;
                        if pixel_index = frame_size_i-4 then 
                           AXIS_MOSI.TLAST <= '1'; 
                           cnt <= (others => '0');
                           frame_gen_state <= img_delay_st;
                        else  
                           AXIS_MOSI.TLAST <= '0';
                           frame_gen_state <= transmit_img;
                        end if; 
                     end if; 
                        
                  when img_delay_st =>   
                  
                     if AXIS_MISO.TREADY = '1' then 
                        AXIS_MOSI.TLAST <= '0';
                        AXIS_MOSI.TDATA <= (others => '0');
                        AXIS_MOSI.TVALID  <= '0'; 
                        AXIS_MOSI.TID     <= (others => '1');   
                     end if;
                  
                     pixel_index <= (others => '0');
                  

                     if cnt > IMG_DLY then
                        if transmit = '1' then 
                           frame_gen_state <= transmit_hdr;
                        else
                           frame_gen_state <= Frame_Reset;
                        end if;
                         
                     else
                        cnt <= cnt + 1;
                     end if;
                     
                     
                  when others =>
                     frame_gen_state <= Frame_Reset;
               end case;
         end if;      
      end if;
   end process;
   
   
   
sim: process is
      
      variable start_pos : integer;
      variable end_pos   : integer;
      
   begin  
      rst_n <= '0';
      transmit <= '0';
      
      MB_MOSI.awaddr <= (others => '0');
      MB_MOSI.awprot <= (others => '0');
      MB_MOSI.wdata <= (others => '0');
      MB_MOSI.wstrb <= (others => '0');
      MB_MOSI.araddr <= (others => '0');
      MB_MOSI.arprot <= (others => '0');
      
      MB_MOSI.awvalid <= '0';
      MB_MOSI.wvalid <= '0';
      MB_MOSI.bready <= '0';
      MB_MOSI.arvalid <= '0';
      MB_MOSI.rready <= '0';  
      
      frame_width_i  <= FRAME_WIDTH;
      frame_size_i   <= resize(FRAME_HEIGHT*FRAME_WIDTH,32);

      wait for 150 ns;
      rst_n <= '1';
      wait for 150 ns; 
      
           
      write_axi_lite(clk_mb_o, std_logic_vector(to_unsigned(112, 32)), std_logic_vector(resize('1',32)), MB_MISO,  MB_MOSI);
      wait for 30 ns;
      write_axi_lite(clk_mb_o, std_logic_vector(to_unsigned(116, 32)), SDI_VIDEO_EHDRIINDEX, MB_MISO,  MB_MOSI);
      wait for 30 ns;
      write_axi_lite(clk_mb_o, std_logic_vector(to_unsigned(120, 32)), VIDEO_FWPOSITION, MB_MISO,  MB_MOSI);
      wait for 30 ns;
      write_axi_lite(clk_mb_o, std_logic_vector(to_unsigned(124, 32)), VIDEO_SELECTOR_ENABLE, MB_MISO,  MB_MOSI);
      wait for 30 ns;
      write_axi_lite(clk_mb_o, std_logic_vector(to_unsigned(128, 32)), VIDEO_FREEZE, MB_MISO,  MB_MOSI);
      wait for 30 ns;
      write_axi_lite(clk_mb_o, std_logic_vector(to_unsigned(104, 32)), std_logic_vector(frame_width_i), MB_MISO,  MB_MOSI);
      wait for 30 ns;
      write_axi_lite(clk_mb_o, std_logic_vector(to_unsigned(108, 32)), std_logic_vector(resize("11",32)), MB_MISO,  MB_MOSI);
      wait for 30 ns;
      write_axi_lite(clk_mb_o, std_logic_vector(to_unsigned(112, 32)), std_logic_vector(resize('1',32)), MB_MISO,  MB_MOSI);



      wait for 30 ns;
      
      transmit <= '1';

      wait;
      
      report "FCR written"; 
      report "END OF SIMULATION" 
      severity error;
   end process sim;   
   
   
 end;