-- Programa para acionar os segmentos dos displays
-- atraves das chaves
library IEEE;
use IEEE.Std_Logic_1164.all;


entity circuito4 is
port (
    -- Declara as chaves como entradas
SW: in 	std_logic_vector(9 downto 0);
   -- Declara os displays como saida
HEX5: out	std_logic_vector(6 downto 0);
HEX4: out	std_logic_vector(6 downto 0);
HEX3: out	std_logic_vector(6 downto 0);
HEX2: out	std_logic_vector(6 downto 0);
HEX1: out	std_logic_vector(6 downto 0);
HEX0: out	std_logic_vector(6 downto 0)
);
end circuito4;


architecture arc_circuito4 of circuito4 is
begin

-- Mostra como cada chave aciona um segmento do display
HEX5(6) <= sw(9);		
HEX5(5) <= sw(8);		
HEX5(4) <= sw(7);		
HEX5(3) <= sw(6);		
HEX5(2) <= sw(5);		
HEX5(1) <= sw(4);		
HEX5(0) <= sw(3);		



end arc_circuito4;