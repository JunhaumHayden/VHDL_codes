 -- Programa para meio somador de 1 bit
 -- Comportamento desejado: 
 -- Efetuar a soma S de palavras A e B de 1 bit
 -- Levar em conta o carry out C (“vai um”)
 -- Entrada de 02 sinais atraves das chaves SW(0) e SW(1)
 -- Saida LED(0) indicara a soma e recebe a operacao 
 -- XOR de SW(0) com SW(1) 
 -- Saida LEDR(2) indica Carry e recebe a operacao 
 -- AND de SW(0) e SW(1)
 library ieee;
 use ieee.std_logic_1164.all;
 
  -- entity declara as entradas e saidas do programa
  -- Neste caso será chaves e leds REDS e GREENS
 entity halfadder is 
  port (
        A: in std_logic;
        B: in std_logic;
        Sum: out std_logic;
        Cout: out std_logic
        -- Codigo para FPGA
        -- SW: in std_logic_vector(17 downto 0);
        -- LEDR: out std_logic_vector(17 downto 0)
        -- LEDG: out std_logic_vector(7 downto 0)
     );
 end halfadder;
 
  --Arcteture declara o comportamento do programa
 architecture hadder of halfadder is
 
     -- Begin Delacara o compoetamento das entradas e saidas
 begin
    sum <= A xor B;
    Cout <= A and B;
    -- Codigo para FPGA
    -- LEDR(0) <= SW(0) xor SW(1);
    -- LEDR(2) <= SW(0) and SW(1);
 end hadder;