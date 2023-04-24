-- Programa para somador completo de 1 bit
 -- Comportamento desejado: 
 -- Efetuar a soma S de palavras A e B de 1 bit
 -- Levar em conta o carry out Cout e carry in Cin (“vai um”)
 -- Entrada de 02 sinais atraves das chaves SW(0) e SW(1) e 
 -- carry in SW(2)
 -- Saida LED(0) indicara a soma e recebe a operacao 
 -- XOR de SW(0) com SW(1) 
 -- Saida LEDR(2) indica Carry e recebe a operacao 
 -- AND de SW(0) e SW(1)
library ieee;
use ieee.std_logic_1164.all;
   -- entity declara as entradas e saidas do programa
  -- Neste caso será chaves e leds REDS e GREENS
entity fulladder is 
    port (
    
        A,B,Cin: in std_logic;
        Sum,Cout: out std_logic 
        
        -- Codigo para FPGA
        -- SW: in std_logic_vector(17 downto 0);
        -- LEDR: out std_logic_vector(17 downto 0)
        -- LEDG: out std_logic_vector(7 downto 0)
    );
end fulladder;
--Arcteture declara o comportamento do programa
architecture hadder of fulladder is
    begin
        sum <= a xor b xor cin; -- Calcula a soma com XOR
        cout <= (a and b) or (cin and (a xor b));  
        -- Calcula o carry-out com OR e AND
        
        -- Codigo para FPGA
        -- LEDR(0) <= SW(0) xor SW(1) xor SW(2);
        -- LEDR(2) <= (SW(0) and SW(1)) or (SW(2) and (SW(0) xor SW(1)) );
end hadder;
