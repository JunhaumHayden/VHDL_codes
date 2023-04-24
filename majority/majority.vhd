 -- Programa para detecção de predominancia de sinal 1
 -- Pelo menos dois sinais 1 a saida será 1
 -- Entrada de 03 sinais atraves das chaves SW(1), SW(2) e SW(3)
 -- Saida LED(0) indicará ligado para sinal 1 ou desligado para sinal 0
library IEEE;
use IEEE.Std_Logic_1164.all;

 -- entity declara as entradas e saidas do programa
entity majority is
 port (
        SW: 	in 	std_logic_vector(9 downto 0);
        LEDR: out	std_logic_vector(9 downto 0)
      );
end majority;
 --Arcteture declara o comportamento do programa
architecture circuito_logico of majority is 
 signal d,e,f: std_logic;
  -- Neste caso temos os sinais internos d,e,f que 
  -- existirão dentro do circuito

  -- Begin Delacara o compoetamento das entradas e saidas
 begin
      -- Saida será um LED que receberá as 
      -- operações OR do circuito 
 LEDR(0) <= d or e or f;
     -- Os sinais d,e,f recebem a operação AND 
     -- proveniente das entradas das chaves
 d <= SW(0) and SW(1);
 e <= SW(0) and SW(2);
 f <= SW(1) and SW(2);
end circuito_logico;
