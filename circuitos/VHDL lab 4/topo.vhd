 -- Programa para  topo de números de 4 bits construído 
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
 use IEEE.std_logic_unsigned.all;
 
 -- Entity declares the inputs and outputs of the program
 -- In this case, they are switches and LEDs
 entity topo is
     port (
         KEY: in std_logic_vector(3 downto 0);
         SW: in std_logic_vector(17 downto 0);
         LEDR: out std_logic_vector(17 downto 0);
         HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0)
     );
 end topo;
 
 -- Architecture declares the behavior of the program
 architecture opex of topo is
     -- Signals declare the internal signals
     signal F1, F2, F3, F4, S, G: std_logic_vector(3 downto 0);
 
     -- Component declares functions that can be called by the main program
     -- In this case, it calls the files halfadder.vhd, sum.vhd, and dec7seg.vhd
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
     
     -- Begin declares the behavior of the inputs and outputs
     begin
         
         LEDR(3 downto 0) <= G;
 
         F1 <= '0' & SW(2 downto 0); -- A
         F2 <= SW(2 downto 0) & '0'; -- 2A
         F3 <= '0' & SW(6 downto 4); -- B
         F4 <= SW(6 downto 4) & '0'; -- 2B
 
         mux1: mux port map (F1, F2, F3, F4, SW(9 downto 8), S);
         sum1: sum port map (F1, S, G);
         dec7: dec7seg port map (G, HEX0);
     end opex;
 