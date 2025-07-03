library IEEE;
use IEEE.Std_Logic_1164.all;

entity Example is
    port (
    
        -- Saídas de dados
    	hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7: out std_logic_vector(6 downto 0);
    	ledr: out std_logic_vector(15 downto 0);
    	-- Entradas de controle
    	R1, R2, E1, E2, E3, E4, E5: in std_logic;
        A: in std_logic;
        B: in std_logic;
        Result: out std_logic
    );
end Example;

architecture Behavioral of Example is

 --dec termometrico
    signal stermoround, stermobonus, andtermo: std_logic_vector(15 downto 0);
    
    signal smuxhex0, aba: std_logic_vector(6 downto 0);
    
    --FSM_clock
    signal E2orE3: std_logic;
    
     --NOR enables displays
    signal E23, E25, E12: std_logic;
   

begin


hex0 <= aba;
--aba <= (smuxhex0 or smuxhex0);

aba <= std_logic_vector(unsigned(E12) or unsigned(smuxhex0));


--andtermo <= (stermoround) and (not E1);

		--NOR enables displays
E12 <= not (E1 or E2);
E23 <= not (E2 or E3);
E25 <= not (E2 or E5);
		--OR enables clock
E2orE3 <= (E2 or E3);


    Result <= A or B;  -- Declaração da operação OR
end Behavioral;
