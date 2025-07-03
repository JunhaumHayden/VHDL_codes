library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM2a is
port(
	  address: in std_logic_vector(3 downto 0);
	  output : out std_logic_vector(14 downto 0)
);
end ROM2a;

architecture arc_ROM2a of ROM2a is
begin

--         switches 0 a 14
--         EDCBA9876543210                 round
output <= "110000100100010" when address = "0000" else
"100100100010100" when address = "0001" else
"100100110001000" when address = "0010" else
"010000100010011" when address = "0011" else
"001000000111100" when address = "0100" else
"000101000010101" when address = "0101" else
"100000100010011" when address = "0110" else
"010000001011001" when address = "0111" else
"101000110100000" when address = "1000" else
"111011000000000" when address = "1001" else
"101100010000010" when address = "1010" else
"010010000010101" when address = "1011" else
"000001010110001" when address = "1100" else
"011000010001001" when address = "1101" else
"010010110000010" when address = "1110" else
"010000001110010";
			 
end arc_ROM2a;