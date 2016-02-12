------------------------------------------------------------------------------/
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
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
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity video_mgt_tx_startup_fsm is
  Generic( GT_TYPE                  : string  := "GTX";
           STABLE_CLOCK_PERIOD      : integer range 4 to 250 := 8; --Period of the stable clock driving this state-machine, unit is [ns]
           RETRY_COUNTER_BITWIDTH   : integer range 2 to 8  := 8; 
           TX_QPLL_USED             : boolean := False;           -- the TX and RX Reset FSMs must
           RX_QPLL_USED             : boolean := False;           -- share these two generic values
           PHASE_ALIGNMENT_MANUAL   : boolean := True             -- Decision if a manual phase-alignment is necessary or the automatic 
                                                                  -- is enough. For single-lane applications the automatic alignment is 
                                                                  -- sufficient              
         );     
    Port ( STABLE_CLOCK             : in  STD_LOGIC;              --Stable Clock, either a stable clock from the PCB
                                                                  --or reference-clock present at startup.
           TXUSERCLK                : in  STD_LOGIC;              --TXUSERCLK as used in the design
           SOFT_RESET               : in  STD_LOGIC;              --User Reset, can be pulled any time
           QPLLREFCLKLOST           : in  STD_LOGIC;              --QPLL Reference-clock for the GT is lost
           CPLLREFCLKLOST           : in  STD_LOGIC;              --CPLL Reference-clock for the GT is lost
           QPLLLOCK                 : in  STD_LOGIC;              --Lock Detect from the QPLL of the GT
           CPLLLOCK                 : in  STD_LOGIC;              --Lock Detect from the CPLL of the GT
           TXRESETDONE              : in  STD_LOGIC;      
           MMCM_LOCK                : in  STD_LOGIC;      
           GTTXRESET                : out STD_LOGIC:='0';      
           MMCM_RESET               : out STD_LOGIC:='1';      
           QPLL_RESET               : out STD_LOGIC:='0';        --Reset QPLL
           CPLL_RESET               : out STD_LOGIC:='0';        --Reset CPLL
           TX_FSM_RESET_DONE        : out STD_LOGIC;             --Reset-sequence has sucessfully been finished.
           TXUSERRDY                : out STD_LOGIC:='0';
           RUN_PHALIGNMENT          : out STD_LOGIC:='0';
           RESET_PHALIGNMENT        : out STD_LOGIC:='0';
           PHALIGNMENT_DONE         : in  STD_LOGIC;
           
           RETRY_COUNTER            : out  STD_LOGIC_VECTOR (RETRY_COUNTER_BITWIDTH-1 downto 0):=(others=>'0')-- Number of 
                                                            -- Retries it took to get the transceiver up and running
           );
end video_mgt_tx_startup_fsm;

--Interdependencies:
-- * Timing depends on the frequency of the stable clock. Hence counters-sizes
--   are calculated at design-time based on the Generics
--   
-- * if either of PLLs is reset during TX-startup, it does not need to be reset again by RX
--   => signal which PLL has been reset
-- * 



