library ieee;
use ieee.std_logic_1164.all;
 
entity Controle is port (
clock,ctrl: in std_logic;
S1,S0: out std_logic);
end Controle;

architecture bhv of controle is
    type STATES is (E0,E1 -- declarar estados);
    signal EA, PE: STATES;
begin
    
    P1: process(clock)
    begin
    if (clock'event AND clock = '1') then
            EA <= PE;
        end if;
    end process;
    
    P2: process(EA,ctrl)
    begin
        case EA is
        when E0 => -- s1 <= ''; s0 <= '';
             if ctrl ='1' then
             PE <= --fazer;
             elsif ctrl='0' then
             PE <= --fazer;
             end if;
        when E1 => -- s1 <= ''; s0 <= '';
            -- ....
            -- ....
        end case;
    end process;
end bhv;