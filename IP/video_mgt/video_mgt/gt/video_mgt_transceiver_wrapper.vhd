-------------------------------------------------------------------------------
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
--
--------------------------------------------------------------------------------
-- Module video_mgt_GT_WRAPPER
--------------------------------------------------------------------------------
library IEEE;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity video_mgt_GT_WRAPPER is
generic
(
    QPLL_FBDIV_TOP                 : integer  := 40;
    -- Channel bond MASTER/SLAVE connection
    CHAN_BOND_MASTER : std_logic := '1';
    CHAN_BOND_SLAVE  : std_logic := '0';
    CHAN_BOND_LEVEL  : std_logic_vector := "001";
    CHAN_BOND_MASTER_LANE1 : std_logic := '0';
    CHAN_BOND_SLAVE_LANE1  : std_logic := '1';
    CHAN_BOND_LEVEL_LANE1  : std_logic_vector := "000";
    -- Simulation attribute
    EXAMPLE_SIMULATION                      : integer   := 0;               -- Set to 1 for simulation
    SIM_GTRESET_SPEEDUP : string :=   "FALSE"      -- Set to "TRUE" to speed up sim reset
);

port
(

---------------------- Loopback and Powerdown Ports ----------------------
LOOPBACK_IN                               : in    std_logic_vector (2 downto 0);
--------------------- Receive Ports - 8b10b Decoder ----------------------
RXCHARISCOMMA_OUT : out   std_logic_vector (3 downto 0);
RXCHARISCOMMA_OUT_LANE1 : out   std_logic_vector (3 downto 0);
RXCHARISK_OUT     : out   std_logic_vector (3 downto 0);
RXCHARISK_OUT_LANE1     : out   std_logic_vector (3 downto 0);
RXDISPERR_OUT     : out   std_logic_vector (3 downto 0);
RXDISPERR_OUT_LANE1     : out   std_logic_vector (3 downto 0);
RXNOTINTABLE_OUT  : out   std_logic_vector (3 downto 0);
RXNOTINTABLE_OUT_LANE1  : out   std_logic_vector (3 downto 0);
----------------- Receive Ports - Channel Bonding Ports -----------------
ENCHANSYNC_IN     : in    std_logic;
ENCHANSYNC_IN_LANE1     : in    std_logic;
CHBONDDONE_OUT    : out   std_logic;
CHBONDDONE_OUT_LANE1    : out   std_logic;
----------------- Receive Ports - Clock Correction Ports -----------------
RXBUFERR_OUT      : out   std_logic;
RXBUFERR_OUT_LANE1      : out   std_logic;
------------- Receive Ports - Comma Detection and Alignment --------------
RXREALIGN_OUT     : out   std_logic;
RXREALIGN_OUT_LANE1     : out   std_logic;
ENMCOMMAALIGN_IN  : in    std_logic;
ENMCOMMAALIGN_IN_LANE1  : in    std_logic;
ENPCOMMAALIGN_IN  : in    std_logic;
ENPCOMMAALIGN_IN_LANE1  : in    std_logic;
----------------- Receive Ports - RX Data Path interface -----------------
RXDATA_OUT        : out   std_logic_vector (31 downto 0);
RXDATA_OUT_LANE1        : out   std_logic_vector (31 downto 0);
RXRESET_IN        : in    std_logic;
RXRESET_IN_LANE1        : in    std_logic;
RXUSRCLK_IN                               : in    std_logic;
RXUSRCLK2_IN                              : in    std_logic;
----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
RX1N_IN           : in    std_logic;
RX1N_IN_LANE1           : in    std_logic;
RX1P_IN           : in    std_logic;
RX1P_IN_LANE1           : in    std_logic;
--------------- Receive Ports - RX Polarity Control Ports ----------------
RXPOLARITY_IN     : in    std_logic;
RXPOLARITY_IN_LANE1     : in    std_logic;
------------------- Shared Ports - Tile and PLL Ports --------------------
REFCLK                                    : in    std_logic;
INIT_CLK_IN                               : in  std_logic;
PLL_NOT_LOCKED                            : in    std_logic;
GTRESET_IN                                : in    std_logic;
PLLLKDET_OUT      : out   std_logic;
PLLLKDET_OUT_LANE1      : out   std_logic;
    gt0_txresetdone_out         : out    std_logic;
    gt0_rxresetdone_out         : out    std_logic;
    gt0_txbufstatus_out         : out    std_logic_vector(1 downto 0);
    gt0_rxbufstatus_out         : out    std_logic_vector(2 downto 0);
    gt1_txresetdone_out         : out    std_logic;
    gt1_rxresetdone_out         : out    std_logic;
    gt1_txbufstatus_out         : out    std_logic_vector(1 downto 0);
    gt1_rxbufstatus_out         : out    std_logic_vector(2 downto 0);
TX_RESETDONE_OUT                          : out    std_logic;
RX_RESETDONE_OUT                          : out    std_logic;
-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
TXCHARISK_IN      : in    std_logic_vector (3 downto 0);
TXCHARISK_IN_LANE1      : in    std_logic_vector (3 downto 0);
---------------- Transmit Ports - TX Data Path interface -----------------
TXDATA_IN         : in    std_logic_vector (31 downto 0);
TXDATA_IN_LANE1         : in    std_logic_vector (31 downto 0);
TXOUTCLK1_OUT     : out   std_logic;
TXOUTCLK1_OUT_LANE1     : out   std_logic;
TXRESET_IN        : in    std_logic;
TXRESET_IN_LANE1        : in    std_logic;
TXUSRCLK_IN                               : in    std_logic;  
TXUSRCLK2_IN                              : in    std_logic;
TXBUFERR_OUT      : out   std_logic;
TXBUFERR_OUT_LANE1      : out   std_logic;
------------- Transmit Ports - TX Driver and OOB signalling --------------
TX1N_OUT          : out   std_logic;
TX1N_OUT_LANE1          : out   std_logic;
TX1P_OUT          : out   std_logic;
TX1P_OUT_LANE1          : out   std_logic;
---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
DRPADDR_IN                              : in   std_logic_vector(8 downto 0);
DRPCLK_IN                               : in   std_logic;
DRPDI_IN                                : in   std_logic_vector(15 downto 0);
DRPDO_OUT                               : out  std_logic_vector(15 downto 0);
DRPEN_IN                                : in   std_logic;
DRPRDY_OUT                              : out  std_logic;
DRPWE_IN                                : in   std_logic;
DRPADDR_IN_LANE1                              : in   std_logic_vector(8 downto 0);
DRPCLK_IN_LANE1                               : in   std_logic;
DRPDI_IN_LANE1                                : in   std_logic_vector(15 downto 0);
DRPDO_OUT_LANE1                               : out  std_logic_vector(15 downto 0);
DRPEN_IN_LANE1                                : in   std_logic;
DRPRDY_OUT_LANE1                              : out  std_logic;
DRPWE_IN_LANE1                                : in   std_logic;
--____________________________COMMON PORTS ,_______________________________{
    ------------------------- Common Block - QPLL Ports ------------------------
      gt0_qplllock_in       :  in  std_logic;
      gt0_qpllrefclklost_in :  in  std_logic;
      gt0_qpllreset_out     :  out std_logic;
   gt_qpllclk_quad1_in    : in  std_logic;
   gt_qpllrefclk_quad1_in : in  std_logic;
--____________________________COMMON PORTS _______________________________}


LINK_RESET_IN                           : in    std_logic;
RXFSM_DATA_VALID                        : in    std_logic; 
POWERDOWN_IN                            : in    std_logic
);

end video_mgt_GT_WRAPPER;