architecture RTL of video_mgt_tx_startup_fsm is
  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of RTL : architecture is "yes";

  component  video_mgt_cdc_sync is
    generic (
        C_CDC_TYPE                  : integer range 0 to 2 := 1                 ;
                                    -- 0 is pulse synch
                                    -- 1 is level synch
                                    -- 2 is ack based level sync
        C_RESET_STATE               : integer range 0 to 1 := 0                 ;
                                    -- 0 is reset not needed 
                                    -- 1 is reset needed 
        C_SINGLE_BIT                : integer range 0 to 1 := 1                 ; 
                                    -- 0 is bus input
                                    -- 1 is single bit input
        C_FLOP_INPUT                : integer range 0 to 1 := 0                 ;
        C_VECTOR_WIDTH              : integer range 0 to 32 := 32                             ;
        C_MTBF_STAGES               : integer range 0 to 6 := 2                 
            -- Vector Data witdth
    );

    port (
        prmry_aclk                  : in  std_logic                             ;               --
        prmry_resetn                : in  std_logic                             ;               --
        prmry_in                    : in  std_logic                             ;               --
        prmry_vect_in               : in  std_logic_vector                                      --
                                        (C_VECTOR_WIDTH - 1 downto 0)           ;               --
        prmry_ack                   : out std_logic                             ;
                                                                                                --
        scndry_aclk                 : in  std_logic                             ;               --
        scndry_resetn               : in  std_logic                             ;               --
                                                                                                --
        -- Primary to Secondary Clock Crossing                                                  --
        scndry_out                  : out std_logic                             ;               --
                                                                                                --
        scndry_vect_out             : out std_logic_vector                                      --
                                        (C_VECTOR_WIDTH - 1 downto 0)                           --

    );

   end component;

  type tx_rst_fsm_type is(
    INIT, ASSERT_ALL_RESETS, RELEASE_PLL_RESET,
    RELEASE_MMCM_RESET, WAIT_RESET_DONE, DO_PHASE_ALIGNMENT,
    RESET_FSM_DONE);
    
  signal tx_state : tx_rst_fsm_type := INIT;

  constant MMCM_LOCK_CNT_MAX    : integer := 1024;
  constant STARTUP_DELAY        : integer := 500;--AR43482: Transceiver needs to wait for 500 ns after configuration
  constant WAIT_CYCLES          : integer := STARTUP_DELAY / STABLE_CLOCK_PERIOD; -- Number of Clock-Cycles to wait after configuration
  constant WAIT_MAX             : integer := WAIT_CYCLES + 10;                    -- 500 ns plus some additional margin
    
  constant WAIT_TIMEOUT_2ms     : integer := 2000000 / STABLE_CLOCK_PERIOD;--  2 ms time-out
  constant WAIT_TLOCK_MAX       : integer :=  100000 / STABLE_CLOCK_PERIOD;--100 us time-out
  constant WAIT_TIMEOUT_500us   : integer :=  500000 / STABLE_CLOCK_PERIOD;--100 us time-out
    
  signal init_wait_count        : integer range 0 to WAIT_MAX:=0;
  signal init_wait_done         : std_logic := '0';
  signal pll_reset_asserted     : std_logic := '0';

  signal tx_fsm_reset_done_int     : std_logic := '0';
  signal tx_fsm_reset_done_int_s2  : std_logic := '0';
  signal tx_fsm_reset_done_int_s3  : std_logic := '0';
   
  signal txresetdone_s2         : std_logic := '0'; 
  signal txresetdone_s3         : std_logic := '0'; 

  constant MAX_RETRIES          : integer := 2**RETRY_COUNTER_BITWIDTH-1; 
  signal retry_counter_int      : integer range 0 to MAX_RETRIES;  
  signal time_out_counter       : integer range 0 to WAIT_TIMEOUT_2ms := 0;
    
  signal reset_time_out         : std_logic := '0';
  signal time_out_2ms           : std_logic := '0';--\Flags that the various time-out points 
  signal time_tlock_max         : std_logic := '0';--|have been reached.
  signal time_out_500us         : std_logic := '0';--/
    
  signal mmcm_lock_count        : integer range 0 to MMCM_LOCK_CNT_MAX-1:=0;
  signal mmcm_lock_int          : std_logic := '0';
  signal mmcm_lock_i            : std_logic := '0';
  signal mmcm_lock_reclocked    : std_logic := '0';
    
  signal run_phase_alignment_int    : std_logic := '0';
  signal run_phase_alignment_int_s2 : std_logic := '0';
  signal run_phase_alignment_int_s3 : std_logic := '0';

  constant MAX_WAIT_BYPASS      : integer := 110000; --110000 TXUSRCLK cycles is the max time for Multi lane designs
  signal wait_bypass_count      : integer range 0 to MAX_WAIT_BYPASS-1;
  signal time_out_wait_bypass   : std_logic := '0';
  signal time_out_wait_bypass_s2   : std_logic := '0';
  signal time_out_wait_bypass_s3   : std_logic := '0';
  signal refclk_lost            : std_logic;

  signal      cplllock_sync: std_logic := '0';
  signal      qplllock_sync: std_logic := '0';
 
