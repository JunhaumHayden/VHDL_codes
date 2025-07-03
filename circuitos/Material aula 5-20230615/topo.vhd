library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all; -- necessário para o +
entity topo is
port(CLOCK_50:in std_logic;
CLK_500Hz:in std_logic;
KEY:in std_logic_vector(3 downto 0);
SW:in std_logic_vector(17 downto 0);
LEDR:out std_logic_vector(17 downto 0);
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0)
);
end topo;
architecture soma4 of topo is
signal F, F1, F2, F3, F4, H, D, Q: std_logic_vector(3 downto 0);
signal opA, opB: std_logic_vector(2 downto 0);
signal Control: std_logic_vector(1 downto 0);
signal G: std_logic_vector(6 downto 0); 
signal CLK, RST, ENB: std_logic;
component sum is
port (
A,B: in std_logic_vector(3 downto 0);
F: out std_logic_vector(3 downto 0));
end component;
component mux is
port (w, x, y, z: in std_logic_vector(3 downto 0);
sel: in std_logic_vector(1 downto 0);
H: out std_logic_vector(3 downto 0)
);
end component;
component decoder is
port (C: in std_logic_vector(3 downto 0);
G: out std_logic_vector(6 downto 0)
);
end component;

component registrador is
port (CLK, RST, ENB: in std_logic;
D: in std_logic_vector(3 downto 0);
Q: out std_logic_vector(3 downto 0)
);
end component;

begin
opA <= SW(2 downto 0);
opB <= SW(6 downto 4);
Control <= SW(9 downto 8);
F1 <= '0' & opA; --A
F2 <= opA & '0'; --2A
F3 <= '0' & opB; --B
F4 <= opB & '0'; --2B
MUX1: mux port map(F1,F2,F3,F4,Control,H);
SUM1: sum port map(F1,H,F);
reg: registrador port map(cloCK_50,key(0),key(1),F,Q);
DEC1: decoder port map(Q,G);
HEX0 <= G;
LEDR(3 downto 0) <= Q;
HEX1 <= "0110111";
DEC2: decoder port map('0' & opA, HEX2);
DEC3: decoder port map('0' & opB, HEX4);
HEX3 <= "1111111";
HEX5 <= "1111111";
end soma4;