architecture MAPPED of video_mgt_GT_WRAPPER is
  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of MAPPED : architecture is "yes";
  attribute core_generation_info               : string;
attribute core_generation_info of MAPPED : architecture is "video_mgt,aurora_8b10b_v10_1,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=2,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=X,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=1,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=2,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=40000,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}";

    -- Parameter Declarations --
    constant DLY : time := 1 ns;

--***************************** Compopnent Declaration ****************************

component video_mgt_tx_startup_fsm
  Generic(
           GT_TYPE                  : string := "GTX";
           STABLE_CLOCK_PERIOD      : integer range 4 to 20 := 8; --Period of the stable clock driving this state-machine, unit is [ns]
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
           MMCM_RESET               : out STD_LOGIC:='0';      
           QPLL_RESET               : out STD_LOGIC:='0';        --Reset QPLL
           CPLL_RESET               : out STD_LOGIC:='0';        --Reset CPLL
           TX_FSM_RESET_DONE        : out STD_LOGIC:='0';        --Reset-sequence has sucessfully been finished.
           TXUSERRDY                : out STD_LOGIC:='0';
           RUN_PHALIGNMENT          : out STD_LOGIC:='0';
           RESET_PHALIGNMENT        : out STD_LOGIC:='0';
           PHALIGNMENT_DONE         : in  STD_LOGIC;
           
           RETRY_COUNTER            : out  STD_LOGIC_VECTOR (RETRY_COUNTER_BITWIDTH-1 downto 0):=(others=>'0')-- Number of 
                                                            -- Retries it took to get the transceiver up and running
           );
end component;

component video_mgt_rx_startup_fsm
  Generic(
           EXAMPLE_SIMULATION       : integer := 0;
           EQ_MODE                  : string := "DFE";
           GT_TYPE                  : string := "GTX";
           STABLE_CLOCK_PERIOD      : integer range 4 to 20 := 8; --Period of the stable clock driving this state-machine, unit is [ns]
           RETRY_COUNTER_BITWIDTH   : integer range 2 to 8  := 8; 
           TX_QPLL_USED             : boolean := False;           -- the TX and RX Reset FSMs must
           RX_QPLL_USED             : boolean := False;           -- share these two generic values
           PHASE_ALIGNMENT_MANUAL   : boolean := True             -- Decision if a manual phase-alignment is necessary or the automatic 
                                                                  -- is enough. For single-lane applications the automatic alignment is 
                                                                  -- sufficient                         
         );     
    Port ( STABLE_CLOCK             : in  STD_LOGIC;        --Stable Clock, either a stable clock from the PCB
                                                            --or reference-clock present at startup.
           RXUSERCLK                : in  STD_LOGIC;        --RXUSERCLK as used in the design
           SOFT_RESET               : in  STD_LOGIC;        --User Reset, can be pulled any time
           QPLLREFCLKLOST           : in  STD_LOGIC;        --QPLL Reference-clock for the GT is lost
           CPLLREFCLKLOST           : in  STD_LOGIC;        --CPLL Reference-clock for the GT is lost
           QPLLLOCK                 : in  STD_LOGIC;        --Lock Detect from the QPLL of the GT
           CPLLLOCK                 : in  STD_LOGIC;        --Lock Detect from the CPLL of the GT
           RXRESETDONE              : in  STD_LOGIC;
           MMCM_LOCK                : in  STD_LOGIC;
           RECCLK_STABLE            : in  STD_LOGIC;
           RECCLK_MONITOR_RESTART   : in  STD_LOGIC;
           DATA_VALID               : in  STD_LOGIC;
           TXUSERRDY                : in  STD_LOGIC;       --TXUSERRDY from GT 
           DONT_RESET_ON_DATA_ERROR : in  STD_LOGIC;
           GTRXRESET                : out STD_LOGIC:='0';
           MMCM_RESET               : out STD_LOGIC:='0';
           QPLL_RESET               : out STD_LOGIC:='0';  --Reset QPLL (only if RX uses QPLL)
           CPLL_RESET               : out STD_LOGIC:='0';  --Reset CPLL (only if RX uses CPLL)
           RX_FSM_RESET_DONE        : out STD_LOGIC:='0';  --Reset-sequence has sucessfully been finished.
           RXUSERRDY                : out STD_LOGIC:='0';
           RUN_PHALIGNMENT          : out STD_LOGIC;
           PHALIGNMENT_DONE         : in  STD_LOGIC; 
           RESET_PHALIGNMENT        : out STD_LOGIC:='0';           
           RXDFEAGCHOLD             : out STD_LOGIC;
           RXDFELFHOLD              : out STD_LOGIC;
           RXLPMLFHOLD              : out STD_LOGIC;
           RXLPMHFHOLD              : out STD_LOGIC;
           RETRY_COUNTER            : out STD_LOGIC_VECTOR (RETRY_COUNTER_BITWIDTH-1 downto 0):=(others=>'0')-- Number of 
                                                            -- Retries it took to get the transceiver up and running
           );
end component;



