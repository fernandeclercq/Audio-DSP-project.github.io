----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.08.2023 16:12:23
-- Design Name: 
-- Module Name: echo_module - Behavioral
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
use ieee.numeric_std.all;

entity audio_echo_fixed_point is
    Port ( audio_input   : in  signed(31 downto 0);
           echo_output   : out signed(31 downto 0);
           in_sample_valid : in STD_LOGIC;
           clk           : in  STD_LOGIC;
           rst           : in  STD_LOGIC);
end audio_echo_fixed_point;

--component blk_mem_gen_0 IS
--  PORT (
--    clka : IN STD_LOGIC;
--    rsta : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--    rsta_busy : OUT STD_LOGIC
--  );
--end component;

-- delay_matrix_block : blk_mem_gen_0 port map(

-- );

architecture Behavioral of audio_echo_fixed_point is

    -- delay of 0.1s (multiplied by 2^30) 
    constant delay_in_secs : integer := 32212254;
    -- Sample rate of audio = 96kHz
    constant audio_sample_rate : integer := 96000;
    
    
    constant delay_in_samples : integer := 1024;

    -- delay of 0.5s (2^30)
    constant delay_wet_mix : integer := delay_in_secs;
    -- delay of 0.5s (2^30)
    constant delay_dry_mix : integer := delay_in_secs;
    -- feedback delay of 0.3s (2^30)
    constant delay_feedback : integer := delay_in_secs;

    type delay_line_type is array(0 to delay_in_samples) of STD_LOGIC_VECTOR(31 downto 0);
    signal delay_line : delay_line_type := (others => (others => '0'));

    signal delay_line_index : integer range 0 to delay_in_samples := 0;

    signal state : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');

    signal temp_sample_dry : signed (39 downto 0) := (others => '0');
    signal temp_sample_wet : signed (39 downto 0) := (others => '0');
    signal last_sample : signed (31 downto 0) := (others => '0');

    signal mult_in_a, mult_in_b : signed (31 downto 0) := (others=>'0');
    signal mult_out : signed (63 downto 0):= (others=>'0');

begin
    process (clk)
        
    begin
        if rising_edge(clk) then
            if rst = '1' then
                delay_line <= (others => (others => '0'));
                delay_line_index <= 0;
                state <= "000";
            else

                --if rising_edge(clk) then

                    case (state) is
                        when "000" =>
                            if in_sample_valid = '1' then
                                mult_in_a <= audio_input;
                                mult_in_b <= to_signed(delay_dry_mix, 32);
                                last_sample <= signed(delay_line(delay_line_index));
                                state <= "001";
                            end if;
                        
                        when "001" =>
                            temp_sample_dry <= resize(shift_right(mult_out, 30), 40);
                            mult_in_a <= signed(delay_line(delay_line_index));
                            mult_in_b <= to_signed(delay_wet_mix, 32);
                            state <= "010";
                        
                        when "010" =>
                            temp_sample_wet <= resize(shift_right(mult_out, 30), 40);
                            echo_output <= resize((temp_sample_dry + temp_sample_wet), 32);
                            state <= "011";
                        
                        when "011" =>
                            mult_in_a <= to_signed(delay_feedback, 32);
                            mult_in_b <= resize((last_sample + audio_input), 32);
                            state <= "100";

                        when "100" =>
                            delay_line(delay_line_index) <= std_logic_vector(resize(shift_right(mult_out, 30), 32));
                            state <= "101";
                        
                        when "101" =>
                            delay_line_index <= delay_line_index + 1;

                            if delay_line_index >= delay_in_samples then
                                delay_line_index <= 0;
                            end if;
                            
                            state <= "000";
                        
                        when others =>

                        
                    end case;

                --end if;
                
            end if;
        end if;
    end process;

    -- multiplier
    process(mult_in_a, mult_in_b)
        begin
            mult_out <= mult_in_a * mult_in_b;
    end process;
    
end Behavioral;