library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM1 is
port(
	  address: in std_logic_vector(3 downto 0);
	  output : out std_logic_vector(31 downto 0)
);
end ROM1;

architecture arc_ROM1 of ROM1 is
begin

--         HEX7      HEX6     HEX5     HEX4     HEX3     HEX2     HEX1     HEX0               round

output <= "1111" & "1101" & "1111" & "1111" & "1111" & "0111" & "1010" & "1110" when address = "0000" else
--des      D      des      des      des      7      A      E

"1111" & "1011" & "1111" & "0101" & "1111" & "1111" & "0110" & "0010" when address = "0001" else
--des      B      des      5      des      des      6      2

"1111" & "0111" & "1111" & "0001" & "0010" & "1011" & "1111" & "1111" when address = "0010" else
--des      7      des      1      2      B      des      des

"1111" & "1111" & "1011" & "0011" & "1110" & "1111" & "1111" & "1101" when address = "0011" else
--des      des      B      3      E      des      des      D

"0011" & "0101" & "0001" & "0010" & "1111" & "1111" & "1111" & "1111" when address = "0100" else
--3      5      1      2      des      des      des      des

"1111" & "1111" & "0101" & "1000" & "1111" & "1100" & "0111" & "1111" when address = "0101" else
--des      des      5      8      des      C      7      des

"1111" & "1001" & "1111" & "0000" & "1111" & "1111" & "0100" & "1011" when address = "0110" else
--des      9      des      0      des      des      4      B

"1101" & "1010" & "0011" & "1111" & "1111" & "1011" & "1111" & "1111" when address = "0111" else
--D      A      3      des      des      B      des      des

"1111" & "1011" & "1100" & "1101" & "1111" & "1000" & "1111" & "1111" when address = "1000" else
--des      B      C      D      des      8      des      des

"0101" & "1101" & "1111" & "1111" & "1111" & "0110" & "1111" & "1000" when address = "1001" else
--5      D      des      des      des      6      des      8

"1111" & "1111" & "1111" & "1100" & "1111" & "1010" & "1101" & "0010" when address = "1010" else
--des      des      des      C      des      A      D      2

"1001" & "1111" & "0001" & "0101" & "1111" & "1111" & "1111" & "1100" when address = "1011" else
--9      des      1      5      des      des      des      C

"1010" & "1111" & "1111" & "1110" & "0000" & "1101" & "1111" & "1111" when address = "1100" else
--A      des      des      E      0      D      des      des

"1010" & "1111" & "1111" & "1111" & "0110" & "0111" & "0011" & "1111" when address = "1101" else
--A      des      des      des      6      7      3      des

"1000" & "1111" & "1111" & "1011" & "0011" & "1111" & "0000" & "1111" when address = "1110" else
--8      des      des      B      3      des      0      des

"1100" & "0111" & "1111" & "1111" & "1111" & "0101" & "1111" & "1000";
--C      7      des      des      des      5      des      8
			 
end arc_ROM1;