component video_mgt_multi_gt is
generic
(
    QPLL_FBDIV_TOP                 : integer  := 40;

    -- Simulation attributes
    WRAPPER_SIM_GTRESET_SPEEDUP     : string     :=  "FALSE";        -- Set to "TRUE" to speed up sim reset
    RX_DFE_KL_CFG2_IN               : bit_vector :=  X"3010D90C";
    PMA_RSV_IN                      : bit_vector :=  x"00018480"
);
port
(
--____________________________COMMON PORTS ,_______________________________{
   gt_qpllclk_quad1_i    : in  std_logic;
   gt_qpllrefclk_quad1_i : in  std_logic;
--____________________________COMMON PORTS _______________________________}


    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0 
    --____________________________CHANNEL PORTS________________________________
    ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
    GT0_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
    GT0_DRPCLK_IN                           : in   std_logic;
    GT0_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
    GT0_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
    GT0_DRPEN_IN                            : in   std_logic;
    GT0_DRPRDY_OUT                          : out  std_logic;
    GT0_DRPWE_IN                            : in   std_logic;
    ------------------------- Channel - Ref Clock Ports ------------------------
    GT0_GTREFCLK0_IN                        : in   std_logic;
    -------------------------------- Channel PLL -------------------------------
    GT0_CPLLFBCLKLOST_OUT                   : out  std_logic;
    GT0_CPLLLOCK_OUT                        : out  std_logic;
    GT0_CPLLLOCKDETCLK_IN                   : in   std_logic;
    GT0_CPLLREFCLKLOST_OUT                  : out  std_logic;
    GT0_CPLLRESET_IN                        : in   std_logic;
    ------------------------ Loopback and Powerdown Ports ----------------------
    GT0_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
    GT0_RXPD_IN                             : in   std_logic_vector(1 downto 0);
    GT0_TXPD_IN                             : in   std_logic_vector(1 downto 0);
    ------------------------------- Receive Ports ------------------------------
    GT0_eyescanreset_in                     : in   std_logic;
    GT0_RXUSERRDY_IN                        : in   std_logic;
    -------------------------- RX Margin Analysis Ports ------------------------
    GT0_eyescandataerror_out                : out  std_logic;
    GT0_eyescantrigger_in                   : in   std_logic;
    ----------------------- Receive Ports - 8b10b Decoder ----------------------
    GT0_RXCHARISCOMMA_OUT                   : out  std_logic_vector(3 downto 0);
    GT0_RXCHARISK_OUT                       : out  std_logic_vector(3 downto 0);
    GT0_RXDISPERR_OUT                       : out  std_logic_vector(3 downto 0);
    GT0_RXNOTINTABLE_OUT                    : out  std_logic_vector(3 downto 0);
    ------------------- Receive Ports - Pattern Checker Ports ------------------
    GT0_rxprbserr_out                       : out  std_logic;
    GT0_rxprbssel_in                        : in   std_logic_vector(2 downto 0);
    ------------------- Receive Ports - Pattern Checker ports ------------------
    GT0_rxprbscntreset_in                   : in   std_logic;
    ------------------- Receive Ports - Channel Bonding Ports ------------------
    GT0_RXCHANBONDSEQ_OUT                   : out  std_logic;
    GT0_RXCHBONDEN_IN                       : in   std_logic;
    GT0_RXCHBONDI_IN                        : in   std_logic_vector(4 downto 0);
    GT0_RXCHBONDLEVEL_IN                    : in   std_logic_vector(2 downto 0);
    GT0_RXCHBONDMASTER_IN                   : in   std_logic;
    GT0_RXCHBONDO_OUT                       : out  std_logic_vector(4 downto 0);
    GT0_RXCHBONDSLAVE_IN                    : in   std_logic;
    ------------------- Receive Ports - Channel Bonding Ports  -----------------
    GT0_RXCHANISALIGNED_OUT                 : out  std_logic;
    GT0_RXCHANREALIGN_OUT                   : out  std_logic;
    ------------------- Receive Ports - Clock Correction Ports -----------------
    GT0_RXCLKCORCNT_OUT                     : out  std_logic_vector(1 downto 0);
    --------------- Receive Ports - Comma Detection and Alignment --------------
    GT0_rxbyteisaligned_out                 : out  std_logic;
    GT0_RXBYTEREALIGN_OUT                   : out  std_logic;
    GT0_rxcommadet_out                      : out  std_logic;
    GT0_RXMCOMMAALIGNEN_IN                  : in   std_logic;
    GT0_RXPCOMMAALIGNEN_IN                  : in   std_logic;
    --------------------- Receive Ports - RX Equalizer Ports -------------------
    GT0_RXDFEAGCHOLD_IN                     : in   std_logic;
    GT0_RXDFELFHOLD_IN                      : in   std_logic;
    GT0_rxdfelpmreset_in                    : in   std_logic;
    GT0_rxmonitorout_out                    : out  std_logic_vector(6 downto 0);
    GT0_rxmonitorsel_in                     : in   std_logic_vector(1 downto 0);
    ------------------- Receive Ports - RX Data Path interface -----------------
    GT0_GTRXRESET_IN                        : in   std_logic;
    GT0_RXPCSRESET_IN                       : in   std_logic;
    GT0_RXPMARESET_IN                       : in   std_logic;
    GT0_RXDATA_OUT                          : out  std_logic_vector(31 downto 0);
    GT0_RXOUTCLK_OUT                        : out  std_logic;
    GT0_RXUSRCLK_IN                         : in   std_logic;
    GT0_RXUSRCLK2_IN                        : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GT0_GTXRXN_IN                           : in   std_logic;
    GT0_GTXRXP_IN                           : in   std_logic;
    GT0_RXCDRLOCK_OUT                       : out  std_logic;
    GT0_dmonitorout_out                     : out  std_logic_vector(7 downto 0);
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    GT0_rxbufreset_in                       : in   std_logic;
    GT0_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GT0_RXRESETDONE_OUT                     : out  std_logic;
    ------------------------ TX Configurable Driver Ports ----------------------
    GT0_txpostcursor_in                     : in   std_logic_vector(4 downto 0);
    GT0_txprecursor_in                      : in   std_logic_vector(4 downto 0);
    -------------------- Receive Ports - RX Margin Analysis ports ----------------
    GT0_rxlpmen_in                          : in   std_logic;
    GT0_rxcdrovrden_in                      : in   std_logic;
    GT0_rxcdrhold_in                        : in   std_logic;
    ----------------- Receive Ports - RX Polarity Control Ports ----------------
    GT0_RXPOLARITY_IN                       : in   std_logic;
    ------------------------------- Transmit Ports -----------------------------
    GT0_TXUSERRDY_IN                        : in   std_logic;
    ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    GT0_txchardispmode_in                   : in   std_logic_vector(3 downto 0);
    GT0_txchardispval_in                    : in   std_logic_vector(3 downto 0);
    GT0_TXCHARISK_IN                        : in   std_logic_vector(3 downto 0);
    ------------ Transmit Ports - TX Buffer and Phase Alignment Ports ----------
    GT0_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GT0_GTTXRESET_IN                        : in   std_logic;
    GT0_TXDATA_IN                           : in   std_logic_vector(31 downto 0);
    GT0_TXOUTCLK_OUT                        : out  std_logic;
    GT0_TXOUTCLKFABRIC_OUT                  : out  std_logic;
    GT0_TXOUTCLKPCS_OUT                     : out  std_logic;
    GT0_TXUSRCLK_IN                         : in   std_logic;
    GT0_TXUSRCLK2_IN                        : in   std_logic;
    --------------------- Transmit Ports - PCI Express Ports -------------------
    GT0_txelecidle_in                       : in   std_logic;
    ------------------ Transmit Ports - Pattern Generator Ports ----------------
    GT0_txprbsforceerr_in                   : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GT0_GTXTXN_OUT                          : out  std_logic;
    GT0_GTXTXP_OUT                          : out  std_logic;
    GT0_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
    GT0_txmaincursor_in                     : in   std_logic_vector(6 downto 0);
    ----------------- Transmit Ports - TX Polarity Control Ports ---------------
    GT0_txpolarity_in                       : in   std_logic;
    ------------------ Transmit Ports - pattern Generator Ports ----------------
    GT0_txprbssel_in                        : in   std_logic_vector(2 downto 0);
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GT0_txpcsreset_in                       : in   std_logic;
    GT0_txpmareset_in                       : in   std_logic;
    GT0_TXRESETDONE_OUT                     : out  std_logic;

    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT1 
    --____________________________CHANNEL PORTS________________________________
    ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
    GT1_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
    GT1_DRPCLK_IN                           : in   std_logic;
    GT1_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
    GT1_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
    GT1_DRPEN_IN                            : in   std_logic;
    GT1_DRPRDY_OUT                          : out  std_logic;
    GT1_DRPWE_IN                            : in   std_logic;
    ------------------------- Channel - Ref Clock Ports ------------------------
    GT1_GTREFCLK0_IN                        : in   std_logic;
    -------------------------------- Channel PLL -------------------------------
    GT1_CPLLFBCLKLOST_OUT                   : out  std_logic;
    GT1_CPLLLOCK_OUT                        : out  std_logic;
    GT1_CPLLLOCKDETCLK_IN                   : in   std_logic;
    GT1_CPLLREFCLKLOST_OUT                  : out  std_logic;
    GT1_CPLLRESET_IN                        : in   std_logic;
    ------------------------ Loopback and Powerdown Ports ----------------------
    GT1_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
    GT1_RXPD_IN                             : in   std_logic_vector(1 downto 0);
    GT1_TXPD_IN                             : in   std_logic_vector(1 downto 0);
    ------------------------------- Receive Ports ------------------------------
    GT1_eyescanreset_in                     : in   std_logic;
    GT1_RXUSERRDY_IN                        : in   std_logic;
    -------------------------- RX Margin Analysis Ports ------------------------
    GT1_eyescandataerror_out                : out  std_logic;
    GT1_eyescantrigger_in                   : in   std_logic;
    ----------------------- Receive Ports - 8b10b Decoder ----------------------
    GT1_RXCHARISCOMMA_OUT                   : out  std_logic_vector(3 downto 0);
    GT1_RXCHARISK_OUT                       : out  std_logic_vector(3 downto 0);
    GT1_RXDISPERR_OUT                       : out  std_logic_vector(3 downto 0);
    GT1_RXNOTINTABLE_OUT                    : out  std_logic_vector(3 downto 0);
    ------------------- Receive Ports - Pattern Checker Ports ------------------
    GT1_rxprbserr_out                       : out  std_logic;
    GT1_rxprbssel_in                        : in   std_logic_vector(2 downto 0);
    ------------------- Receive Ports - Pattern Checker ports ------------------
    GT1_rxprbscntreset_in                   : in   std_logic;
    ------------------- Receive Ports - Channel Bonding Ports ------------------
    GT1_RXCHANBONDSEQ_OUT                   : out  std_logic;
    GT1_RXCHBONDEN_IN                       : in   std_logic;
    GT1_RXCHBONDI_IN                        : in   std_logic_vector(4 downto 0);
    GT1_RXCHBONDLEVEL_IN                    : in   std_logic_vector(2 downto 0);
    GT1_RXCHBONDMASTER_IN                   : in   std_logic;
    GT1_RXCHBONDO_OUT                       : out  std_logic_vector(4 downto 0);
    GT1_RXCHBONDSLAVE_IN                    : in   std_logic;
    ------------------- Receive Ports - Channel Bonding Ports  -----------------
    GT1_RXCHANISALIGNED_OUT                 : out  std_logic;
    GT1_RXCHANREALIGN_OUT                   : out  std_logic;
    ------------------- Receive Ports - Clock Correction Ports -----------------
    GT1_RXCLKCORCNT_OUT                     : out  std_logic_vector(1 downto 0);
    --------------- Receive Ports - Comma Detection and Alignment --------------
    GT1_rxbyteisaligned_out                 : out  std_logic;
    GT1_RXBYTEREALIGN_OUT                   : out  std_logic;
    GT1_rxcommadet_out                      : out  std_logic;
    GT1_RXMCOMMAALIGNEN_IN                  : in   std_logic;
    GT1_RXPCOMMAALIGNEN_IN                  : in   std_logic;
    --------------------- Receive Ports - RX Equalizer Ports -------------------
    GT1_RXDFEAGCHOLD_IN                     : in   std_logic;
    GT1_RXDFELFHOLD_IN                      : in   std_logic;
    GT1_rxdfelpmreset_in                    : in   std_logic;
    GT1_rxmonitorout_out                    : out  std_logic_vector(6 downto 0);
    GT1_rxmonitorsel_in                     : in   std_logic_vector(1 downto 0);
    ------------------- Receive Ports - RX Data Path interface -----------------
    GT1_GTRXRESET_IN                        : in   std_logic;
    GT1_RXPCSRESET_IN                       : in   std_logic;
    GT1_RXPMARESET_IN                       : in   std_logic;
    GT1_RXDATA_OUT                          : out  std_logic_vector(31 downto 0);
    GT1_RXOUTCLK_OUT                        : out  std_logic;
    GT1_RXUSRCLK_IN                         : in   std_logic;
    GT1_RXUSRCLK2_IN                        : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GT1_GTXRXN_IN                           : in   std_logic;
    GT1_GTXRXP_IN                           : in   std_logic;
    GT1_RXCDRLOCK_OUT                       : out  std_logic;
    GT1_dmonitorout_out                     : out  std_logic_vector(7 downto 0);
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    GT1_rxbufreset_in                       : in   std_logic;
    GT1_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GT1_RXRESETDONE_OUT                     : out  std_logic;
    ------------------------ TX Configurable Driver Ports ----------------------
    GT1_txpostcursor_in                     : in   std_logic_vector(4 downto 0);
    GT1_txprecursor_in                      : in   std_logic_vector(4 downto 0);
    -------------------- Receive Ports - RX Margin Analysis ports ----------------
    GT1_rxlpmen_in                          : in   std_logic;
    GT1_rxcdrovrden_in                      : in   std_logic;
    GT1_rxcdrhold_in                        : in   std_logic;
    ----------------- Receive Ports - RX Polarity Control Ports ----------------
    GT1_RXPOLARITY_IN                       : in   std_logic;
    ------------------------------- Transmit Ports -----------------------------
    GT1_TXUSERRDY_IN                        : in   std_logic;
    ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    GT1_txchardispmode_in                   : in   std_logic_vector(3 downto 0);
    GT1_txchardispval_in                    : in   std_logic_vector(3 downto 0);
    GT1_TXCHARISK_IN                        : in   std_logic_vector(3 downto 0);
    ------------ Transmit Ports - TX Buffer and Phase Alignment Ports ----------
    GT1_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GT1_GTTXRESET_IN                        : in   std_logic;
    GT1_TXDATA_IN                           : in   std_logic_vector(31 downto 0);
    GT1_TXOUTCLK_OUT                        : out  std_logic;
    GT1_TXOUTCLKFABRIC_OUT                  : out  std_logic;
    GT1_TXOUTCLKPCS_OUT                     : out  std_logic;
    GT1_TXUSRCLK_IN                         : in   std_logic;
    GT1_TXUSRCLK2_IN                        : in   std_logic;
    --------------------- Transmit Ports - PCI Express Ports -------------------
    GT1_txelecidle_in                       : in   std_logic;
    ------------------ Transmit Ports - Pattern Generator Ports ----------------
    GT1_txprbsforceerr_in                   : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GT1_GTXTXN_OUT                          : out  std_logic;
    GT1_GTXTXP_OUT                          : out  std_logic;
    GT1_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
    GT1_txmaincursor_in                     : in   std_logic_vector(6 downto 0);
    ----------------- Transmit Ports - TX Polarity Control Ports ---------------
    GT1_txpolarity_in                       : in   std_logic;
    ------------------ Transmit Ports - pattern Generator Ports ----------------
    GT1_txprbssel_in                        : in   std_logic_vector(2 downto 0);
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GT1_txpcsreset_in                       : in   std_logic;
    GT1_txpmareset_in                       : in   std_logic;
    GT1_TXRESETDONE_OUT                     : out  std_logic

);
end component;

  function get_cdrlock_time(is_sim : in integer) return integer is
    variable lock_time: integer;
  begin
    if (is_sim = 1) then
      lock_time := 1000;
    else
      lock_time := 50000 / integer(4.0); --Typical CDR lock time is 50,000UI as per DS182/DS182
    end if;
    return lock_time;
  end function;

