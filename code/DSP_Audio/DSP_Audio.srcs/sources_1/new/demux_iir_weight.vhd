library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_iir_weight is
    Port ( addr : in STD_LOGIC_VECTOR (2 downto 0);
           out_a0 : out integer;
           out_a1 : out integer;
           out_a2 : out integer;
           out_b1 : out integer;
           out_b2 : out integer
          );
end demux_iir_weight;



architecture Behavioral of demux_iir_weight is

-- Low-pass weights
constant lp_a0: integer := 1098671;
constant lp_a1: integer := 2197342;
constant lp_a2: integer := 1098671;
constant lp_b1: integer := -2048163407;
constant lp_b2: integer := 978816267;

-- High-pass weights
constant hp_a0: integer := 1025180375;
constant hp_a1: integer := -2050360749;
constant hp_a2: integer := 1025180375;
constant hp_b1: integer := -2048163407;
constant hp_b2: integer := 978816267;

begin


p1: process (addr) begin

case(addr) is
    when "000" => -- no filters
        out_a0 <= 1073741824;
        out_a1 <= 1073741824;
        out_a2 <= 1073741824;
        out_b1 <= 1073741824;
        out_b2 <= 1073741824;
        
     when "001" => -- Low pass
        out_a0 <= lp_a0;
        out_a1 <= lp_a1;
        out_a2 <= lp_a2;
        out_b1 <= lp_b1;
        out_b2 <= lp_b2;
     
     when "010" => -- High pass
        out_a0 <= hp_a0;
        out_a1 <= hp_a1;
        out_a2 <= hp_a2;
        out_b1 <= hp_b1;
        out_b2 <= hp_b2;
     
     when "011" => -- no filters
        out_a0 <= 1073741824;
        out_a1 <= 1073741824;
        out_a2 <= 1073741824;
        out_b1 <= 1073741824;
        out_b2 <= 1073741824;
        
     when others =>
        out_a0 <= 1073741824;
        out_a1 <= 1073741824;
        out_a2 <= 1073741824;
        out_b1 <= 1073741824;
        out_b2 <= 1073741824;
     
end case;

end process;



end Behavioral;
