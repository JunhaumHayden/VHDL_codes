-- Programa para ligar LED 09 e 07 e manter o LED 08 desligado
library IEEE;
use IEEE.Std_Logic_1164.all;


entity circuito1 is
port (
LEDR: out std_logic_vector(9 downto 0)
);
end circuito1;


architecture arc_circuito1 of circuito1 is
begin

LEDR(9) <= '1';
LEDR(8) <= '0';
LEDR(7) <= '1';

end arc_circuito1;

