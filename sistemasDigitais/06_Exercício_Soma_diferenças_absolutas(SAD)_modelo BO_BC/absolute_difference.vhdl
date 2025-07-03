--------------------------------------------------
--	Author:      Ismael Seidel (entity)
--	Created:     May 1, 2025
--
--	Project:     Exercício 6 de INE5406
--	Description: Contém a descrição de uma entidade para o cálculo da
--               diferença absoluta entre dois valores de N bits sem sinal.
--               A saída também é um valor de N bits sem sinal. 
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Calcula a diferença absoluta entre dois valores, similar ao Exercício 2.
-- Note que agora nosso circuito será parametrizável para N bits e as entradas
-- e saídas são unsigned (no Exercício 2 eram std_logic_vector pois tratava-se do
-- top-level). 
-- A saída abs_diff deve ser o resultado de |input_a - input_b|, onde | | é a operação
-- de valor absoluto.
entity absolute_difference IS
	generic(
		N : positive := 8
	);
	port(
		input_a  : in  unsigned(N - 1 downto 0);
		input_b  : in  unsigned(N - 1 downto 0);
		abs_diff : out unsigned(N - 1 downto 0)
	);
end entity;
-- Não altere a definição da entidade!
-- Ou seja, não modifique o nome da entidade, nome das portas e tipos/tamanhos das portas!

-- Não alterar o nome da arquitetura!
architecture structure OF absolute_difference IS
    -- Se precisar, podes adicionar declarações aqui (remova este comentário).
     -- Sinais internos para armazenar os resultados das subtrações
    signal diff_a_b : signed(N - 1 downto 0);
    signal diff_b_a : signed(N - 1 downto 0);
    signal mux_out  : signed(N - 1 downto 0);
    signal mux_out_std : std_logic_vector(N - 1 downto 0);


    -- Sinal de controle para o mux (input_a < input_b)
    signal sel : std_logic;

    -- Componentes
    component signed_subtractor is
        generic (
            N : positive := 8
        );
        port (
            input_a    : in  signed(N - 1 downto 0);
            input_b    : in  signed(N - 1 downto 0);
            difference : out signed(N - 1 downto 0)
        );
    end component;

    component mux_2to1 is
        generic (
            N : positive
        );
        port (
            sel        : in  std_logic;
            in_0, in_1 : in  std_logic_vector(N - 1 downto 0);
            y          : out std_logic_vector(N - 1 downto 0)
        );
    end component;
begin
    -- Preencher aqui (remova este comentário).
    --    O objetivo nesta descrição é apenas usar possíveis conversões e instanciar
    -- Outros módulos para fazer o cálculo.
    -- Se você quiser, pode usar a mesmo lógica do Exercício 2, mas garantindo o
    -- uso de generics.
    -- É possível fazer o upload de um arquivo para criar a entidade absolute.
    
    -- DICA: é possível fazer o cálculo do valor absoluto com 2 subtratores e um
    -- multiplexador 2:1. Tal implementação tem a vantagem de ser mais rápida
    -- (i.e., menor atraso de propagação) do que um subtrator seguido do cálculo
    -- do valor absoluto.

    -- Comparação: se input_a < input_b, então escolhemos diff_b_a
    sel <= '1' when input_a < input_b else '0';
    

    -- Subtração: A - B
    sub_a_b: signed_subtractor
        generic map (N => N)
        port map (
            input_a    => signed(resize(input_a, N)),
            input_b    => signed(resize(input_b, N)),
            difference => diff_a_b
        );

    -- Subtração: B - A
    sub_b_a: signed_subtractor
        generic map (N => N)
        port map (
            input_a    => signed(resize(input_b, N)),
            input_b    => signed(resize(input_a, N)),
            difference => diff_b_a
        );

    -- Mux para selecionar |A - B| ou |B - A|
    mux: mux_2to1
        generic map (N => N)
        port map (
            sel    => sel,
            in_0   => std_logic_vector(diff_a_b),
            in_1   => std_logic_vector(diff_b_a),
            y      => mux_out_std

        );

    -- Saída convertida para unsigned
    mux_out <= signed(mux_out_std);
    abs_diff <= unsigned(mux_out);
end architecture structure;