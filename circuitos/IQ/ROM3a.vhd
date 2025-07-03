library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM3a is
port(
	  address: in std_logic_vector(3 downto 0);
	  output : out std_logic_vector(14 downto 0)
);
end ROM3a;

architecture arc_ROM3a of ROM3a is
begin

--         switches 0 a 14
--         EDCBA9876543210                 round
output <= "001100101001001" when address = "0000" else
"010010000100111" when address = "0001" else
"110001011000010" when address = "0010" else
"100011000100101" when address = "0011" else
"101100101010000" when address = "0100" else
"010011000010110" when address = "0101" else
"010111011000000" when address = "0110" else
"001100000001111" when address = "0111" else
"010111001000001" when address = "1000" else
"010010010011001" when address = "1001" else
"110010011000001" when address = "1010" else
"010000011101001" when address = "1011" else
"100000101111000" when address = "1100" else
"100100011000011" when address = "1101" else
"001011000100011" when address = "1110" else
"001010001100110";
			 
end arc_ROM3a;