library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all; -- necessário para o +
entity subtracao is
port(
	E0: in std_logic_vector(3 downto 0);
	E1: in std_logic;
	resultado: out std_logic_vector(3 downto 0)
);
end subtracao;
architecture circuito of subtracao is
begin
resultado <= E0 - ("000"&E1);
end circuito;