--***********************************Parameter Declarations********************

    constant STABLE_CLOCK_PERIOD  : integer := 20;  --Period of the stable clock driving this state-machine, unit is [ns]
    constant RX_CDRLOCK_TIME      : integer := get_cdrlock_time(EXAMPLE_SIMULATION);       -- 200us
    constant WAIT_TIME_CDRLOCK    : integer := RX_CDRLOCK_TIME / STABLE_CLOCK_PERIOD;      -- 200 us time-out

   signal rx_cdrlock_counter              : integer range 0 to WAIT_TIME_CDRLOCK:= 0 ;
   signal rx_cdrlocked                    : std_logic;
   signal gt_recclk_stable_i                 : std_logic;
   signal gt_pllrefclklost_i             : std_logic; 
   signal gt_pll_lock_i                   : std_logic; 
   signal gt0_txresetdone_i        : std_logic;
   signal gt0_rxresetdone_i        : std_logic;
   signal gt1_txresetdone_i        : std_logic;
   signal gt1_rxresetdone_i        : std_logic;
   signal txfsm_txresetdone_i                : std_logic;
   signal rxfsm_rxresetdone_i                : std_logic;
   signal txfsm_txresetdone_r                : std_logic;
   signal rxfsm_rxresetdone_r                : std_logic;
   signal rxfsm_rxresetdone_r2               : std_logic;
   signal rxfsm_rxresetdone_r3               : std_logic;
   signal gt_tx_reset_i                      : std_logic;
   signal gt_rx_reset_i                      : std_logic;
   signal cpll_reset_i                       : std_logic;  
   signal fsm_gt_rx_reset_t                  : std_logic;
   signal rxfsm_soft_reset_r                 : std_logic;
   signal gt_txuserrdy_i                     : std_logic;
   signal gt_rxuserrdy_i                     : std_logic;
   signal gt_rxdfeagchold_i                  : std_logic;
   signal gt_rxdfelfhold_i                   : std_logic;
 
   signal link_reset_r                       : std_logic;  
   signal link_reset_r2                      : std_logic;

   signal tied_to_ground_i                               : std_logic;
   signal tied_to_ground_vec_i                           : std_logic_vector (63 downto 0);
   signal tied_to_vcc_i                                  : std_logic;
