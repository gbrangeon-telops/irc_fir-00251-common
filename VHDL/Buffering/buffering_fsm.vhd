---------------------------------------------------------------------------------------------------
--  Copyright (c) Telops Inc. 2014
--
--  File: buffering_fsm.vhd
--  Use: MAnage cmd for the Datamover to read and write sequence to the DDR with the requiered Behavior
--  By: Jean-Alexis Boulet
--
--  $Revision: 20466 $
--  $Author: jdery $
--  $LastChangedDate: 2017-05-19 11:20:05 -0400 (ven., 19 mai 2017) $
--
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all;
use work.BufferingDefine.all;

entity BUFFERING_FSM is
    generic(
        BUF_TABLE_ADDR_WIDTH : integer;
        NB_MEMORY_ADDR_SPACES : integer
    );
    port(
        --clk and reset
        CLK_DATA         : in std_logic;
        ARESETN          : in std_logic;
            
        --DataMover interface
        AXIS_MM2S_CMD_MOSI  : out t_axi4_stream_mosi_cmd64;
        AXIS_MM2S_CMD_MISO  : in t_axi4_stream_miso;
            
        AXIS_MM2S_STS_MOSI  : in t_axi4_stream_mosi_status;
        AXIS_MM2S_STS_MISO  : out t_axi4_stream_miso;
            
        AXIS_S2MM_CMD_MOSI  : out t_axi4_stream_mosi_cmd64;
        AXIS_S2MM_CMD_MISO  : in t_axi4_stream_miso;
            
        AXIS_S2MM_STS_MOSI  : in t_axi4_stream_mosi_status;
        AXIS_S2MM_STS_MISO  : out t_axi4_stream_miso;

        --CTRL INTF
        BUFFER_MODE         : in BufferMode;
        NEW_IMAGE_DETECT    : in std_logic;
        ACQUISITION_STOP    : in std_logic;
        MOI                 : in std_logic;
        SEQ_WRITE_DONE      : out std_logic;
        FULL                : out std_logic;
        PAUSE               : out std_logic;

        --WRITE MODE
        CONFIG_VALID        : in STD_LOGIC;        
        NB_SEQUENCE         : in unsigned(BUF_TABLE_ADDR_WIDTH downto 0);
        FRAME_SIZE          : in unsigned(31 downto 0);         -- in pixels
        HDR_BYTESSIZE       : in unsigned(31 downto 0);         -- in bytes
        IMG_BYTESSIZE       : in unsigned(31 downto 0);         -- in bytes
        MEM0_BASE_ADDR      : in std_logic_vector(63 downto 0); -- START of DDR buffering memory 0 location
        MEM1_BASE_ADDR      : in std_logic_vector(63 downto 0); -- START of DDR buffering memory 1 location
        SEQ_IMG_TOTAL       : in unsigned(31 downto 0);
        NB_IMG_PRE          : in unsigned(31 downto 0); 
        NB_IMG_POST         : in unsigned(31 downto 0); -- including MOI
        WRITE_COMPLETED     : out std_logic;

        --READ MODE
        NB_SEQUENCE_IN_MEM  : out unsigned(BUF_TABLE_ADDR_WIDTH downto 0);
        NB_SEQUENCE_IN_MEM_VAL : out std_logic;
        READ_SEQUENCE_ID    : in unsigned(BUF_TABLE_ADDR_WIDTH downto 0);
        READ_START_ID       : in unsigned(31 downto 0);
        READ_STOP_ID        : in unsigned(31 downto 0);
        RD_MIN_FRAME_TIME   : in unsigned(31 downto 0);
        WATER_LEVEL         : in std_logic;
        READ_COMPLETED      : out std_logic;

        --TABLE INFORMATION TO STORE BUFFER INFORMATION
        BM_TABLE_ADDR       : out std_logic_vector(BUF_TABLE_ADDR_WIDTH-1 downto 0);
        BM_TABLE_WR_DATA    : out std_logic_vector(95 downto 0); -- [ END_IMG_LOC & MOI_LOC & START_LOC ]
        BM_TABLE_WREN       : out std_logic;
        BM_TABLE_REN        : out std_logic;
        BM_TABLE_RD_DATA    : in std_logic_vector(95 downto 0); -- [ END_IMG_LOC & MOI_LOC & START_LOC ]
        BM_TABLE_R_DVAL     : in std_logic; 

        --ERROR MONITORING
        WRITE_ERR : out std_logic_vector(3 downto 0);
        READ_ERR : out std_logic_vector(3 downto 0)      
    );
end BUFFERING_FSM;

