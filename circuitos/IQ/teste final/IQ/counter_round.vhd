library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity counter_round is
port(
	R, E, clock: in std_logic;
	Q: out std_logic_vector(3 downto 0);
	tc: out std_logic
);
end counter_round;
architecture behv of counter_round is
signal Q_aux: std_logic_vector(3 downto 0);
begin
process(R, E, clock)
begin
if R = '1' then
Q_aux <= "0000";
tc <= '0';
elsif (clock'event and clock = '1' and E = '1') then
Q_aux <= Q_aux + '1';
tc <= '0';
end if;
if Q_aux = "1110" then tc <= '1';
end if;
Q <= Q_aux;
end process;
end behv;