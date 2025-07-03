library ieee;
use ieee.std_logic_1164.all;
 
entity controle is port (
clock, end_FPGA, end_game, end_time, end_round, enter, reset: in std_logic;
R1,R2,E1,E2,E3,E4,E5: out std_logic);
end controle;

architecture bhv of controle is
    type STATES is (Init, Setup, Play_fpga, Play_user, Count_round, Check, Waiting, Result);
    signal EA, PE: STATES;
begin
    R2 <= reset;
    R1 <= enter;
    
    P1: process(clock)
    begin
    if (clock'event AND clock = '1') then
            EA <= PE;
        end if;
    end process;
    
    P2: process(EA, end_FPGA, end_game, end_time, end_round, enter, reset)
    begin
        case EA is
        when Init => E1 <= '0'; E2 <= '0'; E3 <= '0'; E4 <= '0'; E5 <= '0';
             PE <= Setup;
        when Setup => E1 <= '1'; E2 <= '0'; E3 <= '0'; E4 <= '0'; E5 <= '0';
            if reset = '1' then
            PE <= Init;
            elsif enter = '1' then
            PE <= Play_FPGA;
            end if;
        when Play_FPGA => E1 <= '0'; E2 <= '1'; E3 <= '0'; E4 <= '0'; E5 <= '0';
        
            if reset = '1' then
            PE <= Init;
            elsif end_FPGA = '1' then
            PE <= Play_user;
            end if;
        when Play_user => E1 <= '0'; E2 <= '0'; E3 <= '1'; E4 <= '0'; E5 <= '0';
            if reset = '1' then
            PE <= Init;
            elsif end_time = '1' then
            PE <= Result;
            elsif enter = '1' then
            PE <= Count_round;
            end if;
        when Count_round => E1 <= '0'; E2 <= '0'; E3 <= '0'; E4 <= '1'; E5 <= '0';
            if reset = '1' then
            PE <= Init;
            else
            PE <= Check;
            end if;
        when Check => E1 <= '0'; E2 <= '0'; E3 <= '0'; E4 <= '0'; E5 <= '0';
            if reset = '1' then
            PE <= Init;
            elsif end_game = '1' or end_round = '1' then
            PE <= Result;
            else
            PE <= Waiting;
            end if;
        when Waiting => E1 <= '0'; E2 <= '0'; E3 <= '0'; E4 <= '0'; E5 <= '0';
        
            if reset = '1' then
            PE <= Init;
            else
            PE <= Play_FPGA;
            end if;
        when Result => E1 <= '0'; E2 <= '0'; E3 <= '0'; E4 <= '0'; E5 <= '1';
            if reset = '1' or enter = '1' then
            PE <= Init;
            end if;
            -- ....
            -- ....
        end case;
    end process;
end bhv;