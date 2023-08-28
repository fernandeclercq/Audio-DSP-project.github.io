library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity main is
    port (
    clk_100mhz : in std_logic;
    
    sw_mode: in std_logic_vector(2 downto 0);
	
    i2s_mclk_adc : out std_logic;
    i2s_bclk_adc : out std_logic;
    i2s_lr_adc : out std_logic;
    i2s_din : in std_logic;
	
    i2s_mclk_dac : out std_logic;
    i2s_bclk_dac : out std_logic;
    i2s_lr_dac : out std_logic;
	i2s_dout : out std_logic
    );

    

end main;

architecture Behavioral of main is

signal pllsreset: std_logic := '0';
signal clk_25mhz: std_logic;


component clk_pll is
port(
      clk_out: out std_logic;
      reset: in std_logic;
      locked: out std_logic;
      clk_in: in std_logic
    );
end component;


component audiosystem is 
port(
    clk  : in std_logic;    
	audio_mode: in std_logic_vector(2 downto 0);
	
    i2s_mclk_adc : out std_logic;
    i2s_bclk_adc : out std_logic;
    i2s_lr_adc : out std_logic;
    i2s_din : in std_logic;
	
    i2s_mclk_dac : out std_logic;
    i2s_bclk_dac : out std_logic;
    i2s_lr_dac : out std_logic;
	i2s_dout : out std_logic
        
  
    );
end component;

begin

-- generatore low-to-high transition for PLL reset input
process (clk_100mhz)
begin
	if (rising_edge(clk_100mhz)) then
		pllsreset <= '1';
	end if;
end process;


pll: clk_pll
port map(
    clk_out => clk_25mhz,
    reset => '0',
    locked => open,
    clk_in => clk_100mhz
   );


audiomodule : audiosystem
port map (
    clk => clk_25mhz,
    audio_mode => sw_mode,
    i2s_mclk_adc => i2s_mclk_adc,
    i2s_bclk_adc => i2s_bclk_adc,
    i2s_lr_adc => i2s_lr_adc,
    i2s_din => i2s_din,    
    i2s_mclk_dac => i2s_mclk_dac,
    i2s_bclk_dac => i2s_bclk_dac,
    i2s_lr_dac => i2s_lr_dac,
    i2s_dout => i2s_dout   
    );
    

end Behavioral;
