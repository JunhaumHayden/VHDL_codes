library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity COMP_erro is
port(
	E0, E1: in std_logic_vector(14 downto 0);
	diferente: out std_logic
);
end COMP_erro;
architecture circuito of COMP_erro is
begin
diferente <= '0' when E0 = E1 else '1';
end circuito;