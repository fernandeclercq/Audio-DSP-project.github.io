----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.08.2023 11:10:16
-- Design Name: 
-- Module Name: demux_i2s_data - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux_i2s_data is
    Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           filter_data_in_1 : in signed (23 downto 0);
           filter_data_in_2 : in signed (23 downto 0);
           filter_data_in_3 : in signed (23 downto 0);
           filter_data_in_4 : in signed (23 downto 0);
           i2s_data_out : out signed (23 downto 0));
end demux_i2s_data;

architecture Behavioral of demux_i2s_data is

begin
    process(sel)
    begin
        case sel is
            when "000" =>
                i2s_data_out <= filter_data_in_1;
                
            when "001" =>
                i2s_data_out <= filter_data_in_2;
                
            when "010" =>
                i2s_data_out <= filter_data_in_3;
            
            when "011" =>
                i2s_data_out <= filter_data_in_4;
                
            when others =>
                i2s_data_out <= (others => '0');
                                
        end case;
    end process;


end Behavioral;
