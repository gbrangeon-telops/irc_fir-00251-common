library ieee;
use ieee.std_logic_1164.all;

entity blk_mem_gen_w32_d8192_wrapper is
  port (
    clka             : in  std_logic;   -- Sys clock
    rsta             : in  std_logic;   -- sys reset
    ena              : in std_logic;
    wea              : in std_logic_vector(3 downto 0);
    addra            : in std_logic_vector(12 downto 0);
    dina             : in std_logic_vector(31 downto 0);
    douta            : out std_logic_vector(31 downto 0);
    clkb             : in std_logic;
    rstb             : in std_logic;
    enb              : in std_logic;
    web              : in std_logic_vector(3 downto 0);
    addrb            : in std_logic_vector(12 downto 0);
    dinb             : in std_logic_vector(31 downto 0);
    doutb            : out std_logic_vector(31 downto 0)
);
end blk_mem_gen_w32_d8192_wrapper;

architecture implementation of blk_mem_gen_w32_d8192_wrapper is

component ip_blk_mem_gen_w32_d8192
  port (
    clka : in std_logic;
    rsta : in std_logic;
    ena : in std_logic;
    wea : in std_logic_vector(3 downto 0);
    addra : in std_logic_vector(12 downto 0);
    dina : in std_logic_vector(31 downto 0);
    douta : out std_logic_vector(31 downto 0);
    clkb : in std_logic;
    rstb : in std_logic;
    enb : in std_logic;
    web : in std_logic_vector(3 downto 0);
    addrb : in std_logic_vector(12 downto 0);
    dinb : in std_logic_vector(31 downto 0);
    doutb : out std_logic_vector(31 downto 0)
  );
end component;
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF ip_blk_mem_gen_w32_d8192 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF ip_blk_mem_gen_w32_d8192 : COMPONENT IS "clka,rsta,ena,wea[3:0],addra[12:0],dina[31:0],douta[31:0],clkb,rstb,enb,web[3:0],addrb[12:0],dinb[31:0],doutb[31:0]";

begin

inst_blk_mem_gen_w32_d8192 : ip_blk_mem_gen_w32_d8192
  port map (
    clka => clka,
    rsta => rsta,
    ena => ena,
    wea => wea,
    addra => addra,
    dina => dina,
    douta => douta,
    clkb => clkb,
    rstb => rstb,
    enb => enb,
    web => web,
    addrb => addrb,
    dinb => dinb,
    doutb => doutb
  );

end implementation;

