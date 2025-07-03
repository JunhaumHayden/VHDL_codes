library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM1a is
port(
	  address: in std_logic_vector(3 downto 0);
	  output : out std_logic_vector(14 downto 0)
);
end ROM1a;

architecture arc_ROM1a of ROM1a is
begin

--         switches 0 a 14
--         EDCBA9876543210                 round
output <= "110010010000000" when address = "0000" else
"000100001100100" when address = "0001" else
"000100010000110" when address = "0010" else
"110100000001000" when address = "0011" else
"000000000101110" when address = "0100" else
"001000110100000" when address = "0101" else
"000101000010001" when address = "0110" else
"010110000001000" when address = "0111" else
"011100100000000" when address = "1000" else
"010000101100000" when address = "1001" else
"011010000000100" when address = "1010" else
"001001000100010" when address = "1011" else
"110010000000001" when address = "1100" else
"000010011001000" when address = "1101" else
"000100100001001" when address = "1110" else
"001000110100000";
			 
end arc_ROM1a;