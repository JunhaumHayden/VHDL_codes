library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath is 
    port (
        --I: in std_logic_vector(3 downto 0);
        --sw4,sw5: in std_logic;
        --sel: in std_logic_vector(1 downto 0);
        --Q_out: out std_logic_vector(3 downto 0);
        --clock, reset: in std_logic);

        --To use in task01
        KEY: in std_logic_vector(3 downto 0);
        SW: in std_logic_vector(17 downto 0);
        LEDR: out std_logic_vector(17 downto 0);
        HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0)
    );
end Datapath;

        -- Architecture declares the behavior of the program
architecture arqdtp of Datapath is
    -- Signals declare the internal signals
    signal I, G, SHR, SHL, Qmux, Qreg: std_logic_vector(3 downto 0);
    signal sel_mux: std_logic_vector(1 downto 0);
    signal shr_in, shl_in, CLK, RST, ENB: std_logic;

     -- Component declares functions that can be called by the main program
     -- In this case, it calls the files mux.vhd, sum.vhd, dec7seg.vhd and registrador.vhd
    component mux is
        port (
                x,y,z,w: in std_logic_vector(3 downto 0);
                sel: in std_logic_vector(1 downto 0);
                m_sai: out std_logic_vector(3 downto 0)
        );
    end component;
    
    component sum is
        port (
                A: in std_logic_vector(3 downto 0);
                B: in std_logic_vector(3 downto 0);
                soma: out std_logic_vector(3 downto 0)
        );
    end component;

    component dec7seg is
        port (
                C: in std_logic_vector(3 downto 0);
                F: out std_logic_vector(6 downto 0)
        );
    end component;

    component registrador is
       port (
           CLK, RST, ENB: in std_logic;
           D: in std_logic_vector(3 downto 0);
           Q: out std_logic_vector(3 downto 0)
       );
end component;
    
      -- Begin declares the behavior of the inputs and outputs  
    begin

    --declares inputs (switch and keys) and outputs (LEDR) 
    I <= SW(3 downto 0);
    sel_mux <= SW(9 downto 8);
    shr_in <= SW(4);
    shl_in <= SW(5);
    clk <= KEY(1);
    rst <= KEY(0);
    enb <= '0';
    --LEDR(5) <= KEY(1);
    --LEDR(4) <= KEY(0);
    --LEDR(9 downto 6) <= SHL;
    
    
    --declares output
    LEDR(3 downto 0) <= Qreg;

    -- just to view the log entry. Not necessary for the exercise
    -- LEDR(13 downto 10) <= Qmux;

    --declares operations shitf rigth and left
    SHR <= shr_in & Qreg(3 downto 1);
    SHL <=  Qreg(2 downto 0) & shl_in ;

    -- declares port maps
    reg: registrador port map(clk, rst, enb, Qmux, Qreg);
    mux1: mux port map (I, G, SHR, SHL, sel_mux, Qmux);
    sum1: sum port map (I, Qreg, G);
    dec7: dec7seg port map (Qreg, HEX0);
  
    --Q_out <= Q_reg;
    
end arqdtp;