begin
  --Alias section, signals used within this module mapped to output ports:
  RETRY_COUNTER     <= STD_LOGIC_VECTOR(TO_UNSIGNED(retry_counter_int,RETRY_COUNTER_BITWIDTH));
  RUN_PHALIGNMENT   <= run_phase_alignment_int;
  TX_FSM_RESET_DONE <= tx_fsm_reset_done_int;    

  process(STABLE_CLOCK)
  begin
    if rising_edge(STABLE_CLOCK) then
      -- The counter starts running when configuration has finished and 
      -- the clock is stable. When its maximum count-value has been reached,
      -- the 500 ns from Answer Record 43482 have been passed.
      if init_wait_count = WAIT_MAX then
        init_wait_done <= '1';
      else
        init_wait_count <= init_wait_count + 1;
      end if;
    end if;
  end process;


  timeouts:process(STABLE_CLOCK)
  begin
    if rising_edge(STABLE_CLOCK) then
      -- One common large counter for generating three time-out signals.
      -- Intermediate time-outs are derived from calculated values, based
      -- on the period of the provided clock.
      if reset_time_out = '1' then
        time_out_counter  <= 0;
        time_out_2ms      <= '0';
        time_tlock_max    <= '0';
        time_out_500us    <= '0';
      else
        if time_out_counter = WAIT_TIMEOUT_2ms then
          time_out_2ms <= '1';
        else
          time_out_counter <= time_out_counter + 1;
        end if;
        
        if time_out_counter = WAIT_TLOCK_MAX then
          time_tlock_max <= '1';
        end if;
      
        if time_out_counter = WAIT_TIMEOUT_500us then
          time_out_500us <= '1';
        end if;
      end if;
    end if;
  end process;

  mmcm_lock_wait:process(STABLE_CLOCK)
  begin
    if rising_edge(STABLE_CLOCK) then
      if mmcm_lock_i = '0' then
        mmcm_lock_count <= 0;
        mmcm_lock_reclocked   <= '0';
      else 
        if mmcm_lock_count < MMCM_LOCK_CNT_MAX - 1 then
          mmcm_lock_count <= mmcm_lock_count + 1;
        else
          mmcm_lock_reclocked <= '1';
        end if;
      end if;
    end if;
  end process;
  


  -- Clock Domain Crossing

      run_phase_alignment_int_cdc_sync : video_mgt_cdc_sync
      generic map
         (
           c_cdc_type      => 1             ,   
           c_flop_input    => 0             ,  
           c_reset_state   => 0             ,  
           c_single_bit    => 1             ,  
           c_vector_width  => 2             ,  
           c_mtbf_stages   => 3                
         )
      port map   
         (
           prmry_aclk      => '0'                         ,
           prmry_resetn     => '1'                         ,
           prmry_in        => run_phase_alignment_int     ,
           prmry_vect_in   => "00"                        ,
           scndry_aclk     => TXUSERCLK                   ,
           scndry_resetn    => '1'                         ,
           prmry_ack       => open                        ,
           scndry_out      => run_phase_alignment_int_s2  ,
           scndry_vect_out => open 
          );

      tx_fsm_reset_done_int_cdc_sync : video_mgt_cdc_sync
      generic map
         (
           c_cdc_type      => 1             ,   
           c_flop_input    => 0             ,  
           c_reset_state   => 0             ,  
           c_single_bit    => 1             ,  
           c_vector_width  => 2             ,  
           c_mtbf_stages   => 3                
         )
      port map   
         (
           prmry_aclk      => STABLE_CLOCK              ,
           prmry_resetn     => '1'                       ,
           prmry_in        => tx_fsm_reset_done_int     ,
           prmry_vect_in   => "00"                      ,
           scndry_aclk     => TXUSERCLK                 ,
           scndry_resetn    => '1'                       ,
           prmry_ack       => open                      ,
           scndry_out      => tx_fsm_reset_done_int_s2  ,
           scndry_vect_out => open 
          );

  process(TXUSERCLK)
  begin
    if rising_edge(TXUSERCLK) then
      run_phase_alignment_int_s3   <=  run_phase_alignment_int_s2;

      tx_fsm_reset_done_int_s3     <=  tx_fsm_reset_done_int_s2;
    end if;
  end process;

      time_out_wait_bypass_cdc_sync : video_mgt_cdc_sync
      generic map
         (
           c_cdc_type      => 1             ,   
           c_flop_input    => 0             ,  
           c_reset_state   => 0             ,  
           c_single_bit    => 1             ,  
           c_vector_width  => 2             ,  
           c_mtbf_stages   => 3                
         )
      port map   
         (
           prmry_aclk      => TXUSERCLK                ,
           prmry_resetn     => '1'                      ,
           prmry_in        => time_out_wait_bypass     ,
           prmry_vect_in   => "00"                     ,
           scndry_aclk     => STABLE_CLOCK             ,
           scndry_resetn    => '1'                      ,
           prmry_ack       => open                     ,
           scndry_out      => time_out_wait_bypass_s2  ,
           scndry_vect_out => open 
          );

      txresetdone_cdc_sync : video_mgt_cdc_sync
      generic map
         (
           c_cdc_type      => 1             ,   
           c_flop_input    => 0             ,  
           c_reset_state   => 0             ,  
           c_single_bit    => 1             ,  
           c_vector_width  => 2             ,  
           c_mtbf_stages   => 3                
         )
      port map   
         (
           prmry_aclk      => TXUSERCLK          ,
           prmry_resetn     => '1'                ,
           prmry_in        => TXRESETDONE        ,
           prmry_vect_in   => "00"               ,
           scndry_aclk     => STABLE_CLOCK       ,
           scndry_resetn    => '1'                ,
           prmry_ack       => open               ,
           scndry_out      => txresetdone_s2     ,
           scndry_vect_out => open 
          );

      mmcm_lock_reclocked_cdc_sync : video_mgt_cdc_sync
      generic map
         (
           c_cdc_type      => 1             ,   
           c_flop_input    => 0             ,  
           c_reset_state   => 0             ,  
           c_single_bit    => 1             ,  
           c_vector_width  => 2             ,  
           c_mtbf_stages   => 3                
         )
      port map   
         (
           prmry_aclk      => '0'                 ,
           prmry_resetn     => '1'                 ,
           prmry_in        => MMCM_LOCK       ,
           prmry_vect_in   => "00"                ,
           scndry_aclk     => STABLE_CLOCK        ,
           scndry_resetn    => '1'                 ,
           prmry_ack       => open                ,
           scndry_out      => mmcm_lock_i ,
           scndry_vect_out => open 
          );

  process(STABLE_CLOCK)
  begin
    if rising_edge(STABLE_CLOCK) then
       txresetdone_s3     <= txresetdone_s2;

       time_out_wait_bypass_s3 <=  time_out_wait_bypass_s2;
    end if;
  end process;

      cplllock_cdc_sync : video_mgt_cdc_sync
      generic map
         (
           c_cdc_type      => 1             ,   
           c_flop_input    => 0             ,  
           c_reset_state   => 0             ,  
           c_single_bit    => 1             ,  
           c_vector_width  => 2             ,  
           c_mtbf_stages   => 3                
         )
      port map   
         (
           prmry_aclk      => '0'                ,
           prmry_resetn     => '1'                ,
           prmry_in        => CPLLLOCK           ,
           prmry_vect_in   => "00"               ,
           scndry_aclk     => STABLE_CLOCK       ,
           scndry_resetn    => '1'                ,
           prmry_ack       => open               ,
           scndry_out      => cplllock_sync      ,
           scndry_vect_out => open 
          );

      qplllock_cdc_sync : video_mgt_cdc_sync
      generic map
         (
           c_cdc_type      => 1             ,   
           c_flop_input    => 0             ,  
           c_reset_state   => 0             ,  
           c_single_bit    => 1             ,  
           c_vector_width  => 2             ,  
           c_mtbf_stages   => 3                
         )
      port map   
         (
           prmry_aclk      => '0'                ,
           prmry_resetn     => '1'                ,
           prmry_in        => QPLLLOCK           ,
           prmry_vect_in   => "00"               ,
           scndry_aclk     => STABLE_CLOCK       ,
           scndry_resetn    => '1'                ,
           prmry_ack       => open               ,
           scndry_out      => qplllock_sync      ,
           scndry_vect_out => open 
          );
  timeout_buffer_bypass:process(TXUSERCLK)
  begin
    if rising_edge(TXUSERCLK) then
      if run_phase_alignment_int_s3 = '0' then
        wait_bypass_count     <= 0;
        time_out_wait_bypass  <= '0';
      elsif (run_phase_alignment_int_s3 = '1') and (tx_fsm_reset_done_int_s3 = '0')  then
        if wait_bypass_count = MAX_WAIT_BYPASS - 1 then
          time_out_wait_bypass <= '1';
        else
          wait_bypass_count <= wait_bypass_count + 1;
        end if;
      end if;
    end if;
  end process;

   refclk_lost <= '1' when ((TX_QPLL_USED and QPLLREFCLKLOST='1') or (not TX_QPLL_USED and CPLLREFCLKLOST='1')) else '0';


  --FSM for resetting the GTX/GTH/GTP in the 7-series. 
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  --
  -- Following steps are performed:
  -- 1) Only for GTX - After configuration wait for approximately 500 ns as specified in 
  --    answer-record 43482
  -- 2) Assert all resets on the GT and on an MMCM potentially connected. 
  --    After that wait until a reference-clock has been detected.
  -- 3) Release the reset to the GT and wait until the GT-PLL has locked.
  -- 4) Release the MMCM-reset and wait until the MMCM has signalled lock.
  --    Also signal to the RX-side which PLL has been reset.
  -- 5) Wait for the RESET_DONE-signal from the GT.
  -- 6) Signal to start the phase-alignment procedure and wait for it to 
  --    finish.
  -- 7) Reset-sequence has successfully run through. Signal this to the 
  --    rest of the design by asserting TX_FSM_RESET_DONE.
  
  reset_fsm:process(STABLE_CLOCK)
  begin
    if rising_edge(STABLE_CLOCK) then
      if(SOFT_RESET = '1' or (not(tx_state = INIT) and not(tx_state = ASSERT_ALL_RESETS) and refclk_lost = '1')) then
        tx_state                <= INIT;
        TXUSERRDY               <= '0';
        GTTXRESET               <= '0';
        MMCM_RESET              <= '1';
        tx_fsm_reset_done_int   <= '0';
        QPLL_RESET              <= '0';
        CPLL_RESET              <= '0';
        pll_reset_asserted      <= '0';
        reset_time_out          <= '0';
        retry_counter_int       <=  0;
        run_phase_alignment_int <= '0';
        RESET_PHALIGNMENT       <= '1';
      else
        
        case tx_state is
          when INIT => 
            --Initial state after configuration. This state will be left after
            --approx. 500 ns and not be re-entered. 
            if init_wait_done = '1' then
              tx_state        <= ASSERT_ALL_RESETS;
              reset_time_out  <= '1';
            end if;
            
          when ASSERT_ALL_RESETS => 
            --This is the state into which the FSM will always jump back if any
            --time-outs will occur. 
            --The number of retries is reported on the output RETRY_COUNTER. In 
            --case the transceiver never comes up for some reason, this machine 
            --will still continue its best and rerun until the FPGA is turned off
            --or the transceivers come up correctly.
            if TX_QPLL_USED then
              if pll_reset_asserted = '0' then
                QPLL_RESET          <= '1';
                pll_reset_asserted  <= '1';
              else
                QPLL_RESET          <= '0';
              end if;
            else
              if pll_reset_asserted = '0' then
                CPLL_RESET <= '1';
                pll_reset_asserted  <= '1';
              else
                CPLL_RESET          <= '0';
              end if;  
            end if;
            TXUSERRDY               <= '0';
            GTTXRESET               <= '1';
            MMCM_RESET              <= '1';
            reset_time_out          <= '0';
            run_phase_alignment_int <= '0';     
            RESET_PHALIGNMENT       <= '1';

            if (TX_QPLL_USED and (QPLLREFCLKLOST = '0') and pll_reset_asserted = '1') or
               (not TX_QPLL_USED and (CPLLREFCLKLOST = '0') and pll_reset_asserted = '1') then
              tx_state  <= RELEASE_PLL_RESET;
           end if;           
            
          when RELEASE_PLL_RESET => 
            --PLL-Reset of the GTX gets released and the time-out counter
            --starts running.
            pll_reset_asserted  <= '0';

             if (TX_QPLL_USED and (qplllock_sync = '1')) or
               (not TX_QPLL_USED and (cplllock_sync = '1')) then
              tx_state  <= RELEASE_MMCM_RESET;
              reset_time_out  <= '1';
            end if;
            
            if time_out_2ms = '1' then
              if retry_counter_int = MAX_RETRIES then
                -- If too many retries are performed compared to what is specified in 
                -- the generic, the counter simply wraps around.
                retry_counter_int <= 0;
              else
                retry_counter_int <= retry_counter_int + 1;
              end if;
              tx_state            <= ASSERT_ALL_RESETS; 
            end if;           

          when RELEASE_MMCM_RESET => 
            GTTXRESET <= '0';
            reset_time_out  <= '0';
            --Release of the MMCM-reset. Waiting for the MMCM to lock.
            MMCM_RESET <= '0';
            if mmcm_lock_reclocked = '1' then
              tx_state <= WAIT_RESET_DONE;
              reset_time_out  <= '1';
            end if;          
            
            if (time_tlock_max = '1' and mmcm_lock_reclocked = '0' and reset_time_out = '0') then
              if retry_counter_int = MAX_RETRIES then
                -- If too many retries are performed compared to what is specified in 
                -- the generic, the counter simply wraps around.
                retry_counter_int <= 0;
              else
                retry_counter_int <= retry_counter_int + 1;
              end if;
              tx_state            <= ASSERT_ALL_RESETS; 
            end if;            
            
          when WAIT_RESET_DONE => 
            TXUSERRDY <= '1';
            reset_time_out  <= '0';
            if txresetdone_s3 = '1' then              
              tx_state      <= DO_PHASE_ALIGNMENT;               
              reset_time_out  <= '1';
            end if;          

            if (time_out_500us = '1' and reset_time_out = '0') then
              if retry_counter_int = MAX_RETRIES then
                -- If too many retries are performed compared to what is specified in 
                -- the generic, the counter simply wraps around.
                retry_counter_int <= 0;
              else
                retry_counter_int <= retry_counter_int + 1;
              end if;
              tx_state            <= ASSERT_ALL_RESETS; 
            end if;                    
          
          when DO_PHASE_ALIGNMENT => 
            --The direct handling of the signals for the Phase Alignment is done outside
            --this state-machine. 
            RESET_PHALIGNMENT       <= '0';
            run_phase_alignment_int <= '1';
            reset_time_out          <= '0';
            
            if PHALIGNMENT_DONE = '1' then
              tx_state        <= RESET_FSM_DONE;
            end if;
            
            if time_out_wait_bypass_s3 = '1' then
              if retry_counter_int = MAX_RETRIES then
                -- If too many retries are performed compared to what is specified in 
                -- the generic, the counter simply wraps around.
                retry_counter_int <= 0;
              else
                retry_counter_int <=  retry_counter_int + 1;
              end if;
              tx_state            <= ASSERT_ALL_RESETS; 
            end if;           
          
          when RESET_FSM_DONE => 
            reset_time_out        <= '1';
            tx_fsm_reset_done_int <= '1';

          when OTHERS =>
            tx_state              <= INIT;
          
        end case;
      end if;
    end if;
  end process; 

end RTL;
