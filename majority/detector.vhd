 -- Programa para detecção de entrada '100' para saida de sinal 1
  -- Entrada de 03 sinais atraves das chaves SW(0), SW(1) e SW(2)
 -- Saida LED(0) indicará ligado para sinal 1 ou desligado para sinal 0
 library IEEE;
 use IEEE.Std_Logic_1164.all;
 
  -- entity declara as entradas e saidas do programa
  -- Neste caso será chaves e led 
 entity detector is
  port (
         SW: 	in 	std_logic_vector(9 downto 0);
         LEDR: out	std_logic_vector(9 downto 0)
       );
 end detector;
  --Arcteture declara o comportamento do programa
 architecture circuito_logico of detector is
   -- Signal declara os sinais internos     
  signal d,e,f: std_logic;
   -- Neste caso temos os sinais internos d,e,f que 
   -- existirão dentro do circuito
 
   -- Begin Delacara o compoetamento das entradas e saidas
  begin
       -- Saida será um LED que receberá as 
       -- operações AND do circuito 
  LEDR(0) <= d and e and f;
      -- Os sinais d,e,f recebem a operação AND 
      -- proveniente das entradas das chaves
  d <= SW(0) and not SW(1);
  e <= SW(0) and not SW(2);
  f <= not SW(1) and not SW(2);
 end circuito_logico;
 