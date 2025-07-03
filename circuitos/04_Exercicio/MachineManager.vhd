library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity MachineManager is 
        port (
            LEDR: out std_logic_vector(9 downto 0);
            --CLK_1: in std_logic;
            KEY: in std_logic_vector(3 downto 0);
            HEX0: out std_logic_vector(6 downto 0);
            SW: in std_logic_vector(9 downto 0)
        );
end MachineManager;

architecture arqmachine of MachineManager is
                -- Signals declare the internal signals
	    signal DISP: std_logic_vector(6 downto 0);
	    signal entradaI, Qout: std_logic_vector(3 downto 0);
            signal sel_mux: std_logic_vector(1 downto 0);
            signal CLK, RST, sw04,sw05: std_logic;

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
        L1: datapath port map ( entradaI, sw04, sw05, sel_mux, Qout, CLK, RST);
        --L2: controle port map (); --Uncomment after implementing
        L3: decod port map (Qout, DISP);
       
    --declares inputs (switch and keys) and outputs (LEDR and HEX)     
        entradaI <= SW(3 downto 0);
        sel_mux<= SW(9 downto 8);
        sw04 <= SW(4);
        sw05 <= SW(5);
        CLK <= KEY(1);
        RST <= KEY(0);
        
        LEDR(3 downto 0) <= Qout;
        Hex0 <= DISP;

end arqmachine;

