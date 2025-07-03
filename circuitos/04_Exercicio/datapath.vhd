library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath is 
    port (
        I: in std_logic_vector(3 downto 0);
        sw4,sw5: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        Q_out: out std_logic_vector(3 downto 0);
        clock, reset: in std_logic
    );
end Datapath;
        
architecture arqdtp of Datapath is

    -- Signals declare the internal signals
    signal Smux, Q_reg, F1, F2, F3, F4: std_logic_vector(3 downto 0);
    
    
    
    begin

        -- Registrador
        process(clock, reset)
            begin
                if reset = '0' then
                    Q_reg <= "0000";
                elsif (clock'event AND clock = '1') then
                    Q_reg <= Smux;
            end if;
        end process;
        

        -- escrever logica do mux
        Smux <= 
            I when sel = "00" 
            else
            I + Q_reg when sel = "01" 
            else
            srw4 &Q_reg(3 downto 1) when sel = "10" 
            else
        Q_reg(2 downto 0) & sw5;
        
             
        Q_out <= Q_reg;


        
end arqdtp;

