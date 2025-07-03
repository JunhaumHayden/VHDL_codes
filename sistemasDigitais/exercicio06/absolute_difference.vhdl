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
    -- Sinais auxiliares para conversão e resultado intermediário
    signal a_s, b_s         : signed(N downto 0);
    signal diff_ab, diff_ba : signed(N downto 0);
    signal abs_candidate_0, abs_candidate_1 : unsigned(N-1 downto 0);
    signal sel_mux : std_logic;
    signal abs_diff_slv : std_logic_vector(N - 1 downto 0);

begin
    -- Conversão de entradas para signed
    a_s <= signed('0' & input_a);
    b_s <= signed('0' & input_b);

    -- Instanciação do subtrator: A - B
    sub_ab: entity work.signed_subtractor
        generic map (N => N + 1)
        port map (
            input_a    => a_s,
            input_b    => b_s,
            difference => diff_ab
        );

    -- Instanciação do subtrator: B - A
    sub_ba: entity work.signed_subtractor
        generic map (N => N + 1)
        port map (
            input_a    => b_s,
            input_b    => a_s,
            difference => diff_ba
        );

    -- Conversão dos resultados de signed para unsigned (descartando bit de sinal)
    abs_candidate_0 <= unsigned(diff_ab(N-1 downto 0));
    abs_candidate_1 <= unsigned(diff_ba(N-1 downto 0));

    -- Define qual resultado é positivo (se diff_ab < 0, escolhemos B - A)
    sel_mux <= '1' when diff_ab(N) = '1' else '0';

    -- Instanciação do mux 2:1 para escolher o valor absoluto correto
    mux: entity work.mux_2to1
        generic map (N => N)
        port map (
            sel   => sel_mux,
            in_0  => std_logic_vector(abs_candidate_0),
            in_1  => std_logic_vector(abs_candidate_1),
            y     => abs_diff_slv
        );
    abs_diff <= unsigned(abs_diff_slv);
end architecture structure;