signal chbondi                 : std_logic_vector (4 downto 0);
signal chbondo                 : std_logic_vector (4 downto 0);
signal chbondi_LANE1                 : std_logic_vector (4 downto 0);
signal chbondo_LANE1                 : std_logic_vector (4 downto 0);
   signal chbondi_unused_i                                    : std_logic_vector (4 downto 0);

   signal              gt0_txresetdone_r : std_logic;
   signal              gt0_txresetdone_r2 : std_logic;
   signal              gt0_txresetdone_r3 : std_logic;
   signal              gt0_rxresetdone_r : std_logic;
   signal              gt0_rxresetdone_r2 : std_logic;
   signal              gt0_rxresetdone_r3 : std_logic;
   signal              gt1_txresetdone_r : std_logic;
   signal              gt1_txresetdone_r2 : std_logic;
   signal              gt1_txresetdone_r3 : std_logic;
   signal              gt1_rxresetdone_r : std_logic;
   signal              gt1_rxresetdone_r2 : std_logic;
   signal              gt1_rxresetdone_r3 : std_logic;


   --concatenation or temp signals
   signal powerdown_i              : std_logic_vector(1 downto 0);
signal rx_buf_status_i    : std_logic_vector(2 downto 0);
signal tx_buf_status_i    : std_logic_vector(1 downto 0);
signal plllkdet_out_i     : std_logic;   
signal gt0_pllrefclklost_i            : std_logic; 
signal rx_buf_status_lane1_i    : std_logic_vector(2 downto 0);
signal tx_buf_status_lane1_i    : std_logic_vector(1 downto 0);
signal plllkdet_out_lane1_i     : std_logic;   
signal gt1_pllrefclklost_i            : std_logic; 


begin

  tied_to_ground_i                    <= '0';
  tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
  tied_to_vcc_i                       <= '1';


  powerdown_i               <=  POWERDOWN_IN & POWERDOWN_IN;
