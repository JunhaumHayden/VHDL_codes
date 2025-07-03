library ieee;
use ieee.std_logic_1164.all;
entity registrador is port (
CLK, RST, ENB: in std_logic;
D: in std_logic_vector(3 downto 0);
Q: out std_logic_vector(3 downto 0)
);
end registrador;
architecture behv of registrador is
begin
process(CLK, D, ENB, RST)
begin
if RST = '0' then
Q <= "0000";
elsif (CLK'event and CLK = '1' and ENB = '0') then
Q <= D;
end if;
end process;
end behv;