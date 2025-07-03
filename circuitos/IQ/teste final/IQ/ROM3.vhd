library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM3 is
port(
	  address: in std_logic_vector(3 downto 0);
	  output : out std_logic_vector(31 downto 0)
);
end ROM3;

architecture arc_ROM3 of ROM3 is
begin

--         HEX7      HEX6     HEX5     HEX4     HEX3     HEX2     HEX1     HEX0               round

output <= "0000" & "1111" & "1000" & "1100" & "0110" & "1011" & "0011" & "1111" when address = "0000" else
--0      des      8      C      6      B      3      des

"1101" & "0001" & "0101" & "0000" & "1010" & "0010" & "1111" & "1111" when address = "0001" else
--D      1      5      0      A      2      des      des

"1001" & "0001" & "0111" & "0110" & "1101" & "1111" & "1111" & "1110" when address = "0010" else
--9      1      7      6      D      des      des      E

"1110" & "1111" & "0101" & "0010" & "0000" & "1010" & "1111" & "1001" when address = "0011" else
--E      des      5      2      0      A      des      9

"1011" & "1111" & "1111" & "1000" & "1100" & "0100" & "1110" & "0110" when address = "0100" else
--B      des      des      8      C      4      E      6

"1010" & "1001" & "0100" & "1101" & "0001" & "0010" & "1111" & "1111" when address = "0101" else
--A      9      4      D      1      2      des      des

"0111" & "1011" & "0110" & "1001" & "1111" & "1010" & "1111" & "1101" when address = "0110" else
--7      B      6      9      des      A      des      D

"1011" & "1111" & "1100" & "0010" & "0001" & "1111" & "0011" & "0000" when address = "0111" else
--B      des      C      2      1      des      3      0

"0000" & "1001" & "1111" & "1111" & "0110" & "1011" & "1101" & "1010" when address = "1000" else
--0      9      des      des      6      B      D      A

"1010" & "0111" & "1111" & "1111" & "0011" & "1101" & "0100" & "0000" when address = "1001" else
--A      7      des      des      3      D      4      0

"1111" & "1010" & "0000" & "0110" & "1111" & "1110" & "1101" & "0111" when address = "1010" else
--des      A      0      6      des      E      D      7

"0110" & "1111" & "0011" & "0111" & "1101" & "0000" & "0101" & "1111" when address = "1011" else
--6      des      3      7      D      0      5      des

"0101" & "1000" & "1110" & "1111" & "1111" & "0110" & "0011" & "0100" when address = "1100" else
--5      8      E      des      des      6      3      4

"0110" & "0001" & "1111" & "0111" & "1111" & "1011" & "1110" & "0000" when address = "1101" else
--6      1      des      7      des      B      E      0

"1111" & "1010" & "1100" & "1111" & "1001" & "0000" & "0001" & "0101" when address = "1110" else
--des      A      C      des      9      0      1      5

"0001" & "1010" & "0010" & "1111" & "1100" & "0110" & "0101" & "1111";
--1      A      2      des      C      6      5      des
			 
end arc_ROM3;