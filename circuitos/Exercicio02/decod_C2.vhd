library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod_C2 is
port (G: in std_logic_vector(3 downto 0);
F: out std_logic_vector(6 downto 0)
);
end decod_C2;

architecture circuito of decod_C2 is
begin
F <= 
"1000000" when G = "0000" else -- 0
"1111001" when G = "0001" else -- 1
"0100100" when G = "0010" else -- 2
"0110000" when G = "0011" else -- 3 
"0011001" when G = "0100" else -- 4
-- A fazer resto de combinações
"0011001" when G = "1100" else -- 4 (negativo)
"0110000" when G = "1101" else -- 3 (negativo)
"0100100" when G = "1110" else -- 2 (negativo)
"1111001"; --1 (negativo)
end circuito;