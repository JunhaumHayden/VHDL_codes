 -- Programa para multimodo de ue realiza 4 operacoes confome chave de selecao 
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
 use IEEE.std_logic_unsigned.all; -- necessary for the operation +
 
 -- Entity declares the inputs and outputs of the program
 -- In this case, they are keys, switches, LEDs and displays

 entity multimodo is
     port (
         KEY: in std_logic_vector(3 downto 0);
         SW: in std_logic_vector(17 downto 0);
         LEDR: out std_logic_vector(17 downto 0);
         HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0)
     );
 end multimodo;
 
 -- Architecture declares the behavior of the program
 architecture opex of multimodo is
     -- Signals declare the internal signals
     signal I, G, SHR, SHL, S, Q: std_logic_vector(3 downto 0);
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
         LEDR(13 downto 10) <= S;
         
         --declares output
         LEDR(3 downto 0) <= Q;

         --declares operations shitf rigth and left
         SHR <= shr_in & Q(3 downto 1);
         SHL <=  Q(2 downto 0) & shl_in ;

         -- declares port maps
         reg: registrador port map(clk, rst, enb, S, Q);
         mux1: mux port map (I, G, SHR, SHL, sel_mux, S);
         sum1: sum port map (I, Q, G);
         dec7: dec7seg port map (Q, HEX0);
         
         
         
         
     end opex;