RXBUFERR_OUT        <=  rx_buf_status_i(2);
TXBUFERR_OUT        <=  tx_buf_status_i(1);
PLLLKDET_OUT        <=  plllkdet_out_i;
RXBUFERR_OUT_LANE1        <=  rx_buf_status_lane1_i(2);
TXBUFERR_OUT_LANE1        <=  tx_buf_status_lane1_i(1);
PLLLKDET_OUT_LANE1        <=  plllkdet_out_lane1_i;
  chbondi_unused_i          <= "00000";


   --Connect channel bonding bus

   chbondi <= chbondi_unused_i;

   chbondi_LANE1 <= chbondo;

      -- QPLL Reset
      gt0_qpllreset_out  <= '0';

    process(INIT_CLK_IN)
    begin
        if(INIT_CLK_IN'event and INIT_CLK_IN='1') then
            link_reset_r           <=  LINK_RESET_IN after DLY;
            link_reset_r2          <=  link_reset_r after DLY;
            gt_rx_reset_i          <=  fsm_gt_rx_reset_t after DLY;
            rxfsm_soft_reset_r     <=  link_reset_r2 or GTRESET_IN after DLY;
        end if;
    end process;

  gt_pllrefclklost_i  <= gt0_pllrefclklost_i and gt1_pllrefclklost_i ;
  gt_pll_lock_i       <= plllkdet_out_i and plllkdet_out_lane1_i ;
 
    gt0_txresetdone_out  <=   gt0_txresetdone_i;
    gt0_rxresetdone_out  <=   gt0_rxresetdone_i;
    gt0_txbufstatus_out  <=   tx_buf_status_i;
    gt0_rxbufstatus_out  <=   rx_buf_status_i;
    gt1_txresetdone_out  <=   gt1_txresetdone_i;
    gt1_rxresetdone_out  <=   gt1_rxresetdone_i;
    gt1_txbufstatus_out  <=   tx_buf_status_lane1_i;
    gt1_rxbufstatus_out  <=   rx_buf_status_lane1_i;

      --TXRESETDONE for lane0
    process(TXUSRCLK2_IN)
    begin
        if(TXUSRCLK2_IN'event and TXUSRCLK2_IN='1') then
            gt0_txresetdone_r  <=  gt0_txresetdone_i after DLY;
            gt0_txresetdone_r2 <=  gt0_txresetdone_r after DLY;
            gt0_txresetdone_r3 <=  gt0_txresetdone_r2 after DLY;
        end if;
    end process;

      --TXRESETDONE for lane1
    process(TXUSRCLK2_IN)
    begin
        if(TXUSRCLK2_IN'event and TXUSRCLK2_IN='1') then
            gt1_txresetdone_r  <=  gt1_txresetdone_i after DLY;
            gt1_txresetdone_r2 <=  gt1_txresetdone_r after DLY;
            gt1_txresetdone_r3 <=  gt1_txresetdone_r2 after DLY;
        end if;
    end process;

      --RXRESETDONE for lane0
    process(RXUSRCLK2_IN)
    begin
        if(RXUSRCLK2_IN'event and RXUSRCLK2_IN='1') then
            gt0_rxresetdone_r  <=  gt0_rxresetdone_i after DLY;
            gt0_rxresetdone_r2 <=  gt0_rxresetdone_r after DLY;
            gt0_rxresetdone_r3 <=  gt0_rxresetdone_r2 after DLY;
        end if;
    end process;

      --RXRESETDONE for lane1
    process(RXUSRCLK2_IN)
    begin
        if(RXUSRCLK2_IN'event and RXUSRCLK2_IN='1') then
            gt1_rxresetdone_r  <=  gt1_rxresetdone_i after DLY;
            gt1_rxresetdone_r2 <=  gt1_rxresetdone_r after DLY;
            gt1_rxresetdone_r3 <=  gt1_rxresetdone_r2 after DLY;
        end if;
    end process;

  
  txfsm_txresetdone_i  <= gt0_txresetdone_r3 and gt1_txresetdone_r3 ;
  rxfsm_rxresetdone_i  <= gt0_rxresetdone_r3 and gt1_rxresetdone_r3 ;

    process(TXUSRCLK2_IN)
    begin
        if(TXUSRCLK2_IN'event and TXUSRCLK2_IN='1') then
            txfsm_txresetdone_r   <=  txfsm_txresetdone_i after DLY;
        end if;
    end process;

    process(RXUSRCLK2_IN)
    begin
        if(RXUSRCLK2_IN'event and RXUSRCLK2_IN='1') then
            rxfsm_rxresetdone_r   <=  rxfsm_rxresetdone_i after DLY;
            rxfsm_rxresetdone_r2  <=  rxfsm_rxresetdone_r after DLY;
            rxfsm_rxresetdone_r3  <=  rxfsm_rxresetdone_r2 after DLY;
        end if;
    end process;

  RX_RESETDONE_OUT <= rxfsm_rxresetdone_r3;


gt_txresetfsm_i : video_mgt_tx_startup_fsm 

  generic map(
           GT_TYPE                  => "GTX", --GTX or GTH or GTP
           STABLE_CLOCK_PERIOD      => STABLE_CLOCK_PERIOD,           -- Period of the stable clock driving this state-machine, unit is [ns]
           RETRY_COUNTER_BITWIDTH   => 8, 
           TX_QPLL_USED             => FALSE ,                       -- the TX and RX Reset FSMs must
           RX_QPLL_USED             => FALSE,                        -- share these two generic values
           PHASE_ALIGNMENT_MANUAL   => FALSE                 -- Decision if a manual phase-alignment is necessary or the automatic 
                                                                     -- is enough. For single-lane applications the automatic alignment is 
                                                                     -- sufficient              
             )     
    port map ( 
        STABLE_CLOCK           =>        INIT_CLK_IN,
        TXUSERCLK              =>        TXUSRCLK2_IN,
        SOFT_RESET             =>        GTRESET_IN,
        QPLLREFCLKLOST         =>        tied_to_ground_i,
        CPLLREFCLKLOST         =>        gt_pllrefclklost_i,
        QPLLLOCK               =>        tied_to_vcc_i,
        CPLLLOCK               =>        gt_pll_lock_i,
        TXRESETDONE            =>        txfsm_txresetdone_r,
        MMCM_LOCK              =>        tied_to_vcc_i,
        GTTXRESET              =>        gt_tx_reset_i,
        MMCM_RESET             =>        open,
        QPLL_RESET             =>        open,
        CPLL_RESET             =>        cpll_reset_i,
        TX_FSM_RESET_DONE      =>        TX_RESETDONE_OUT,
        TXUSERRDY              =>        gt_txuserrdy_i,
        RUN_PHALIGNMENT        =>        open,
        RESET_PHALIGNMENT      =>        open,
        PHALIGNMENT_DONE       =>        tied_to_vcc_i,
        RETRY_COUNTER          =>        open 
           );




gt_rxresetfsm_i : video_mgt_rx_startup_fsm

  generic map(
           EXAMPLE_SIMULATION       => EXAMPLE_SIMULATION,
           GT_TYPE                  => "GTX", --GTX or GTH or GTP
           EQ_MODE                  => "DFE",                 --Rx Equalization Mode - Set to DFE or LPM
           STABLE_CLOCK_PERIOD      => STABLE_CLOCK_PERIOD,           --Period of the stable clock driving this state-machine, unit is [ns]
           RETRY_COUNTER_BITWIDTH   => 8, 
           TX_QPLL_USED             => FALSE ,                       -- the TX and RX Reset FSMs must
           RX_QPLL_USED             => FALSE,                        -- share these two generic values
           PHASE_ALIGNMENT_MANUAL   =>  FALSE                        -- Decision if a manual phase-alignment is necessary or the automatic 
                                                                     -- is enough. For single-lane applications the automatic alignment is 
                                                                     -- sufficient              
             )     
    port map ( 
        STABLE_CLOCK               =>    INIT_CLK_IN,
        RXUSERCLK                  =>    RXUSRCLK2_IN,
        SOFT_RESET                 =>    rxfsm_soft_reset_r,
        DONT_RESET_ON_DATA_ERROR   =>    tied_to_ground_i,
        QPLLREFCLKLOST             =>    tied_to_ground_i,
        CPLLREFCLKLOST             =>    gt_pllrefclklost_i,
        QPLLLOCK                   =>    tied_to_vcc_i,
        CPLLLOCK                   =>    gt_pll_lock_i,
        RXRESETDONE                =>    rxfsm_rxresetdone_r,
        MMCM_LOCK                  =>    tied_to_vcc_i,
        RECCLK_STABLE              =>    gt_recclk_stable_i,
        RECCLK_MONITOR_RESTART     =>    tied_to_ground_i,
        DATA_VALID                 =>    RXFSM_DATA_VALID,
        TXUSERRDY                  =>    gt_txuserrdy_i,
        GTRXRESET                  =>    fsm_gt_rx_reset_t,
        MMCM_RESET                 =>    open,
        QPLL_RESET                 =>    open,
        CPLL_RESET                 =>    open,
        RX_FSM_RESET_DONE          =>    open,
        RXUSERRDY                  =>    gt_rxuserrdy_i,
        RUN_PHALIGNMENT            =>    open,
        RESET_PHALIGNMENT          =>    open,
        PHALIGNMENT_DONE           =>    tied_to_vcc_i,
        RXDFEAGCHOLD               =>    gt_rxdfeagchold_i,
        RXDFELFHOLD                =>    gt_rxdfelfhold_i,
        RXLPMLFHOLD                =>    open,
        RXLPMHFHOLD                =>    open,
        RETRY_COUNTER              =>    open
           );

  cdrlock_timeout:process(INIT_CLK_IN)
  begin
    if rising_edge(INIT_CLK_IN) then
        if(gt_rx_reset_i = '1') then
          rx_cdrlocked       <= '0';
          rx_cdrlock_counter <=  0                        after DLY;
        elsif (rx_cdrlock_counter = WAIT_TIME_CDRLOCK) then
          rx_cdrlocked       <= '1';
          rx_cdrlock_counter <= rx_cdrlock_counter        after DLY;
        else
          rx_cdrlock_counter <= rx_cdrlock_counter + 1    after DLY;
        end if;
    end if;
  end process;

gt_recclk_stable_i                          <= rx_cdrlocked;


------------------------- GT Instantiations  -------------------------- 
   video_mgt_multi_gt_i : video_mgt_multi_gt
    generic map
    (
        -- Simulation attributes
        WRAPPER_SIM_GTRESET_SPEEDUP      => SIM_GTRESET_SPEEDUP

    )
    port map
    (
--____________________________COMMON PORTS INST_______________________________{
        gt_qpllclk_quad1_i     => gt_qpllclk_quad1_in    ,
        gt_qpllrefclk_quad1_i  => gt_qpllrefclk_quad1_in ,
--____________________________COMMON PORTS INST_______________________________}


        --_________________________________________________________________________
        --_________________________________________________________________________
        --GT0 
        ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
GT0_DRPADDR_IN                     => DRPADDR_IN,
GT0_DRPCLK_IN                      => DRPCLK_IN,
GT0_DRPDI_IN                       => DRPDI_IN,
GT0_DRPDO_OUT                      => DRPDO_OUT,
GT0_DRPEN_IN                       => DRPEN_IN,
GT0_DRPRDY_OUT                     => DRPRDY_OUT,
GT0_DRPWE_IN                       => DRPWE_IN,
        ------------------------- Channel - Ref Clock Ports ------------------------
        GT0_GTREFCLK0_IN                   => REFCLK,
        -------------------------------- Channel PLL -------------------------------
        GT0_CPLLFBCLKLOST_OUT              => OPEN,
        GT0_CPLLLOCK_OUT                   => plllkdet_out_i,
        GT0_CPLLLOCKDETCLK_IN              => INIT_CLK_IN,
        GT0_CPLLREFCLKLOST_OUT             => gt0_pllrefclklost_i,
        GT0_CPLLRESET_IN                   => cpll_reset_i,
        ------------------------ Loopback and Powerdown Ports ----------------------
        GT0_LOOPBACK_IN                    => LOOPBACK_IN,
        GT0_RXPD_IN                        => powerdown_i,
        GT0_TXPD_IN                        => powerdown_i,
        ------------------------------- Receive Ports ------------------------------
        GT0_RXUSERRDY_IN                   => gt_rxuserrdy_i,
        ----------------------- Receive Ports - 8b10b Decoder ----------------------
GT0_RXCHARISCOMMA_OUT              => RXCHARISCOMMA_OUT,
GT0_RXCHARISK_OUT                  => RXCHARISK_OUT,
GT0_RXDISPERR_OUT                  => RXDISPERR_OUT,
GT0_RXNOTINTABLE_OUT               => RXNOTINTABLE_OUT,
        ------------------- Receive Ports - Channel Bonding Ports ------------------
        GT0_RXCHANBONDSEQ_OUT              => OPEN,
GT0_RXCHBONDEN_IN                  => ENCHANSYNC_IN,
GT0_RXCHBONDI_IN                   => chbondi,
GT0_RXCHBONDLEVEL_IN               => CHAN_BOND_LEVEL,
GT0_RXCHBONDMASTER_IN              => CHAN_BOND_MASTER,
GT0_RXCHBONDO_OUT                  => chbondo,
GT0_RXCHBONDSLAVE_IN               => CHAN_BOND_SLAVE,
GT0_RXCHANISALIGNED_OUT            => CHBONDDONE_OUT,
        GT0_RXCHANREALIGN_OUT              => OPEN,
        ------------------- Receive Ports - Clock Correction Ports -----------------
        GT0_RXCLKCORCNT_OUT                => OPEN,
        --------------- Receive Ports - Comma Detection and Alignment --------------
GT0_RXBYTEREALIGN_OUT              => RXREALIGN_OUT,
GT0_RXMCOMMAALIGNEN_IN             => ENMCOMMAALIGN_IN,
GT0_RXPCOMMAALIGNEN_IN             => ENPCOMMAALIGN_IN,
    --------------------- Receive Ports - RX Equalizer Ports -------------------
    GT0_RXDFEAGCHOLD_IN          => gt_rxdfeagchold_i,
    GT0_RXDFELFHOLD_IN           => gt_rxdfelfhold_i,
        ------------------- Receive Ports - RX Data Path interface -----------------
        GT0_GTRXRESET_IN                   => gt_rx_reset_i,
GT0_RXDATA_OUT                     => RXDATA_OUT,
        GT0_RXOUTCLK_OUT                   => OPEN,
        GT0_RXUSRCLK_IN                    => RXUSRCLK_IN,
        GT0_RXUSRCLK2_IN                   => RXUSRCLK2_IN,
        ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
GT0_GTXRXN_IN                      => RX1N_IN,
GT0_GTXRXP_IN                      => RX1P_IN,
        gt0_txelecidle_in        => POWERDOWN_IN,
        GT0_RXCDRLOCK_OUT                  => OPEN,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
GT0_RXBUFSTATUS_OUT                => rx_buf_status_i,
        ------------------------ Receive Ports - RX PLL Ports ----------------------
        GT0_RXRESETDONE_OUT                => gt0_rxresetdone_i,
        ------------------------------- Transmit Ports -----------------------------
        GT0_TXUSERRDY_IN                   => gt_txuserrdy_i,
        ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
GT0_TXCHARISK_IN                   => TXCHARISK_IN,
        ----------- Transmit Ports - TX Buffer and Phase Alignment ---------
GT0_TXBUFSTATUS_OUT                => tx_buf_status_i,
        ----------------- Receive Ports - RX Polarity Control Ports ----------------
GT0_RXPOLARITY_IN                  => RXPOLARITY_IN,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        GT0_GTTXRESET_IN                   => gt_tx_reset_i,
GT0_TXDATA_IN                      => TXDATA_IN,
GT0_TXOUTCLK_OUT                   => TXOUTCLK1_OUT,
        GT0_TXOUTCLKFABRIC_OUT             => OPEN,
        GT0_TXOUTCLKPCS_OUT                => OPEN,
        GT0_TXUSRCLK_IN                    => TXUSRCLK_IN,
        GT0_TXUSRCLK2_IN                   => TXUSRCLK2_IN,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
GT0_GTXTXN_OUT                     => TX1N_OUT,
GT0_GTXTXP_OUT                     => TX1P_OUT,

         gt0_rxlpmen_in                     => tied_to_ground_i,
         gt0_rxcdrovrden_in                 => tied_to_ground_i,
         gt0_rxcdrhold_in                   => tied_to_ground_i,
         gt0_rxdfelpmreset_in               => tied_to_ground_i,
         gt0_rxmonitorout_out               => open,
         gt0_rxmonitorsel_in                => "00",

         gt0_eyescanreset_in                => tied_to_ground_i,
        -------------------------- RX Margin Analysis Ports ------------------------
         gt0_eyescandataerror_out           => open,
         gt0_eyescantrigger_in              => tied_to_ground_i,
         gt0_rxbyteisaligned_out            => open,
         gt0_rxcommadet_out                 => open,
        ------------------------ TX Configurable Driver Ports ----------------------
         gt0_txpostcursor_in                => "00000",
         gt0_txprecursor_in                 => "00000",
        ------------------ Transmit Ports - TX 8B/10B Encoder Ports ----------------
         gt0_txchardispmode_in              => "0000",
         gt0_txchardispval_in               => "0000",
         gt0_txdiffctrl_in                  => "1000",
         gt0_txmaincursor_in                => "0000000",
        ----------------- Transmit Ports - TX Polarity Control Ports ---------------
         gt0_txpolarity_in                  => tied_to_ground_i,
        ------------------- Receive Ports - Pattern Checker Ports ------------------
         gt0_rxprbserr_out               => open,
         gt0_rxprbssel_in                => "000",
        ------------------- Receive Ports - Pattern Checker ports ------------------
         gt0_rxprbscntreset_in           => tied_to_ground_i,
        ------------------- Receive Ports - RX Data Path interface -----------------
         gt0_rxpcsreset_in               => tied_to_ground_i,
         gt0_rxpmareset_in               => tied_to_ground_i,
         gt0_dmonitorout_out             => open,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
         gt0_rxbufreset_in               => tied_to_ground_i,
        ------------------ Transmit Ports - Pattern Generator Ports ----------------
         gt0_txprbsforceerr_in           => tied_to_ground_i,
         gt0_txprbssel_in                => "000",
        ------------------- Transmit Ports - TX Data Path interface -----------------
         gt0_txpcsreset_in               => tied_to_ground_i,
         gt0_txpmareset_in               => tied_to_ground_i,


        ----------------------- Transmit Ports - TX PLL Ports ----------------------
        GT0_TXRESETDONE_OUT                => gt0_txresetdone_i,

        --_________________________________________________________________________
        --_________________________________________________________________________
        --GT1 
        ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
GT1_DRPADDR_IN                     => DRPADDR_IN_LANE1,
GT1_DRPCLK_IN                      => DRPCLK_IN_LANE1,
GT1_DRPDI_IN                       => DRPDI_IN_LANE1,
GT1_DRPDO_OUT                      => DRPDO_OUT_LANE1,
GT1_DRPEN_IN                       => DRPEN_IN_LANE1,
GT1_DRPRDY_OUT                     => DRPRDY_OUT_LANE1,
GT1_DRPWE_IN                       => DRPWE_IN_LANE1,
        ------------------------- Channel - Ref Clock Ports ------------------------
        GT1_GTREFCLK0_IN                   => REFCLK,
        -------------------------------- Channel PLL -------------------------------
        GT1_CPLLFBCLKLOST_OUT              => OPEN,
        GT1_CPLLLOCK_OUT                   => plllkdet_out_lane1_i,
        GT1_CPLLLOCKDETCLK_IN              => INIT_CLK_IN,
        GT1_CPLLREFCLKLOST_OUT             => gt1_pllrefclklost_i,
        GT1_CPLLRESET_IN                   => cpll_reset_i,
        ------------------------ Loopback and Powerdown Ports ----------------------
        GT1_LOOPBACK_IN                    => LOOPBACK_IN,
        GT1_RXPD_IN                        => powerdown_i,
        GT1_TXPD_IN                        => powerdown_i,
        ------------------------------- Receive Ports ------------------------------
        GT1_RXUSERRDY_IN                   => gt_rxuserrdy_i,
        ----------------------- Receive Ports - 8b10b Decoder ----------------------
GT1_RXCHARISCOMMA_OUT              => RXCHARISCOMMA_OUT_LANE1,
GT1_RXCHARISK_OUT                  => RXCHARISK_OUT_LANE1,
GT1_RXDISPERR_OUT                  => RXDISPERR_OUT_LANE1,
GT1_RXNOTINTABLE_OUT               => RXNOTINTABLE_OUT_LANE1,
        ------------------- Receive Ports - Channel Bonding Ports ------------------
        GT1_RXCHANBONDSEQ_OUT              => OPEN,
GT1_RXCHBONDEN_IN                  => ENCHANSYNC_IN_LANE1,
GT1_RXCHBONDI_IN                   => chbondi_LANE1,
GT1_RXCHBONDLEVEL_IN               => CHAN_BOND_LEVEL_LANE1,
GT1_RXCHBONDMASTER_IN              => CHAN_BOND_MASTER_LANE1,
GT1_RXCHBONDO_OUT                  => chbondo_LANE1,
GT1_RXCHBONDSLAVE_IN               => CHAN_BOND_SLAVE_LANE1,
GT1_RXCHANISALIGNED_OUT            => CHBONDDONE_OUT_LANE1,
        GT1_RXCHANREALIGN_OUT              => OPEN,
        ------------------- Receive Ports - Clock Correction Ports -----------------
        GT1_RXCLKCORCNT_OUT                => OPEN,
        --------------- Receive Ports - Comma Detection and Alignment --------------
GT1_RXBYTEREALIGN_OUT              => RXREALIGN_OUT_LANE1,
GT1_RXMCOMMAALIGNEN_IN             => ENMCOMMAALIGN_IN_LANE1,
GT1_RXPCOMMAALIGNEN_IN             => ENPCOMMAALIGN_IN_LANE1,
    --------------------- Receive Ports - RX Equalizer Ports -------------------
    GT1_RXDFEAGCHOLD_IN          => gt_rxdfeagchold_i,
    GT1_RXDFELFHOLD_IN           => gt_rxdfelfhold_i,
        ------------------- Receive Ports - RX Data Path interface -----------------
        GT1_GTRXRESET_IN                   => gt_rx_reset_i,
GT1_RXDATA_OUT                     => RXDATA_OUT_LANE1,
        GT1_RXOUTCLK_OUT                   => OPEN,
        GT1_RXUSRCLK_IN                    => RXUSRCLK_IN,
        GT1_RXUSRCLK2_IN                   => RXUSRCLK2_IN,
        ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
GT1_GTXRXN_IN                      => RX1N_IN_LANE1,
GT1_GTXRXP_IN                      => RX1P_IN_LANE1,
        gt1_txelecidle_in        => POWERDOWN_IN,
        GT1_RXCDRLOCK_OUT                  => OPEN,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
GT1_RXBUFSTATUS_OUT                => rx_buf_status_lane1_i,
        ------------------------ Receive Ports - RX PLL Ports ----------------------
        GT1_RXRESETDONE_OUT                => gt1_rxresetdone_i,
        ------------------------------- Transmit Ports -----------------------------
        GT1_TXUSERRDY_IN                   => gt_txuserrdy_i,
        ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
GT1_TXCHARISK_IN                   => TXCHARISK_IN_LANE1,
        ----------- Transmit Ports - TX Buffer and Phase Alignment ---------
GT1_TXBUFSTATUS_OUT                => tx_buf_status_lane1_i,
        ----------------- Receive Ports - RX Polarity Control Ports ----------------
GT1_RXPOLARITY_IN                  => RXPOLARITY_IN_LANE1,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        GT1_GTTXRESET_IN                   => gt_tx_reset_i,
GT1_TXDATA_IN                      => TXDATA_IN_LANE1,
GT1_TXOUTCLK_OUT                   => TXOUTCLK1_OUT_LANE1,
        GT1_TXOUTCLKFABRIC_OUT             => OPEN,
        GT1_TXOUTCLKPCS_OUT                => OPEN,
        GT1_TXUSRCLK_IN                    => TXUSRCLK_IN,
        GT1_TXUSRCLK2_IN                   => TXUSRCLK2_IN,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
GT1_GTXTXN_OUT                     => TX1N_OUT_LANE1,
GT1_GTXTXP_OUT                     => TX1P_OUT_LANE1,

         gt1_rxlpmen_in                     => tied_to_ground_i,
         gt1_rxcdrovrden_in                 => tied_to_ground_i,
         gt1_rxcdrhold_in                   => tied_to_ground_i,
         gt1_rxdfelpmreset_in               => tied_to_ground_i,
         gt1_rxmonitorout_out               => open,
         gt1_rxmonitorsel_in                => "00",

         gt1_eyescanreset_in                => tied_to_ground_i,
        -------------------------- RX Margin Analysis Ports ------------------------
         gt1_eyescandataerror_out           => open,
         gt1_eyescantrigger_in              => tied_to_ground_i,
         gt1_rxbyteisaligned_out            => open,
         gt1_rxcommadet_out                 => open,
        ------------------------ TX Configurable Driver Ports ----------------------
         gt1_txpostcursor_in                => "00000",
         gt1_txprecursor_in                 => "00000",
        ------------------ Transmit Ports - TX 8B/10B Encoder Ports ----------------
         gt1_txchardispmode_in              => "0000",
         gt1_txchardispval_in               => "0000",
         gt1_txdiffctrl_in                  => "1000",
         gt1_txmaincursor_in                => "0000000",
        ----------------- Transmit Ports - TX Polarity Control Ports ---------------
         gt1_txpolarity_in                  => tied_to_ground_i,
        ------------------- Receive Ports - Pattern Checker Ports ------------------
         gt1_rxprbserr_out               => open,
         gt1_rxprbssel_in                => "000",
        ------------------- Receive Ports - Pattern Checker ports ------------------
         gt1_rxprbscntreset_in           => tied_to_ground_i,
        ------------------- Receive Ports - RX Data Path interface -----------------
         gt1_rxpcsreset_in               => tied_to_ground_i,
         gt1_rxpmareset_in               => tied_to_ground_i,
         gt1_dmonitorout_out             => open,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
         gt1_rxbufreset_in               => tied_to_ground_i,
        ------------------ Transmit Ports - Pattern Generator Ports ----------------
         gt1_txprbsforceerr_in           => tied_to_ground_i,
         gt1_txprbssel_in                => "000",
        ------------------- Transmit Ports - TX Data Path interface -----------------
         gt1_txpcsreset_in               => tied_to_ground_i,
         gt1_txpmareset_in               => tied_to_ground_i,


        ----------------------- Transmit Ports - TX PLL Ports ----------------------
        GT1_TXRESETDONE_OUT                => gt1_txresetdone_i
);

end MAPPED; 
