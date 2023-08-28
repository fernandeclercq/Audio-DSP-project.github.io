----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.08.2023 09:43:31
-- Design Name: 
-- Module Name: mux_data - Behavioral
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

entity mux_data is
    Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           din : in signed (31 downto 0);
           out_1 : out signed (31 downto 0);
           out_2 : out signed (31 downto 0);
           out_3 : out signed (31 downto 0);
           out_4 : out signed (31 downto 0));
end mux_data;

architecture Behavioral of mux_data is

begin

    process(din, sel)
    begin
        case sel is
            when "000" =>
                out_1 <= din;
                out_2 <= (others => '0');
                out_3 <= (others => '0');
                out_4 <= (others => '0');
                
            when "001" =>
                out_1 <= (others => '0');
                out_2 <= din;
                out_3 <= (others => '0');
                out_4 <= (others => '0');
                
            when "010" =>
                out_1 <= (others => '0');
                out_2 <= (others => '0');
                out_3 <= din;
                out_4 <= (others => '0');
            
            when "011" =>
                out_1 <= (others => '0');
                out_2 <= (others => '0');
                out_3 <= (others => '0');
                out_4 <= din;
                
            when others =>
                out_1 <= (others => '0');
                out_2 <= (others => '0');
                out_3 <= (others => '0');
                out_4 <= (others => '0');
                
                
                
        end case;
    end process;                
end Behavioral;
