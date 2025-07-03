library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity counter_time is
port(
	R, E, clock: in std_logic;
	Q: out std_logic_vector(3 downto 0);
	tc: out std_logic
);
end counter_time;
architecture behv of counter_time is
signal Q_aux: std_logic_vector(3 downto 0);
begin
process(R, E, clock)
begin
if R = '0' then
Q_aux <= "1010";
elsif (clock'event and clock = '1' and E = '0') then
Q_aux <= Q_aux - 1;
end if;
end process;
tc <= '1' when Q_aux = "0000" else '0';
Q <= Q_aux;
end behv;