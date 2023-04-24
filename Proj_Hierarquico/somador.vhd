 -- Programa para  somador de números de 4 bits construído 
 -- usando um half adder e full adders
 -- Comportamento desejado: 
 -- Efetuar a soma S de palavras X e Y de 4 bit
 -- Levar em conta o carry out Cout e carry in Cin (“vai um”)
 -- Entrada de 08 sinais atraves das chaves
 -- Saida de 5 sinais atraves dos LEDs
 -- Descritos na sessao Begin mapa de chaves e leds
 -- carry in entrada logica
 
library IEEE;
use IEEE.Std_Logic_1164.all;

-- entity declara as entradas e saidas do programa
 -- Neste caso será chaves e leds
entity somador is
    port (
            X3,X2,X1,X0: in std_logic;
            Y3,Y2,Y1,Y0: in std_logic;
            S4,S3,S2,S1,S0: out std_logic;
-- Codigo para FPGA
            --KEY: in std_logic_vector(3 downto 0);
            --SW: in std_logic_vector(17 downto 0);
            --LEDR: out std_logic_vector(17 downto 0);
            --HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: 
            --out std_logic_vector(6 downto 0)
    );
end somador;
  --Arcteture declara o comportamento do programa
architecture soma4 of somador is
    -- Signal declara os sinais internos 
    signal C0,C1,C2: std_logic;
    -- Component declara funcoes que poderâo ser 
    -- chamada pelo programa principal 
    -- Neste caso chamara o arquivo halfadder.VHD
    component halfadder is
    
        port (
            A: in std_logic;
            B: in std_logic;
            Sum: out std_logic;
            Cout: out std_logic);
    end component;
    -- Neste caso chamara o arquivo fulladder.VHD
    component fulladder is
        
        port (
            A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            Sum: out std_logic;
            Cout: out std_logic
        );
    end component;
    -- Begin Delacara o compoetamento das entradas e saidas
    begin
        
        
        HA: halfadder port map (X0,Y0,S0,C0);
        FA1: fulladder port map(X1,Y1,C0,S1,C1);
        FA2: fulladder port map(X2,Y2,C1,S2,C2);
        FA3: fulladder port map(X3,Y3,C2,S3,S4);
-- Codigo para FPGA
        --HA: halfadder port map (SW(0),SW(14),LEDR(0),C0);
        --FA1: fulladder port map(SW(1),SW(15),C0,LEDR(1),C1);
        --FA2: fulladder port map(SW(2),SW(16),C1,LEDR(2),C2);
        --FA3: fulladder port map(SW(3),SW(17),C2,LEDR(3),LEDR(5));

         -- mapa de chaves e leds   
        -- X0 <= SW(0);
        -- X1 <= SW(1);
        -- X2 <= SW(2);
        -- X3 <= SW(3);

        -- Y0 <= SW(14);
        -- Y1 <= SW(15);
        -- Y2 <= SW(16);
        -- Y3 <= SW(17);

        -- LEDR(0) <= S0;
        -- LEDR(1) <= S1;
        -- LEDR(2) <= S2;
        -- LEDR(3) <= S3;
        -- LEDR(5) <= S4;
end soma4;