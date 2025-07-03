library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity MachineManager is 
        port (
            LEDR: out std_logic_vector(9 downto 0);
            CLK_1: in std_logic;
            KEY: in std_logic_vector(3 downto 0);
            HEX0: out std_logic_vector(6 downto 0);
            SW: in std_logic_vector(9 downto 0)
        );
end MachineManager;

architecture arqmachine of MachineManager is
                -- Signals declare the internal signals
	    signal DISP: std_logic_vector(6 downto 0);
	    signal I, Qout: std_logic_vector(3 downto 0);
            signal sel: std_logic_vector(1 downto 0);
            signal CLK, RST, S1,S0, ctrl: std_logic;

   -- Component declares functions that can be called by the main program
   -- In this case, it calls the files Datapath.vhd, decod.vhd  and controle.vhd after implementing
component Datapath is 
        port (
                I: in std_logic_vector(3 downto 0);
                sw4,sw5: in std_logic;
                sel: in std_logic_vector(1 downto 0);
                Q_out: out std_logic_vector(3 downto 0);
                clock, reset: in std_logic
        );
end component;

component decod is
port (C:  in std_logic_vector(3 downto 0);
      F:  out std_logic_vector(6 downto 0)
     );
end component;

component Controle is 
    port (
        clock,ctrl: in std_logic;
        S1,S0: out std_logic
    );
end component;

    begin

     -- declares port maps
        L1: datapath port map (I, '0', '0', sel, Qout, CLK_1, '1');
        L2: controle port map (CLK_1, ctrl, S1, S0); --Uncomment after implementing
        L3: decod port map (Qout, DISP);
       
    --declares inputs (switch and keys) and outputs (LEDR and HEX)     
        I <= "0001";
        sel <= S1&S0;
        ctrl <= SW(0);
        
        LEDR(3 downto 0) <= Qout;
        Hex0 <= DISP;

end arqmachine;