architecture rtl of BUFFERING_FSM is
   
   -- declaring components explicitly eases synthesis file ordering mess!
   component SYNC_RESET is
      port(
         --clk and reset
         CLK    : in std_logic;
         ARESET : in std_logic;
         SRESET : out std_logic
         );
   end component;    
   
   component double_sync
      generic(
         INIT_VALUE : bit := '0'
      );
	   port(
   		D : in STD_LOGIC;
   		Q : out STD_LOGIC := '0';
   		RESET : in STD_LOGIC;
   		CLK : in STD_LOGIC
		);
   end component;
   
   constant CONFIG_VALID_DLY : integer := 16;

   --RESET
   signal sreset      : std_logic;
   signal img_write_reset : std_logic := '1'; 
   signal areset      : std_logic;

   --Config
   signal buffer_mode_s : BufferMode;
   signal frame_size_u :unsigned(FRAME_SIZE'length-1 downto 0);
   signal img_bytessize_u :unsigned(IMG_BYTESSIZE'length-1 downto 0);
   signal hdr_bytessize_u :unsigned(HDR_BYTESSIZE'length-1 downto 0);
   signal wr_baseaddr_u : unsigned(MEM0_BASE_ADDR'length-1 downto 0);
   signal rd_baseaddr_u : unsigned(MEM0_BASE_ADDR'length-1 downto 0);
   signal nb_sequence_u : unsigned(NB_SEQUENCE'length-1 downto 0);
   signal total_img_per_seq_u : unsigned(SEQ_IMG_TOTAL'length-1 downto 0);
   signal total_img_per_seq_minus1 : unsigned(SEQ_IMG_TOTAL'length-1 downto 0);
   signal config_valid_s : std_logic_vector(CONFIG_VALID_DLY-1 downto 0) := (others => '0'); 
   
   --WR CONFIG
   signal wr_acquisition_stop : std_logic;
   signal nb_img_pre_u : unsigned(NB_IMG_PRE'length-1 downto 0);
   signal nb_img_post_u : unsigned(NB_IMG_POST'length-1 downto 0);
   signal DIMMSeqSize_bytes_u : unsigned(35 downto 0); -- 2^35 = 32GB (2x16GB), so half size (2^34 value) can be expressed on 35 bits. Adding one more bit (36) for future support.
   signal wr_sequence_offset : unsigned(DIMMSeqSize_bytes_u'length-1 downto 0);
   signal wr_frame_offset : unsigned(DIMMSeqSize_bytes_u'length-1 downto 0);
   signal wr_memory_offset_temp : unsigned(MEM0_BASE_ADDR'length-1 downto 0); -- 64-bit address space !
   signal wr_memory_offset : unsigned(MEM0_BASE_ADDR'length-1 downto 0);      -- 64-bit address space !
   signal wr_img_memory_offset : unsigned(MEM0_BASE_ADDR'length-1 downto 0);  -- 64-bit address space !
   
   signal rd_sequence_offset : unsigned(DIMMSeqSize_bytes_u'length-1 downto 0);
   signal rd_image_offset : unsigned(DIMMSeqSize_bytes_u'length-1 downto 0);
   signal rd_memory_offset_temp : unsigned(MEM0_BASE_ADDR'length-1 downto 0); -- 64-bit address space !
   signal rd_memory_offset : unsigned(MEM0_BASE_ADDR'length-1 downto 0);      -- 64-bit address space !
   signal rd_img_memory_offset : unsigned(MEM0_BASE_ADDR'length-1 downto 0);  -- 64-bit address space !

   --RD CONFIG
   signal nb_seq_in_mem_u : unsigned(NB_SEQUENCE_IN_MEM'length-1 downto 0) := to_unsigned(0, NB_SEQUENCE_IN_MEM'length);
   signal nb_seq_in_mem_val_u : std_logic;
   signal read_seq_id_u : unsigned(READ_SEQUENCE_ID'length-1 downto 0);   
   signal read_start_id_u : unsigned(READ_START_ID'length-1 downto 0);
   signal read_stop_id_u : unsigned(READ_STOP_ID'length-1 downto 0);
   signal water_level_i : std_logic;

   signal rd_delay_cnt : unsigned(31 downto 0);
   signal rd_min_frame_time_hold : unsigned(31 downto 0);
   
   -- buffertable management
   signal seq_id : unsigned(NB_SEQUENCE_IN_MEM'length-1 downto 0) := to_unsigned(0, NB_SEQUENCE_IN_MEM'length);
   signal start_loc_s : unsigned(SEQ_IMG_TOTAL'length-1 downto 0);
   signal moi_loc_s : unsigned(SEQ_IMG_TOTAL'length-1 downto 0);
   signal end_loc_s : unsigned(SEQ_IMG_TOTAL'length-1 downto 0);
   signal write_buftable : std_logic;
   
   -- buffer ctrl
   signal moi_i : std_logic;
   signal new_image_detect_i : std_logic;
   signal seq_write_done_i : std_logic;
   
   --CMD constant
   constant c_xCACHE : std_logic_vector(3 downto 0) := "0011"; -- Recommended dflt value
   constant c_xUSER : std_logic_vector(3 downto 0) := "0000"; -- Not used
   constant c_RSVD : std_logic_vector(3 downto 0) := "0000"; -- Not used
   constant c_DRR : std_logic := '0'; -- Not used
   constant c_DSA : std_logic_vector(5 downto 0) := "000000"; -- Not used
   constant c_TYPE : std_logic := '1'; -- FIXED=0 , INCR=1 
   
   --CMD Signal
   signal s_mm2s_cmd_tag : std_logic_vector(3 downto 0) := (others => '0');
   signal s_s2mm_cmd_tag : std_logic_vector(3 downto 0) := (others => '0');
   signal s_mm2s_saddr : std_logic_vector(63 downto 0) := (others => '0');
   signal s_s2mm_saddr : std_logic_vector(63 downto 0) := (others => '0');
   signal s_mm2s_eof : std_logic := '0';
   signal s_s2mm_eof : std_logic := '0';
   signal s_mm2s_btt : std_logic_vector(22 downto 0) := (others => '0');
   signal s_s2mm_btt : std_logic_vector(22 downto 0) := (others => '0');  
   
   --OUTPUT Signal
   signal mm2s_err_o : std_logic_vector(3 downto 0); -- (SLVERR & DECERR & INTERR & TAGERR)
   signal s2mm_err_o : std_logic_vector(3 downto 0); -- (SLVERR & DECERR & INTERR & TAGERR)
   
   --Type definition
   signal write_state : BufferWrState := STANDBY_WR;
   signal next_write_state : BufferWrState := STANDBY_WR;
   signal read_state  : BufferRdState := STANDBY_RD;
   signal next_read_state  : BufferRdState := STANDBY_RD;
   
   signal write_img_loc : unsigned(SEQ_IMG_TOTAL'length-1 downto 0) := to_unsigned(0, SEQ_IMG_TOTAL'length); -- Location of the img write
   signal read_img_loc : unsigned(SEQ_IMG_TOTAL'length-1 downto 0) := to_unsigned(0, SEQ_IMG_TOTAL'length); -- Location of the img read 
  
  
   signal s2mm_cmd_mosi : t_axi4_stream_mosi_cmd64;
   signal mm2s_cmd_mosi : t_axi4_stream_mosi_cmd64;
   signal s2mm_cmd_miso : t_axi4_stream_miso;
   signal mm2s_cmd_miso : t_axi4_stream_miso;
  
   signal s2mm_sts_mosi : t_axi4_stream_mosi_status;
   signal mm2s_sts_mosi : t_axi4_stream_mosi_status;
   signal s2mm_sts_miso : t_axi4_stream_miso;
   signal mm2s_sts_miso : t_axi4_stream_miso;
  
   attribute keep : string; 
   attribute keep of write_state : signal is "TRUE";  
   attribute keep of next_write_state : signal is "TRUE";
   attribute keep of read_state : signal is "TRUE";
   attribute keep of next_read_state : signal is "TRUE";
--   attribute keep of s2mm_err_o : signal is "TRUE";
   attribute keep of read_img_loc : signal is "TRUE";
   attribute keep of write_img_loc : signal is "TRUE";
--   attribute keep of s2mm_cmd_mosi : signal is "TRUE";
--   attribute keep of s2mm_sts_mosi : signal is "TRUE";

begin

areset <= not ARESETN;

-- resync reset
inst_sync_reset : sync_reset port map(ARESET => areset, SRESET => sreset, CLK => CLK_DATA);
WL_sync : double_sync port map(D => WATER_LEVEL, Q => water_level_i, RESET => sreset, CLK => CLK_DATA);

frame_size_u <= FRAME_SIZE;
hdr_bytessize_u <= HDR_BYTESSIZE;
img_bytessize_u <= IMG_BYTESSIZE;
nb_sequence_u <= NB_SEQUENCE;
total_img_per_seq_u <= SEQ_IMG_TOTAL;

nb_img_pre_u <= NB_IMG_PRE;
nb_img_post_u <= NB_IMG_POST;

buffer_mode_s  <= BUFFER_MODE;


read_seq_id_u <= READ_SEQUENCE_ID;
read_start_id_u <= READ_START_ID;
read_stop_id_u <= READ_STOP_ID;

SEQ_WRITE_DONE <= seq_write_done_i;

-- MAP OUTPUTS
--Cmd structure generation
mm2s_cmd_mosi.TDATA <= std_logic_vector(c_RSVD & s_mm2s_cmd_tag & s_mm2s_saddr & c_DRR & s_mm2s_eof & c_DSA & c_TYPE & s_mm2s_btt);
s2mm_cmd_mosi.TDATA <= std_logic_vector(c_RSVD & s_s2mm_cmd_tag & s_s2mm_saddr & c_DRR & s_s2mm_eof & c_DSA & c_TYPE & s_s2mm_btt);


AXIS_MM2S_CMD_MOSI <= mm2s_cmd_mosi;
AXIS_MM2S_STS_MISO <= mm2s_sts_miso;
AXIS_S2MM_CMD_MOSI <= s2mm_cmd_mosi;
AXIS_S2MM_STS_MISO <= s2mm_sts_miso;

NB_SEQUENCE_IN_MEM <= nb_seq_in_mem_u;
NB_SEQUENCE_IN_MEM_VAL <= nb_seq_in_mem_val_u;


--map input
mm2s_cmd_miso <= AXIS_MM2S_CMD_MISO;
mm2s_sts_mosi <= AXIS_MM2S_STS_MOSI;
s2mm_cmd_miso <= AXIS_S2MM_CMD_MISO;
s2mm_sts_mosi <= AXIS_S2MM_STS_MOSI;

FULL <= '1' when (nb_seq_in_mem_u = nb_sequence_u) else '0';   
PAUSE <= '1' when (ACQUISITION_STOP = '1' and write_state = STANDBY_WR) else '0'; 

WRITE_ERR <= s2mm_err_o;
READ_ERR  <= mm2s_err_o;


-- Synchronous calculation for timing closure with the DSP48 bloc in the FSM
Synchronous_calc : process(CLK_DATA)
   variable DIMM_frame_size_u : unsigned(FRAME_SIZE'length-1 downto 0);
   variable DIMM_write_img_loc : unsigned(SEQ_IMG_TOTAL'length-1 downto 0);
   variable DIMM_read_img_loc : unsigned(SEQ_IMG_TOTAL'length-1 downto 0);
begin
   if rising_edge(CLK_DATA) then
      -- Reset immediately when config not valid, but wait a bit before releasing reset for calculations below
      -- from DIMMSeqSize_bytes_u to wr_img_memory_offset and rd_img_memory_offset
      if CONFIG_VALID = '0' then
         config_valid_s <= (others => '0');
      else
         config_valid_s(CONFIG_VALID_DLY-1) <= CONFIG_VALID;
         config_valid_s(CONFIG_VALID_DLY-2 downto 0) <= config_valid_s(CONFIG_VALID_DLY-1 downto 1);
      end if;
      img_write_reset <= sreset or not CONFIG_VALID or not config_valid_s(0);
      
      total_img_per_seq_minus1 <= total_img_per_seq_u - 1;
      
      if NB_MEMORY_ADDR_SPACES=1 then
         DIMM_frame_size_u := shift_left(frame_size_u,1);--Processing: frame_size in pix (x2)
         DIMM_write_img_loc := write_img_loc;
         DIMM_read_img_loc := read_img_loc;
         wr_baseaddr_u <= unsigned(MEM0_BASE_ADDR);
         rd_baseaddr_u <= unsigned(MEM0_BASE_ADDR);
      else -- Memory 0 contains even images and memory 1 contains odd images, so sequence offset and image offset are divided by 2 in each memory
         DIMM_frame_size_u := frame_size_u;              --Storage: frame_size in pix (x2) but we want HalfSize (/2) so it simplifies
         DIMM_write_img_loc := shift_right(write_img_loc,1); -- Divide image location by 2 (ODD/EVEN separated in both DIMMs)
         DIMM_read_img_loc := shift_right(read_img_loc,1); -- Divide image location by 2 (ODD/EVEN separated in both DIMMs)
         if (write_img_loc(0) = '0') then    --even images
            wr_baseaddr_u <= unsigned(MEM0_BASE_ADDR);
         else     --odd images
            wr_baseaddr_u <= unsigned(MEM1_BASE_ADDR);
         end if;
         if (read_img_loc(0) = '0') then    --even images
            rd_baseaddr_u <= unsigned(MEM0_BASE_ADDR);
         else     --odd images
            rd_baseaddr_u <= unsigned(MEM1_BASE_ADDR);
         end if;
      end if;

      DIMMSeqSize_bytes_u <= resize(DIMM_frame_size_u * total_img_per_seq_u, DIMMSeqSize_bytes_u'length);
      
      wr_sequence_offset <= resize(nb_seq_in_mem_u * DIMMSeqSize_bytes_u, wr_sequence_offset'length);
      wr_frame_offset <= resize( (DIMM_write_img_loc * shift_left(frame_size_u,1)), wr_frame_offset'length);
      wr_memory_offset_temp <= resize(wr_baseaddr_u + wr_sequence_offset, wr_memory_offset_temp'length);
      wr_memory_offset <= resize(wr_memory_offset_temp + wr_frame_offset, wr_memory_offset'length);
      wr_img_memory_offset <= resize(wr_memory_offset + hdr_bytessize_u, wr_img_memory_offset'length);
      
      rd_sequence_offset <= resize(read_seq_id_u * DIMMSeqSize_bytes_u, rd_sequence_offset'length);
      rd_image_offset <= resize( (DIMM_read_img_loc * shift_left(frame_size_u,1)), rd_image_offset'length);
      rd_memory_offset_temp <= resize(rd_baseaddr_u + rd_sequence_offset, rd_memory_offset_temp'length);
      rd_memory_offset <= resize(rd_memory_offset_temp + rd_image_offset, rd_memory_offset'length);
      rd_img_memory_offset <= resize(rd_memory_offset + hdr_bytessize_u, rd_img_memory_offset'length);

   end if;
end process Synchronous_calc;


img_write : process(CLK_DATA)
begin
    if rising_edge(CLK_DATA) then
       nb_seq_in_mem_val_u <= '0';
       
        if img_write_reset = '1' then
            write_state <= STANDBY_WR;
            next_write_state <= STANDBY_WR;

            s2mm_cmd_mosi.tvalid <= '0';
            
            write_img_loc <= (others => '0');
            
            nb_seq_in_mem_u <= to_unsigned(0,nb_seq_in_mem_u'length);
            nb_seq_in_mem_val_u <= '1';
            
            write_buftable <= '0';
            moi_i <= '0';
            seq_id <= (others => '0');
            
            new_image_detect_i <= '0';
            wr_acquisition_stop <= '0';
            WRITE_COMPLETED <= '0';
            seq_write_done_i <= '1'; 
        else
            if ACQUISITION_STOP = '1' then
               wr_acquisition_stop <= '1';
            end if;
            --CHECK MOI
            if(ACQUISITION_STOP = '1') then
                moi_i <= '0';
            elsif(MOI = '1') then
                moi_i <= '1';
            end if;
            
            if(NEW_IMAGE_DETECT = '1') then
                new_image_detect_i <= '1';
            end if;
            
            --Process state machine
            case write_state is
               when STANDBY_WR =>    
               
                    seq_write_done_i <= '1';  
               
                    if (nb_seq_in_mem_u = nb_sequence_u) or (wr_acquisition_stop = '1') then
                       WRITE_COMPLETED <= '1';
                    end if;
                    if(buffer_mode_s = BUF_WR_SEQ and new_image_detect_i = '1' and nb_seq_in_mem_u < nb_sequence_u and wr_acquisition_stop = '0') then --Mode Gige standard
                        seq_write_done_i <= '0';
                        new_image_detect_i <= '0';
                        --change state
                        if(moi_i = '1') then
                            next_write_state <= WR_POST_MOI;
                            moi_loc_s  <= to_unsigned(0,moi_loc_s'length);
                            start_loc_s <= to_unsigned(0,start_loc_s'length);
                            end_loc_s <= total_img_per_seq_minus1;
                            moi_i <= '0';
                        else
                            next_write_state <= WR_PRE_MOI;    
                        end if;
                        write_state <= WAIT_WR_HDR_CMD_ACK;
                        --fill the tag with the img position
                        s_s2mm_cmd_tag <= resize(std_logic_vector(write_img_loc), s_s2mm_cmd_tag'length);                        
                        s_s2mm_saddr <= resize(std_logic_vector(wr_memory_offset), s_s2mm_saddr'length); -- base +sequenceoffset + imageoffset
                        s_s2mm_eof <=  '1';
                        s_s2mm_btt <= resize(std_logic_vector(hdr_bytessize_u),s_s2mm_btt'length); -- in Bytes 
                        s2mm_cmd_mosi.tvalid <= '1';
                        
                        write_img_loc <= write_img_loc + 1;
                        --s2mm_err_o <= s2mm_err_o;

                    else
                        write_state <= STANDBY_WR;
                        --signal/output to assigned during the process
                        s_s2mm_cmd_tag <= (others => '0');
                        s_s2mm_saddr <= (others => '0');
                        s_s2mm_eof <='0'; 
                        s_s2mm_btt <= (others => '0');
                        s2mm_cmd_mosi.tvalid <= '0';
                        
                        write_img_loc <= write_img_loc;
                        --s2mm_err_o <= s2mm_err_o;    
                    end if;
                    write_buftable <= '0';
                    
                when WAIT_WR_HDR_CMD_ACK =>
                    if(s2mm_cmd_miso.tready = '1') then -- CMD transaction completed
                        --end wr_cmd transaction and move to next state
                        write_state <= WAIT_WR_IMG_CMD_ACK;
                        s2mm_cmd_mosi.tvalid <= '1';
                        --fill the tag with the img position
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;                        
                        s_s2mm_saddr <= resize(std_logic_vector(wr_img_memory_offset), s_s2mm_saddr'length); -- base +sequenceoffset + imageoffset
                        s_s2mm_eof <=  '1';
                        s_s2mm_btt <= resize(std_logic_vector(img_bytessize_u),s_s2mm_btt'length);


                        write_img_loc <= write_img_loc;
                        --s2mm_err_o <= s2mm_err_o;
                        
                    else
                        write_state <= write_state;
                        --signal/output to assigned during the process
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                        s_s2mm_saddr <=s_s2mm_saddr;
                        s_s2mm_eof <=s_s2mm_eof; 
                        s_s2mm_btt <= s_s2mm_btt;
                        s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                        
                        write_img_loc <= write_img_loc;
                        --s2mm_err_o <= s2mm_err_o;
                    end if;
                    write_buftable <= '0';
                    
                when WAIT_WR_IMG_CMD_ACK =>
                    if(s2mm_cmd_miso.tready = '1') then -- CMD transaction completed
                        --end wr_cmd transaction and move to next state
                        write_state <= next_write_state;
                        s2mm_cmd_mosi.tvalid <= '0';
                        --fill the tag with the img position
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;                        
                        s_s2mm_saddr <= s_s2mm_saddr; -- base +sequenceoffset + imageoffset
                        s_s2mm_eof <=  s_s2mm_eof;
                        s_s2mm_btt <= s_s2mm_btt;


                        write_img_loc <= write_img_loc;
                        --s2mm_err_o <= s2mm_err_o;
                        
                    else
                        write_state <= write_state;
                        --signal/output to assigned during the process
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                        s_s2mm_saddr <=s_s2mm_saddr;
                        s_s2mm_eof <=s_s2mm_eof; 
                        s_s2mm_btt <= s_s2mm_btt;
                        s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                        
                        write_img_loc <= write_img_loc;
                        --s2mm_err_o <= s2mm_err_o;
                    end if;
                    write_buftable <= '0';                    

                when WR_PRE_MOI =>
                    --Send a write cmd
                    --ATTENTION AU CAS PAS DE MOI POUR LE RETOUR A STANDBY
                   --wait for the last cmd to be process then send the next cmd(write_img)
                   --change state
                    if( wr_acquisition_stop = '1') then
                        write_state <= STANDBY_WR;
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                        s_s2mm_saddr <=s_s2mm_saddr;
                        s_s2mm_eof <=s_s2mm_eof; 
                        s_s2mm_btt <= s_s2mm_btt;
                        s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                        
                        write_img_loc <= to_unsigned(0,write_img_loc'length);
                        --s2mm_err_o <= s2mm_err_o;
                    elsif(new_image_detect_i = '1') then
                        new_image_detect_i <= '0';
                        if(moi_i = '1') then
                            next_write_state <= WR_POST_MOI;
                            start_loc_s <= to_unsigned(0,start_loc_s'length);
                            moi_loc_s  <= write_img_loc;
                            end_loc_s <= total_img_per_seq_minus1;
                            moi_i <= '0';
                        elsif(write_img_loc >= nb_img_pre_u) then
                            next_write_state <= WR_WAIT_MOI;
                        else
                            next_write_state <= WR_PRE_MOI;
                        end if;
                        write_state <= WAIT_WR_HDR_CMD_ACK;
                        
                        --fill the tag with the img position
                        s_s2mm_cmd_tag <= resize(std_logic_vector(write_img_loc), s_s2mm_cmd_tag'length); 
                        s_s2mm_saddr <= resize(std_logic_vector(wr_memory_offset), s_s2mm_saddr'length);
                        s_s2mm_eof <=  '1';
                        s_s2mm_btt <= resize(std_logic_vector(hdr_bytessize_u),s_s2mm_btt'length); -- in Bytes
                        s2mm_cmd_mosi.tvalid <= '1'; --invalidate de data
                        
                        if (write_img_loc = total_img_per_seq_minus1) then -- write loc from 0 to total_img_per_seq_u-1
                            write_img_loc <= to_unsigned(0,write_img_loc'length);
                        else 
                            write_img_loc <= write_img_loc + 1;
                        end if;
                        --s2mm_err_o <= s2mm_err_o;
                    else
                        write_state <= write_state;
                        --signal/output to assigned during the process
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                        s_s2mm_saddr <=s_s2mm_saddr;
                        s_s2mm_eof <=s_s2mm_eof; 
                        s_s2mm_btt <= s_s2mm_btt;
                        s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                        
                        write_img_loc <= write_img_loc;
                        --s2mm_err_o <= s2mm_err_o;
                    end if;
                    write_buftable <= '0';
                when WR_WAIT_MOI =>
                --Send a write cmd
                    if( wr_acquisition_stop = '1') then
                        write_state <= STANDBY_WR;
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                        s_s2mm_saddr <=s_s2mm_saddr;
                        s_s2mm_eof <=s_s2mm_eof; 
                        s_s2mm_btt <= s_s2mm_btt;
                        s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                        
                        write_img_loc <= to_unsigned(0,write_img_loc'length);
                        --s2mm_err_o <= s2mm_err_o;
                        write_buftable <= '0';
                    elsif(new_image_detect_i = '1') then
                        new_image_detect_i <= '0';
                        --wait for the last cmd to be process then wait for the 2 cmd sts
                        --change state
                        if(moi_i = '1') then
                            moi_i <= '0';

                            moi_loc_s  <= write_img_loc;
                            if(nb_img_pre_u = total_img_per_seq_minus1) then --Buf lin, MOI end of seq
                                next_write_state <= STANDBY_WR;
                                write_img_loc <=  to_unsigned(0,write_img_loc'length);
                                write_buftable <= '1';
                                seq_id <= nb_seq_in_mem_u;
                                nb_seq_in_mem_u <= nb_seq_in_mem_u + 1;
                                nb_seq_in_mem_val_u <= '1';
                                
                                end_loc_s <= write_img_loc;
                                if(write_img_loc > nb_img_pre_u) then
                                    start_loc_s <= write_img_loc - nb_img_pre_u;
                                elsif(write_img_loc = nb_img_pre_u) then
                                    start_loc_s <= to_unsigned(0,start_loc_s'length);
                                elsif(write_img_loc < nb_img_pre_u) then
                                    start_loc_s <= total_img_per_seq_u + write_img_loc - nb_img_pre_u;
                                end if;
                                
                                
                            else
                                next_write_state <= WR_POST_MOI;
                                
                                if (write_img_loc = total_img_per_seq_minus1) then -- write loc from 0 to total_img_per_seq_u-1
                                    write_img_loc <= to_unsigned(0,write_img_loc'length);
                                else 
                                    write_img_loc <= write_img_loc + 1;
                                end if;

                                if(write_img_loc > nb_img_pre_u) then
                                    start_loc_s <= write_img_loc - nb_img_pre_u;
                                    end_loc_s <= write_img_loc - nb_img_pre_u -1;
                                elsif(write_img_loc = nb_img_pre_u) then
                                    start_loc_s <= to_unsigned(0,start_loc_s'length);
                                    end_loc_s <= total_img_per_seq_minus1;
                                elsif(write_img_loc < nb_img_pre_u) then
                                    start_loc_s <= total_img_per_seq_u + write_img_loc - nb_img_pre_u;
                                    end_loc_s <= write_img_loc + nb_img_post_u - 1;
                                end if;
                                write_buftable <= '0';
                            end if;
                            
                        else
                            next_write_state <= WR_WAIT_MOI;
                            write_buftable <= '0';
                                if (write_img_loc = total_img_per_seq_minus1) then -- write loc from 0 to total_img_per_seq_u-1
                                    write_img_loc <= to_unsigned(0,write_img_loc'length);
                                else 
                                    write_img_loc <= write_img_loc + 1;
                                end if;
                        end if;
                        write_state <= WAIT_WR_HDR_CMD_ACK;
                        
                        --fill the tag with the img position
                        s_s2mm_cmd_tag <= resize(std_logic_vector(write_img_loc), s_s2mm_cmd_tag'length); 
                        s_s2mm_saddr <= resize(std_logic_vector(wr_memory_offset), s_s2mm_saddr'length);
                        s_s2mm_eof <=  '1';
                        s_s2mm_btt <= resize(std_logic_vector(hdr_bytessize_u),s_s2mm_btt'length); -- in Bytes
                        s2mm_cmd_mosi.tvalid <= '1'; --invalidate de data
                        
                        --s2mm_err_o <= s2mm_err_o;
                    else
                        write_state <= write_state;
                        --signal/output to assigned during the process
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                        s_s2mm_saddr <=s_s2mm_saddr;
                        s_s2mm_eof <=s_s2mm_eof; 
                        s_s2mm_btt <= s_s2mm_btt;
                        s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                        
                        write_img_loc <= write_img_loc;
                        --s2mm_err_o <= s2mm_err_o;
                        write_buftable <= '0';
                    end if;
                    
                when WR_POST_MOI =>
                    moi_i <= '0';
                    if( new_image_detect_i = '1') then
                        new_image_detect_i <= '0';
                        if( write_img_loc = end_loc_s or wr_acquisition_stop = '1') then
                            next_write_state <= STANDBY_WR;
                            end_loc_s <= write_img_loc;
                            write_buftable <= '1';
                            seq_id <= nb_seq_in_mem_u;
                            nb_seq_in_mem_u <= nb_seq_in_mem_u + 1;
                            nb_seq_in_mem_val_u <= '1';
                            write_img_loc <= to_unsigned(0,write_img_loc'length);
                        else
                            next_write_state <= WR_POST_MOI;
                            write_buftable <= '0';
                            
                            if (write_img_loc = total_img_per_seq_minus1) then -- write loc from 0 to total_img_per_seq_u-1
                                write_img_loc <= to_unsigned(0,write_img_loc'length);
                            else 
                                write_img_loc <= write_img_loc + 1;
                            end if;
                            
                        end if;
                        write_state <= WAIT_WR_HDR_CMD_ACK;
                        
                        --fill the tag with the img position
                        s_s2mm_cmd_tag <= resize(std_logic_vector(write_img_loc), s_s2mm_cmd_tag'length); 
                        s_s2mm_saddr <= resize(std_logic_vector(wr_memory_offset), s_s2mm_saddr'length);
                        s_s2mm_eof <=  '1';
                        s_s2mm_btt <= resize(std_logic_vector(hdr_bytessize_u),s_s2mm_btt'length); -- in Bytes 
                        s2mm_cmd_mosi.tvalid <= '1'; --invalidate de data
                        
                        
                        --s2mm_err_o <= s2mm_err_o;
                    elsif(wr_acquisition_stop = '1') then
                        write_state <= STANDBY_WR;
                        if (write_img_loc /= 0) then
                           end_loc_s <= write_img_loc - 1;
                        else
                           end_loc_s <= total_img_per_seq_minus1;
                        end if;
                        
                        write_buftable <= '1';
                        seq_id <= nb_seq_in_mem_u;
                        nb_seq_in_mem_u <= nb_seq_in_mem_u + 1;
                        nb_seq_in_mem_val_u <= '1';
                        write_img_loc <= to_unsigned(0,write_img_loc'length);

                        --signal/output to assigned during the process
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                        s_s2mm_saddr <=s_s2mm_saddr;
                        s_s2mm_eof <=s_s2mm_eof; 
                        s_s2mm_btt <= s_s2mm_btt;
                        s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                    else
                        write_state <= write_state;
                        --signal/output to assigned during the process
                        s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                        s_s2mm_saddr <=s_s2mm_saddr;
                        s_s2mm_eof <=s_s2mm_eof; 
                        s_s2mm_btt <= s_s2mm_btt;
                        s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                        
                        write_img_loc <= write_img_loc;
                        --s2mm_err_o <= s2mm_err_o;
                        write_buftable <= '0';
                    end if;
                    
                when ERROR_WR =>
                    if( s2mm_sts_mosi.tvalid = '1') then --wait for the transmision status
                    --Check if the reception is valid
                        if ( (s2mm_sts_mosi.tdata(7) = '1') and (s2mm_sts_mosi.tdata(6 downto 4) = "000") and (unsigned(s2mm_sts_mosi.tdata(3 downto 0)) = write_img_loc) ) then --transmit valid

                            --We move to the next state
                            write_state <= STANDBY_WR;
                            --fill the tag with the img position
                            s_s2mm_cmd_tag <= (others => '0');                        
                            s_s2mm_saddr <= (others => '0');
                            s_s2mm_eof <=  '0';
                            s_s2mm_btt <= (others => '0'); -- Transfert the entire img in 1 cmd
                            s2mm_cmd_mosi.tvalid <= '0';
                            
                            write_img_loc <= write_img_loc;

                            --s2mm_err_o <= s2mm_err_o;
                        else -- there was an transmit error
                            write_state <= ERROR_WR;
                            --signal/output to assigned during the process
                            s_s2mm_cmd_tag <= (others => '0');
                            s_s2mm_saddr <= (others => '0');
                            s_s2mm_eof <=  '0';
                            s_s2mm_btt <= (others => '0');
                            s2mm_cmd_mosi.tvalid <= '0';
                            
                            write_img_loc <= to_unsigned(0,write_img_loc'length);


                            --s2mm_err_o(3 downto 1) <= s2mm_sts_mosi.tdata(6 downto 4);
   

                        end if;     
                    else --wait until transmis is over
                        write_state <= write_state;
                        s_s2mm_cmd_tag <= (others => '0');
                        s_s2mm_saddr <= (others => '0');
                        s_s2mm_eof <='0'; 
                        s_s2mm_btt <= (others => '0');
                        s2mm_cmd_mosi.tvalid <= '0';
                        
                        write_img_loc <= write_img_loc;

                        --s2mm_err_o <= s2mm_err_o;
                    end if;
                    write_buftable <= '0';
                when others =>
                    write_state <= write_state;
                    --signal/output to assigned during the process
                    s_s2mm_cmd_tag <= s_s2mm_cmd_tag;
                    s_s2mm_saddr <=s_s2mm_saddr;
                    s_s2mm_eof <=s_s2mm_eof; 
                    s_s2mm_btt <= s_s2mm_btt;
                    s2mm_cmd_mosi.tvalid <= s2mm_cmd_mosi.tvalid;
                    
                    write_img_loc <= write_img_loc;
                    --s2mm_err_o <= s2mm_err_o;
            end case;
            
        end if;
    end if;

end process img_write;

write_buffer_table : process(CLK_DATA)
begin
    if rising_edge(CLK_DATA) then
        if(write_buftable = '1') then
            BM_TABLE_ADDR       <= std_logic_vector(seq_id(BM_TABLE_ADDR'length-1 downto 0));
            BM_TABLE_WREN       <= '1';
            BM_TABLE_WR_DATA    <= std_logic_vector(end_loc_s & moi_loc_s & start_loc_s);
            BM_TABLE_REN        <= '0';
        else
            BM_TABLE_ADDR       <= std_logic_vector(seq_id(BM_TABLE_ADDR'length-1 downto 0));
            BM_TABLE_WREN       <= '0';
            BM_TABLE_WR_DATA    <= std_logic_vector(end_loc_s & moi_loc_s & start_loc_s);
            BM_TABLE_REN        <= '0';
        end if;
    end if;
end process;
--We read the image frame by frame not hdr and img split in 2 for gige
 
img_read : process(CLK_DATA)
begin
    if rising_edge(CLK_DATA) then
        if img_write_reset = '1' then
            read_state <= STANDBY_RD;

            mm2s_cmd_mosi.tvalid <= '0';
            read_img_loc <= read_start_id_u;
            mm2s_err_o <= (others => '0');
            mm2s_sts_miso.tready <= '0';
            
            rd_delay_cnt <= (others => '0');
            READ_COMPLETED <= '1';
        else
            READ_COMPLETED <= '0';
            rd_delay_cnt <= rd_delay_cnt + 1;
           
            case read_state is
                when STANDBY_RD =>
                
                     rd_min_frame_time_hold <= RD_MIN_FRAME_TIME;
               
                     if(buffer_mode_s = BUF_RD_IMG and water_level_i = '0') then --Mode Gige standard and image available
                        --change state
                        read_state <= WAIT_RD_HDR_ACK;

                        --fill the tag with the img position
                        s_mm2s_cmd_tag <= resize(std_logic_vector(read_img_loc), s_mm2s_cmd_tag'length);                        
                        s_mm2s_saddr <= resize(std_logic_vector(rd_memory_offset), s_mm2s_saddr'length);
                        s_mm2s_eof <=  '1';
                        s_mm2s_btt <= resize(std_logic_vector(hdr_bytessize_u),s_s2mm_btt'length); -- Transfert of the hdr data 
                        mm2s_cmd_mosi.tvalid <= '1';
                        mm2s_sts_miso.tready <= '0';
                        
                        if(read_img_loc = read_stop_id_u) then -- only one image to read
                            next_read_state <= RD_SEQ_END;
                            read_img_loc <= read_start_id_u;
                        elsif(read_img_loc = total_img_per_seq_minus1) then
                            next_read_state <= RD_IMG;
                            read_img_loc <= to_unsigned(0,read_img_loc'length); -- counter reset at 0
                        else
                            next_read_state <= RD_IMG;
                            read_img_loc <= read_img_loc + 1; --increase counter position
                        end if;
 
                    else
                        read_state <= STANDBY_RD;
                        --signal/output to assigned during the process
                        s_mm2s_cmd_tag <= (others => '0');
                        s_mm2s_saddr <= (others => '0');
                        s_mm2s_eof <='0'; 
                        s_mm2s_btt <= (others => '0');
                        mm2s_cmd_mosi.tvalid <= '0';
                        mm2s_sts_miso.tready <= '0';
                        
                        read_img_loc <= read_start_id_u;
                    end if;
          
               when RD_IMG =>
                   if(buffer_mode_s = BUF_RD_IMG and water_level_i = '0') then --Mode Gige standard and image available
                                         
                        read_state <= WAIT_RD_HDR_ACK;
                        --fill the tag with the img position
                        s_mm2s_cmd_tag <= resize(std_logic_vector(read_img_loc), s_mm2s_cmd_tag'length);                        
                        s_mm2s_saddr <= resize(std_logic_vector(rd_memory_offset), s_mm2s_saddr'length);
                        s_mm2s_eof <=  '1';
                        s_mm2s_btt <= resize(std_logic_vector(hdr_bytessize_u),s_s2mm_btt'length); -- Transfert of the hdr data 
                        mm2s_cmd_mosi.tvalid <= '1';
                        mm2s_sts_miso.tready <= '0';
                        
                        

                        if(read_img_loc = read_stop_id_u) then -- only one image to read
                            next_read_state <= RD_SEQ_END;
                            read_img_loc <= read_start_id_u;
                        elsif(read_img_loc = total_img_per_seq_minus1) then
                            next_read_state <= RD_IMG;
                            read_img_loc <= to_unsigned(0,read_img_loc'length); -- counter reset at 0
                        else
                            next_read_state <= RD_IMG;
                            read_img_loc <= read_img_loc + 1; --increase counter position
                        end if;
                   else
                        if(water_level_i = '1') then
                            read_state <= RD_WAIT_SINK_RDY;
                        else
                            read_state <= read_state;
                        end if;
                        
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <=s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <=s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= mm2s_cmd_mosi.tvalid;
                       mm2s_sts_miso.tready <= '0';
                       
                       read_img_loc <= read_img_loc;
                   end if; 
               
               when RD_WAIT_SINK_RDY =>
                   if(buffer_mode_s = BUF_RD_IMG and water_level_i = '0') then -- EXIT PAUSE MODE
                        read_state <= WAIT_RD_HDR_ACK;

                        --fill the tag with the img position
                        s_mm2s_cmd_tag <= resize(std_logic_vector(read_img_loc), s_mm2s_cmd_tag'length);                        
                        s_mm2s_saddr <= resize(std_logic_vector(rd_memory_offset), s_mm2s_saddr'length);
                        s_mm2s_eof <=  '1';
                        s_mm2s_btt <= resize(std_logic_vector(hdr_bytessize_u),s_s2mm_btt'length); -- Transfert of the hdr data 
                        mm2s_cmd_mosi.tvalid <= '1';
                        mm2s_sts_miso.tready <= '0';
                        
                        

                        if(read_img_loc = read_stop_id_u) then -- only one image to read
                            next_read_state <= RD_SEQ_END;
                            read_img_loc <= read_start_id_u;
                        elsif(read_img_loc = total_img_per_seq_minus1) then
                            next_read_state <= RD_IMG;
                            read_img_loc <= to_unsigned(0,read_img_loc'length); -- counter reset at 0
                        else
                            next_read_state <= RD_IMG;
                            read_img_loc <= read_img_loc + 1; --increase counter position
                        end if;
                   else
                       read_state <= read_state;
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <=s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <=s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= mm2s_cmd_mosi.tvalid;
                       mm2s_sts_miso.tready <= '0';
                       
                       read_img_loc <= read_img_loc;
                   end if;
                   
               when WAIT_RD_HDR_ACK =>
                   if(mm2s_cmd_miso.tready = '1') then --Mode Gige standard and image available
                       read_state <= WAIT_RD_IMG_ACK;
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <= resize(std_logic_vector(rd_img_memory_offset), s_mm2s_saddr'length);
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <= resize(std_logic_vector(img_bytessize_u),s_s2mm_btt'length); -- Transfert of the hdr data 
                       mm2s_cmd_mosi.tvalid <= '1';
                       mm2s_sts_miso.tready <= '0';
                       
                       read_img_loc <= read_img_loc;
                   else
                       read_state <= read_state;
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <=s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <=s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= mm2s_cmd_mosi.tvalid;
                       mm2s_sts_miso.tready <= '0';
                       
                       read_img_loc <= read_img_loc;
                   end if;
                   
               when WAIT_RD_IMG_ACK =>
                   if(mm2s_cmd_miso.tready = '1') then --Mode Gige standard and image available
                       read_state <= WAIT_RD_HDR_STS_ACK;
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <= s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <= s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= '0';
                       mm2s_sts_miso.tready <= '1';
                       
                       read_img_loc <= read_img_loc;
                   else
                       read_state <= read_state;
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <=s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <=s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= mm2s_cmd_mosi.tvalid;
                       
                       read_img_loc <= read_img_loc;
                   end if;
                   
               when WAIT_RD_HDR_STS_ACK =>
                   if(mm2s_sts_mosi.tvalid = '1') then --Mode Gige standard and image available
                       read_state <= WAIT_RD_IMG_STS_ACK;
                       -- Check for error
                        if(mm2s_sts_mosi.tdata(6 downto 4) /= "000") then
                            mm2s_err_o(3 downto 1) <=  mm2s_sts_mosi.tdata(6 downto 4);
                        else
                            mm2s_err_o <=  mm2s_err_o;
                        end if;
                        
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <= s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <= s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= '0';
                       mm2s_sts_miso.tready <= '0';
                       
                       read_img_loc <= read_img_loc;
                       
                   else
                       read_state <= read_state;
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <=s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <=s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= mm2s_cmd_mosi.tvalid;
                       
                       read_img_loc <= read_img_loc;
                   end if;
                   
                when WAIT_RD_IMG_STS_ACK =>
                   if(mm2s_sts_mosi.tvalid = '1') then --Mode Gige standard and image available
                      if rd_delay_cnt >= rd_min_frame_time_hold or next_read_state = RD_SEQ_END then
                         read_state <= next_read_state;
                         rd_delay_cnt <= (others => '0');
                         rd_min_frame_time_hold <= RD_MIN_FRAME_TIME;
                         mm2s_sts_miso.tready <= '1';
                      else
                         read_state <= read_state;
                         mm2s_sts_miso.tready <= '0';
                      end if;
                       
                        -- Check for error
                        if(mm2s_sts_mosi.tdata(6 downto 4) /= "000") then
                            mm2s_err_o(3 downto 1) <=  mm2s_sts_mosi.tdata(6 downto 4);
                        else
                            mm2s_err_o <=  mm2s_err_o;
                        end if;
                        
                        -- react on an stop acquisition command before the download was complete
                        if ACQUISITION_STOP = '1' then
                           read_state <= RD_SEQ_END;
                           mm2s_sts_miso.tready <= '1';
                        end if;
                        
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <= s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <= s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= '0';
                       
                       read_img_loc <= read_img_loc;
                   else
                       read_state <= read_state;
                       
                       --signal/output to assigned during the process
                       s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                       s_mm2s_saddr <=s_mm2s_saddr;
                       s_mm2s_eof <=s_mm2s_eof; 
                       s_mm2s_btt <=s_mm2s_btt;
                       mm2s_cmd_mosi.tvalid <= mm2s_cmd_mosi.tvalid;
                       
                       read_img_loc <= read_img_loc;
                   end if;
                   
                when RD_SEQ_END =>
                   read_state <= read_state;
                   --signal/output to assigned during the process
                   s_mm2s_cmd_tag <= s_mm2s_cmd_tag;
                   s_mm2s_saddr <=s_mm2s_saddr;
                   s_mm2s_eof <=s_mm2s_eof; 
                   s_mm2s_btt <=s_mm2s_btt;
                   mm2s_cmd_mosi.tvalid <= '0';
                   
                   read_img_loc <= read_start_id_u;
                   READ_COMPLETED <= '1';

               when ERROR_RD =>
                   read_state <= STANDBY_RD;
                   read_img_loc <= read_start_id_u;
               when others =>
           end case;
        end if;
    end if;
  
end process img_read;

img_write_status : process(CLK_DATA)
begin
    if rising_edge(CLK_DATA) then
         if sreset = '1' then
            s2mm_err_o <= (others => '0');
            s2mm_sts_miso.tready <= '1';
         else
            if( s2mm_sts_mosi.tvalid = '1') then

                if(s2mm_sts_mosi.tdata(6 downto 4) /= "000") then
                    s2mm_err_o(3 downto 1) <= s2mm_sts_mosi.tdata(6 downto 4);
                end if;
            else
                s2mm_err_o <= s2mm_err_o;
            end if;
         end if;
    end if;
end process img_write_status;



end rtl;
