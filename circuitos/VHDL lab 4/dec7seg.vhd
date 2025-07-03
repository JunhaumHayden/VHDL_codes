-- • O display de 7-segmentos, do tipo 
-- anodo comum (LEDs acendem com zero lógico).
-- • Para escrever um valor binário em um dos displays, é preciso 
-- realizar uma conversão do código binário para o código 
-- 7-segmentos.
-- • Os 3 bits de entrada do circuito “dec7seg” são 
-- decodificados, e a palavra de 7 bits gerada é enviada para o 
-- display de 7 segmentos.
library IEEE;
use IEEE.Std_Logic_1164.all;
entity dec7seg is
  -- entity declara as entradas e saidas do programa
 -- Neste caso será um vetor "C" de 3 bits e um vetor "F" de 
 -- 7 bits 
 port (
      C: in std_logic_vector(3 downto 0);
      F: out std_logic_vector(6 downto 0)

-- Codigo para FPGA
   -- KEY: in std_logic_vector(3 downto 0);
   -- SW: in std_logic_vector(17 downto 0);
   -- LEDR: out std_logic_vector(17 downto 0);
   -- HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: 
   -- out std_logic_vector(6 downto 0)      
    );
end dec7seg;

 --Arcteture declara o comportamento do programa
architecture decod of dec7seg is

  -- Begin Delacara o compoetamento das entradas e saidas
begin 

  F<="1000000" when C = "0000" else --0
     "1111001" when C = "0001" else --1
     "0100100" when C = "0010" else --2
     "0110000" when C = "0011" else --3
     "0011001" when C = "0100" else --4
     "0010010" when C = "0101" else --5
     "0000010" when C = "0110" else --6
     "1111000" when C = "0111" else --7
     "0000000" when C = "1000" else --8
     "0011000" when C = "1001" else --9
     "0001000" when C = "1010" else --a
     "0000011" when C = "1011" else --b
     "1000110" when C = "1100" else --c
     "0100001" when C = "1101" else --d
     "0000110" when C = "1110" else --e
     "0001110" when C = "1111" else --f
     "1111111";
     
      -- Codigo para FPGA
     --  HEX0<="1000000" when sw(3 downto 0) = "0000" else --0
     --"1111001" when sw(3 downto 0) = "0001" else --1
     --"0100100" when sw(3 downto 0) = "0010" else --2
     --"0110000" when sw(3 downto 0) = "0011" else --3
     --"0011001" when sw(3 downto 0) = "0100" else --4
     --"0010010" when sw(3 downto 0) = "0101" else --5
     --"0000010" when sw(3 downto 0) = "0110" else --6
     --"1111000" when sw(3 downto 0) = "0111" else --7
     --"0000000" when sw(3 downto 0) = "1000" else --8
     --"0011000" when sw(3 downto 0) = "1001" else --9
     --"0001000" when sw(3 downto 0) = "1010" else --a
     --"0000011" when sw(3 downto 0) = "1011" else --b
     --"1000110" when sw(3 downto 0) = "1100" else --c
     --"0100001" when sw(3 downto 0) = "1101" else --d
     --"0000110" when sw(3 downto 0) = "1110" else --e
     --"0001110" when sw(3 downto 0) = "1111" else --f
     --"1111111";
     

end decod;