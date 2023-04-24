-- Programa para ligar display de 7 segmentos
library IEEE;
use IEEE.Std_Logic_1164.all;


entity circuito3 is
port (
HEX5: out	std_logic_vector(6 downto 0);
HEX4: out	std_logic_vector(6 downto 0);
HEX3: out	std_logic_vector(6 downto 0);
HEX2: out	std_logic_vector(6 downto 0);
HEX1: out	std_logic_vector(6 downto 0);
HEX0: out	std_logic_vector(6 downto 0)
);
end circuito3;


architecture arc_circuito3 of circuito3 is
begin

-- Mostra a letra t no display HEX0
HEX5(6) <='0';		--ligado
HEX5(5) <='0';		--ligado
HEX5(4) <='0';		--ligado
HEX5(3) <='0';		--ligado
HEX5(2) <='1';		--desligado
HEX5(1) <='1';		--desligado
HEX5(0) <='1';		--desligado

-- Completar para os outros displays HEX4, HEX3 ... HEX0

end arc_circuito3;