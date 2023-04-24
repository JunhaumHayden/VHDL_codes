-- Programa para escrever "--UFSC--" no displau de 7 segmentos
library IEEE;
use IEEE.Std_Logic_1164.all;



entity circuito5 is
    port (
    HEX7: out	std_logic_vector(6 downto 0);
    HEX6: out	std_logic_vector(6 downto 0);
    HEX5: out	std_logic_vector(6 downto 0);
    HEX4: out	std_logic_vector(6 downto 0);
    HEX3: out	std_logic_vector(6 downto 0);
    HEX2: out	std_logic_vector(6 downto 0);
    HEX1: out	std_logic_vector(6 downto 0);
    HEX0: out	std_logic_vector(6 downto 0)
    );
    end circuito5;
    
    
    architecture arc_circuito5 of circuito5 is
    begin
    
    -- Mostra a letra t no display HEX0
    HEX7(6) <='0';		--ligado display 07(-)
    HEX6 <="0111111";		--ligado display 06(-)
    HEX5 <="1000001";		--ligado display 05(u)
    HEX4 <="0001110";		--ligado display 04(f)
    HEX3 <="0010010";		--ligado display 03(s)
    HEX2 <="1000110";		--ligado display 02(c)
    HEX1 <="0111111";		--ligado display 01(-)
    HEX0 <="0111111";		--ligado display 00(-)
    
    -- Completar para os outros displays HEX4, HEX3 ... HEX0
    
    end arc_circuito5;