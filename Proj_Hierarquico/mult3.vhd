 -- Programa para multiplicacao de números de 4 bits construído 
 -- usando um somador de 4 bits (com um half adder e full adders)
 -- Comportamento desejado: 
 -- Efetuar a multiplicacao por 3 na saida S de palavras Z de 4 bit
 -- Realiza a soma de Z + Z e o resultado soma com Z
 -- Entrada de 04 sinais atraves das chaves
 -- Saida de 5 sinais atraves dos LEDs
 -- Descritos na sessao Begin
 -- Saida do primeiro somador logica para a entrada na 
 -- segunda operação de soma
 
 library IEEE;
 use IEEE.Std_Logic_1164.all;
 
 -- entity declara as entradas e saidas do programa
  -- Neste caso será chaves e leds
 entity mult3 is
     port (
            -- Z: in std_logic_vector(3 downto 0);
            -- R: out std_logic_vector(4 downto 0);
 -- Codigo para FPGA
             KEY: in std_logic_vector(3 downto 0);
             SW: in std_logic_vector(17 downto 0);
             LEDR: out std_logic_vector(17 downto 0);
             HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: 
             out std_logic_vector(6 downto 0)
     );
 end mult3;
   --Arcteture declara o comportamento do programa
 architecture mult3arch of mult3 is
     -- Signal declara os sinais internos 
    signal E: std_logic_vector(4 downto 0);
     -- Component declara funcoes que poderâo ser 
     -- chamada pelo programa principal 
     -- Neste caso chamara o arquivo somador.VHD
    component somador is
        port (
            X3,X2,X1,X0: in std_logic;
            Y3,Y2,Y1,Y0: in std_logic;
            S4,S3,S2,S1,S0: out std_logic
        );
       
    end component;
     -- Begin Delacara o compoetamento das entradas e saidas
    begin
        -- SUM1: somador port map (Z(3),Z(2),Z(1),Z(0),Z(3),Z(2),Z(1),Z(0),E(4),E(3),E(2),E(1),E(0));
        -- SUM2: somador port map (Z(3),Z(2),Z(1),Z(0),E(3),E(2),E(1),E(0),R(4),R(3),R(2),R(1),R(0));
     -- Codigo para FPGA
        SUM1: somador port map (
            SW(3),SW(2),SW(1),SW(0),
            SW(3),SW(2),SW(1),SW(0),
            E(4),E(3),E(2),E(1),E(0)
        );
        SUM2: somador port map (
            SW(3),SW(2),SW(1),SW(0),
            E(3),E(2),E(1),E(0),
            LEDR(5),LEDR(3),LEDR(2),LEDR(1),LEDR(0)
        );
         -- mapa de chaves e leds   
         -- Z0 <= SW(0);
         -- Z1 <= SW(1);
         -- Z2 <= SW(2);
         -- Z3 <= SW(3);
 
         -- LEDR(0) <= R0;
         -- LEDR(1) <= R1;
         -- LEDR(2) <= R2;
         -- LEDR(3) <= R3;
         -- LEDR(5) <= R4;
 end mult3arch;