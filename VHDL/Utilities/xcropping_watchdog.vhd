------------------------------------------------------------------
--!   @file : xcropping_watchdog
--!   @brief
--!   @details
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library work;
use work.tel2000.all;

entity xcropping_watchdog is
   port(
      
      ARESET            : in std_logic;
      CLK               : in std_logic;
      
      RX_MOSI           : in t_axi4_stream_mosi64;
      RX_MISO           : in t_axi4_stream_miso;
      
      TX_MOSI           : in t_axi4_stream_mosi64;
      TX_MISO           : in t_axi4_stream_miso;
      
      AOI_FLI_POS       : in std_logic_vector(10 downto 0);
      AOI_LLI_POS       : in std_logic_vector(10 downto 0);
      M_AOI_EOL_POS     : in std_logic_vector(10 downto 0);
      M_AOI_SOL_POS     : in std_logic_vector(10 downto 0);
      M_FULL_WIDTH      : in std_logic_vector(10 downto 0);
      
      STATUS            : out xcropping_status_type
      
      
      );
end xcropping_watchdog;

architecture rtl of xcropping_watchdog is 
   
   constant PIPE_LEN    : integer := 5;
   
   component sync_reset
      port (
         ARESET   : in std_logic;
         CLK      : in std_logic;
         SRESET   : out std_logic := '1'
         );
   end component;    
   
   signal sreset                    : std_logic;   
   signal aoi_fli_pos_i             : unsigned(AOI_FLI_POS'LENGTH-1 downto 0);  
   signal aoi_lli_pos_i             : unsigned(AOI_LLI_POS'LENGTH-1 downto 0);  
   signal m_aoi_eol_pos_i           : unsigned(M_AOI_EOL_POS'LENGTH-1 downto 0);
   signal m_aoi_sol_pos_i           : unsigned(M_AOI_SOL_POS'LENGTH-1 downto 0);
   signal m_full_width_i            : unsigned(M_FULL_WIDTH'LENGTH-1 downto 0);
   signal output_frm_in_progress_i  : std_logic;
   signal input_frm_in_progress_i   : std_logic;
   signal cfg_change_err            : std_logic;
   signal input_dcnt_err            : std_logic; 
   signal output_dcnt_err           : std_logic;
   signal cfg_input_data_num        : unsigned(21 downto 0);
   signal cfg_output_data_num       : unsigned(21 downto 0);
   signal input_dcnt_i              : unsigned(21 downto 0); 
   signal output_dcnt_i             : unsigned(21 downto 0);
   signal input_column_num          : unsigned(M_AOI_SOL_POS'LENGTH-1 downto 0);
   signal output_column_num         : unsigned(M_AOI_EOL_POS'LENGTH-1 downto 0);
   signal line_num_m1               : unsigned(AOI_FLI_POS'LENGTH-1 downto 0);
   signal line_num                  : unsigned(AOI_FLI_POS'LENGTH-1 downto 0);
   signal input_tlast_pipe          : std_logic_vector(PIPE_LEN downto 0); 
   signal output_tlast_pipe         : std_logic_vector(PIPE_LEN downto 0); 
   signal output_column_num_m1      : unsigned(AOI_FLI_POS'LENGTH-1 downto 0);
   
begin  
   
   
   
   
   STATUS.INPUT_FRM_IN_PROGRESS  <= input_frm_in_progress_i;
   STATUS.OUTPUT_FRM_IN_PROGRESS <= output_frm_in_progress_i;
   STATUS.CFG_CHANGE_ERR         <= cfg_change_err;
   STATUS.INPUT_DCNT_ERR         <= input_dcnt_err;
   STATUS.OUTPUT_DCNT_ERR        <= output_dcnt_err;
   STATUS.CFG_INPUT_DATA_NUM     <= resize(cfg_input_data_num, STATUS.CFG_INPUT_DATA_NUM'LENGTH);
   STATUS.CFG_OUTPUT_DATA_NUM    <= resize(cfg_output_data_num, STATUS.CFG_OUTPUT_DATA_NUM'LENGTH);
   STATUS.INPUT_DCNT             <= resize(input_dcnt_i, STATUS.INPUT_DCNT'LENGTH);
   STATUS.OUTPUT_DCNT            <= resize(output_dcnt_i, STATUS.OUTPUT_DCNT'LENGTH);
   
   
   
   ------------------------------------------------------
   -- Sync reset
   ------------------------------------------------------
   U1 : sync_reset
   port map(
      ARESET => ARESET,
      CLK => CLK,
      SRESET => sreset
      );
   
   
   ------------------------------------------------------
   -- nombre de pixels dans le pipe
   ------------------------------------------------------
   U2 : process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then
            
            input_dcnt_i <= (others => '0');
            output_dcnt_i <= (others => '0');
            input_tlast_pipe <= (others => '0');
            output_tlast_pipe <= (others => '0');
            
         else  
            
            -- compteur de pixel entrants
            if RX_MOSI.TVALID = '1' and RX_MISO.TREADY = '1' then        -- pixel in                
               input_dcnt_i <= input_dcnt_i + 1;
            end if;             
            input_tlast_pipe(PIPE_LEN downto 0) <= input_tlast_pipe(PIPE_LEN-1 downto 0) & (RX_MOSI.TVALID and RX_MISO.TREADY and RX_MOSI.TLAST); 
            
            if input_tlast_pipe(PIPE_LEN) = '1' then 
               input_dcnt_i <= (others => '0');
            end if;
            
            
            -- compteur de pixel sortants
            if TX_MOSI.TVALID = '1' and TX_MISO.TREADY = '1' then        -- pixel out                
               output_dcnt_i <= output_dcnt_i + 1;
            end if;             
            output_tlast_pipe(PIPE_LEN downto 0) <= output_tlast_pipe(PIPE_LEN-1 downto 0) & (TX_MOSI.TVALID and TX_MISO.TREADY and TX_MOSI.TLAST); 
            
            if output_tlast_pipe(PIPE_LEN) = '1' then 
               output_dcnt_i <= (others => '0');
            end if;
            
         end if;
      end if;
      
   end process;    
   
   ------------------------------------------------------
   -- frame in progress
   ------------------------------------------------------
   U3 : process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then            
            input_frm_in_progress_i <= '0';
            output_frm_in_progress_i <= '0';
            
         else
            
            -- input frame in progress
            if RX_MISO.TREADY = '1' then
               if RX_MOSI.TVALID = '1' then                 
                  input_frm_in_progress_i <= '1';
                  if RX_MOSI.TLAST = '1' then 
                     input_frm_in_progress_i <= '0';
                  end if;                  
               end if;                  
            end if;            
            
            -- outut frame in progress
            if TX_MISO.TREADY = '1' then
               if TX_MOSI.TVALID = '1' then                   
                  output_frm_in_progress_i <= '1';
                  if TX_MOSI.TLAST = '1' then
                     output_frm_in_progress_i <= '0';
                  end if;                  
               end if;                  
            end if; 
            
            
         end if;
      end if;      
   end process;    
   
   ------------------------------------------------------
   -- changement de config illegale
   ------------------------------------------------------
   U4 : process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then            
            
            aoi_fli_pos_i       <= unsigned(AOI_FLI_POS);
            aoi_lli_pos_i       <= unsigned(AOI_LLI_POS);
            m_aoi_eol_pos_i     <= unsigned(M_AOI_EOL_POS);
            m_aoi_sol_pos_i     <= unsigned(M_AOI_SOL_POS);
            m_full_width_i      <= unsigned(M_FULL_WIDTH);
            
            cfg_change_err <= '0';
            
         else                            
            
            aoi_fli_pos_i       <= unsigned(AOI_FLI_POS);  
            aoi_lli_pos_i       <= unsigned(AOI_LLI_POS);  
            m_aoi_eol_pos_i     <= unsigned(M_AOI_EOL_POS);
            m_aoi_sol_pos_i     <= unsigned(M_AOI_SOL_POS);
            m_full_width_i      <= unsigned(M_FULL_WIDTH);            
            
            if aoi_fli_pos_i   /=  unsigned(AOI_FLI_POS) then
               cfg_change_err <= input_frm_in_progress_i or output_frm_in_progress_i;
            end if;            
            if aoi_lli_pos_i   /=  unsigned(AOI_LLI_POS) then
               cfg_change_err <= input_frm_in_progress_i or output_frm_in_progress_i;
            end if;
            if m_aoi_eol_pos_i /=  unsigned(M_AOI_EOL_POS) then
               cfg_change_err <= input_frm_in_progress_i or output_frm_in_progress_i;
            end if;
            if m_aoi_sol_pos_i /=  unsigned(M_AOI_SOL_POS) then
               cfg_change_err <= input_frm_in_progress_i or output_frm_in_progress_i;
            end if;
            if m_full_width_i  /=  unsigned(M_FULL_WIDTH) then
               cfg_change_err <= input_frm_in_progress_i or output_frm_in_progress_i;
            end if;     
            
         end if;
      end if;      
   end process;   
   
   ------------------------------------------------------
   -- incoherence nombre de pixels vs cfg
   ------------------------------------------------------
   U5 : process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            
            input_dcnt_err <= '0';
            output_dcnt_err <= '0';
            
         else            
            
            -- config
            line_num_m1 <= unsigned(AOI_LLI_POS) - unsigned(AOI_FLI_POS); 
            line_num    <= line_num_m1 + 1; 
            
            input_column_num <= unsigned(M_FULL_WIDTH);
            
            output_column_num_m1 <= unsigned(M_AOI_EOL_POS) - unsigned(M_AOI_SOL_POS);
            output_column_num    <= output_column_num_m1 + 1;          
            
            -- nombres de pixels entrants et sortants selon la config
            cfg_input_data_num <= line_num * input_column_num;
            cfg_output_data_num <= line_num * output_column_num;
            
            -- incoherences             
            if input_dcnt_i /= cfg_input_data_num then
               if input_tlast_pipe(PIPE_LEN-1) = '1' then
                  input_dcnt_err <= '1';
               end if;
            end if;                 
            if output_dcnt_i /= cfg_output_data_num then
               if output_tlast_pipe(PIPE_LEN-1) = '1' then 
                  output_dcnt_err <= '1';
               end if;
            end if;
            
         end if;
      end if;      
   end process; 
   
end rtl;
