library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all; -- necessário para ooperadores +
entity Sum is
port (
    A: in std_logic_vector(3 downto 0);
    B: in std_logic_vector(3 downto 0);
    soma: out std_logic_vector(3 downto 0)
 );
end Sum;
architecture circuito of Sum is
begin 
  soma <= A + B;
end circuito;