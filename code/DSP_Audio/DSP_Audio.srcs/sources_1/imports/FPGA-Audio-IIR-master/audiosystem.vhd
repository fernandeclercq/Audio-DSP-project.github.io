library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity audiosystem is
port (
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
end audiosystem;

architecture Behavioral of audiosystem is

component i2s_rxtx is
    port (
    clk : in std_logic;
    
    i2s_bclk : in std_logic;
    i2s_lr : in std_logic;
    i2s_din : in std_logic;
    i2s_dout : out std_logic;
    
    out_l : out signed (23 downto 0);
    out_r : out signed (23 downto 0);
    
    in_l : in signed (23 downto 0);
    in_r : in signed (23 downto 0);
    
    sync  : out std_logic
    );
end component;
 
component IIR is
port (
    clk  : in std_logic := '0';
    
    iir_in : in signed (31 downto 0) := (others=>'0');
    sample_valid_in  : in std_logic := '0';
    
    iir_out : out signed(31 downto 0) := (others=>'0');
    sample_valid_out : out std_logic := '0';
    
    busy : out std_logic := '0';

-- a0, a1, a2, b1, b2 must be multiplied with 2^30 before
	
    a0 : integer;
    a1 : integer;
    a2 : integer;
    b1 : integer;
    b2 : integer
    );
end component; 

component mux_data is
port ( sel : in STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
       din : in signed (31 downto 0) := (others => '0');
       out_1 : out signed (31 downto 0);
       out_2 : out signed (31 downto 0);
       out_3 : out signed (31 downto 0);
       out_4 : out signed (31 downto 0)
      );
end component;  

component demux_i2s_data is
Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           filter_data_in_1 : in signed (23 downto 0);
           filter_data_in_2 : in signed (23 downto 0);
           filter_data_in_3 : in signed (23 downto 0);
           filter_data_in_4 : in signed (23 downto 0);
           i2s_data_out : out signed (23 downto 0)

        );
 end component;
 
component audio_echo_fixed_point is
    Port ( audio_input   : in  signed(31 downto 0);
           echo_output   : out signed(31 downto 0);
           in_sample_valid : in STD_LOGIC;
           clk           : in  STD_LOGIC;
           rst           : in  STD_LOGIC);
end component;

--i2s data control signals
signal sync : std_logic:= '0';

--24 bit i2s i/o signals
signal i2s_l_in, i2s_r_in, i2s_l_out, i2s_r_out :signed (23 downto 0):= (others=>'0');

--32 bit IIR i/o signals
signal iir_l_in, iir_r_in, iir_l_out, iir_r_out : signed (31 downto 0):= (others=>'0');


signal raw_left, lp_left, hp_left, echo_left : signed (23 downto 0):= (others=>'0');
signal raw_right, lp_right, hp_right, echo_right : signed (23 downto 0):= (others=>'0');


signal out_raw_left, out_lp_left, out_hp_left, out_echo_left : signed (31 downto 0):= (others=>'0');
signal out_raw_right, out_lp_right, out_hp_right, out_echo_right : signed (31 downto 0):= (others=>'0');


signal in_lp_left, in_hp_left, in_echo_left : signed (31 downto 0):= (others=>'0');
signal in_lp_right, in_hp_right, in_echo_right : signed (31 downto 0):= (others=>'0');

--timers for i2s clk generation
signal mclk_state : std_logic := '1';
signal lr_counter : unsigned (7 downto 0):= (others=>'0');
signal bclk_counter : unsigned(1 downto 0):= (others=>'0');

begin

-- i2s clock generation
-- clk = 25 MHz
-- mclk = clk/2 = 12.5 MHz (ideally 12.288 MHz)
-- bclk = clk/4 = 6.25 MHz (ideally 6.144 MHz)
-- lr = clk/256 = 97.6 kHz (ideally 96 kHz)

i2s_mclk_adc <= mclk_state;
i2s_mclk_dac <= mclk_state;
i2s_bclk_adc <= bclk_counter(1);
i2s_bclk_dac <= bclk_counter(1);
i2s_lr_adc <= lr_counter(7); 
i2s_lr_dac <= lr_counter(7); 

process (clk)
begin
if (rising_edge(clk)) then

	mclk_state <= not mclk_state;
	lr_counter <= lr_counter+to_unsigned(1,8);
	bclk_counter <= bclk_counter+to_unsigned(1,2);          

end if;

end process;


iir_l_in <= resize(i2s_l_in, 32);
iir_r_in <= resize(i2s_r_in, 32);

left_data_mux: mux_data port map(
    sel => audio_mode,
    din => iir_l_in,
    out_1 => out_raw_left,
    out_2 => in_lp_left,
    out_3 => in_hp_left,
    out_4 => in_echo_left
);

