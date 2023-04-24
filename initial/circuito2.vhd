-- Programa para ligar LEDs através das chaves
library IEEE;
use IEEE.Std_Logic_1164.all;


entity circuito2 is
port (
SW: 	in 	std_logic_vector(9 downto 0);
LEDR: out	std_logic_vector(9 downto 0)
);
end circuito2;


architecture arc_circuito2 of circuito2 is
begin

LEDR(9) <= SW(9);
LEDR(8) <= SW(8);
LEDR(7) <= SW(7);

end arc_circuito2;