library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM2 is
port(
	  address: in std_logic_vector(3 downto 0);
	  output : out std_logic_vector(31 downto 0)
);
end ROM2;

architecture arc_ROM2 of ROM2 is
begin

--         HEX7      HEX6     HEX5     HEX4     HEX3     HEX2     HEX1     HEX0               round

output <= "1110" & "1111" & "1111" & "1000" & "0101" & "1101" & "0001" & "1111" when address = "0000" else
--E      des      des      8      5      D      1      des

"1111" & "1011" & "0010" & "1000" & "1110" & "1111" & "0100" & "1111" when address = "0001" else
--des      B      2      8      E      des      4      des

"1110" & "1011" & "1111" & "0111" & "0011" & "1111" & "1000" & "1111" when address = "0010" else
--E      B      des      7      3      des      8      des

"1111" & "1000" & "1101" & "1111" & "0000" & "1111" & "0100" & "0001" when address = "0011" else
--des      8      D      des      0      des      4      1

"1111" & "0011" & "0100" & "1111" & "1100" & "0101" & "1111" & "0010" when address = "0100" else
--des      3      4      des      C      5      des      2

"1001" & "0100" & "0010" & "1111" & "1111" & "1011" & "1111" & "0000" when address = "0101" else
--9      4      2      des      des      B      des      0

"1111" & "1111" & "0100" & "1111" & "1000" & "0001" & "0000" & "1110" when address = "0110" else
--des      des      4      des      8      1      0      E

"0000" & "1111" & "0011" & "1111" & "0110" & "0100" & "1111" & "1101" when address = "0111" else
--0      des      3      des      6      4      des      D

"1100" & "1111" & "1111" & "1111" & "1000" & "0101" & "1110" & "0111" when address = "1000" else
--C      des      des      des      8      5      E      7

"1111" & "1100" & "1111" & "1101" & "1001" & "1110" & "1010" & "1111" when address = "1001" else
--des      C      des      D      9      E      A      des

"0111" & "1111" & "0001" & "1110" & "1011" & "1111" & "1111" & "1100" when address = "1010" else
--7      des      1      E      B      des      des      C

"1010" & "1111" & "0000" & "1111" & "1111" & "0100" & "1101" & "0010" when address = "1011" else
--A      des      0      des      des      4      D      2

"1111" & "1001" & "1111" & "0000" & "1111" & "0101" & "0111" & "0100" when address = "1100" else
--des      9      des      0      des      5      7      4

"0111" & "0000" & "0011" & "1111" & "1101" & "1111" & "1100" & "1111" when address = "1101" else
--7      0      3      des      D      des      C      des

"1111" & "0001" & "1101" & "1010" & "1111" & "1000" & "1111" & "0111" when address = "1110" else
--des      1      D      A      des      8      des      7

"1111" & "0101" & "1101" & "0110" & "0001" & "1111" & "1111" & "0100";
--des      5      D      6      1      des      des      4
			 
end arc_ROM2;