right_data_mux: mux_data port map(
    sel => audio_mode,
    din => iir_r_in,
    out_1 => out_raw_right,
    out_2 => in_lp_right,
    out_3 => in_hp_right,
    out_4 => in_echo_right
);



--signal out_lp_left, out_hp_left : signed (31 downto 0):= (others=>'0');
--signal out_lp_right, out_hp_right : signed (31 downto 0):= (others=>'0');

--signal lp_left, hp_left : signed (23 downto 0):= (others=>'0');
--signal lp_right, hp_right : signed (23 downto 0):= (others=>'0');


--i2s transmitter / receiver

raw_left <= resize(out_raw_left, 24);
raw_right <= resize(out_raw_right, 24);

lp_left <= resize(out_lp_left, 24);
hp_left <= resize(out_hp_left, 24);

lp_right <= resize(out_lp_right, 24);
hp_right <= resize(out_hp_right, 24);

echo_left <= resize(out_echo_left, 24);
echo_right <= resize(out_echo_left, 24);


i2s_left_demux : demux_i2s_data port map(
    sel => audio_mode,
    filter_data_in_1 => raw_left,
    filter_data_in_2 => lp_left,
    filter_data_in_3 => hp_left,
    filter_data_in_4 => echo_left,
    i2s_data_out => i2s_l_out
);

i2s_right_demux : demux_i2s_data port map(
    sel => audio_mode,
    filter_data_in_1 => raw_right,
    filter_data_in_2 => lp_right,
    filter_data_in_3 => hp_right,
    filter_data_in_4 => echo_right,
    i2s_data_out => i2s_r_out
);

rxtx : i2s_rxtx
    port map (
        clk => clk,
        i2s_bclk => bclk_counter(1),
		i2s_lr => lr_counter(7),
        i2s_din => i2s_din,
        i2s_dout => i2s_dout,
        
        out_l => i2s_l_in,
        out_r => i2s_r_in,
        
        in_l => i2s_l_out,
        in_r => i2s_r_out,
        
        sync => sync
      );


-- iir-lowpass, fs=96kHz, f_cut=1kHz, q=0.7
iir_lp_left : IIR
	port map (
    clk => clk,
    
    iir_in => in_lp_left,
    sample_valid_in  => sync,
    
    iir_out => out_lp_left,
    sample_valid_out => open,
    
    busy => open,

	-- a0, a1, a2, b1, b2 must be multiplied with 2^30 before 
    a0 => 1098671,	
    a1 => 2197342,	
    a2 => 1098671,
    b1 => -2048163407,
    b2 => 978816267
    );
    
iir_lp_right : IIR
	port map (
    clk => clk,
    
    iir_in => in_lp_right,
    sample_valid_in  => sync,
    
    iir_out => out_lp_right,
    sample_valid_out => open,
    
    busy => open,

	-- a0, a1, a2, b1, b2 must be multiplied with 2^30 before 
    a0 => 1098671,	
    a1 => 2197342,	
    a2 => 1098671,
    b1 => -2048163407,
    b2 => 978816267
    );

-------------------------------------------------------------------------------------

--iir-highpass, fs=96kHz, f_cut=1kHz, q=0.7

-- High-pass weights
--constant hp_a0: integer := 1025180375;
--constant hp_a1: integer := -2050360749;
--constant hp_a2: integer := 1025180375;
--constant hp_b1: integer := -2048163407;
--constant hp_b2: integer := 978816267;

iir_hp_left : IIR
	port map (
    clk => clk,
    
    iir_in => in_hp_left,
    sample_valid_in  => sync,
    
    iir_out => out_hp_left,
    sample_valid_out => open,
    
    busy => open,

	-- a0, a1, a2, b1, b2 must be multiplied with 2^30 before   
	
	a0 => 1025180375,	
    a1 => -2050360749,	
    a2 => 1025180375,
    b1 => -2048163407,
    b2 => 978816267
    );
    
    
iir_hp_right : IIR
	port map (
    clk => clk,
    
    iir_in => in_hp_right,
    sample_valid_in  => sync,
    
    iir_out => out_hp_right,
    sample_valid_out => open,
    
    busy => open,
	-- a0, a1, a2, b1, b2 must be multiplied with 2^30 before
	a0 => 1025180375,	
    a1 => -2050360749,	
    a2 => 1025180375,
    b1 => -2048163407,
    b2 => 978816267
    );
    
    
 audio_echo_left : audio_echo_fixed_point port map(
    audio_input => in_echo_left,
    echo_output => out_echo_left,
    in_sample_valid => sync,
    clk         => clk,
    rst         => '0'
 );
 
  audio_echo_right : audio_echo_fixed_point port map(
    audio_input => in_echo_right,
    echo_output => out_echo_right,
    in_sample_valid => sync,
    clk         => clk,
    rst         => '0'
 );
   
    
    
end Behavioral;