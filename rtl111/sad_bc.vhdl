--------------------------------------------------
--	Author:      Ismael Seidel (entity)
--	Created:     May 1, 2025
--
--	Project:     Exercício 6 de INE5406
--	Description: Contém a descrição da entidade `sad_bc`, que representa o
--               bloco de controle (BC) do circuito para cálculo da soma das
--               diferenças absolutas (SAD - Sum of Absolute Differences).
--               Este bloco é responsável pela geração dos sinais de controle
--               necessários para coordenar o funcionamento do bloco operativo
--               (BO), como enable de registradores, seletores de multiplexadores,
--               sinais de início e término de processamento, etc.
--               A arquitetura é comportamental e deverá descrever uma máquina
--               de estados finitos (FSM) adequada ao controle do datapath.
--               Os sinais adicionais de controle devem ser definidos conforme
--               a necessidade do projeto. PS: já foram definidos nos slides
--               da aula 6T.
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Bloco de Controle (BC) do circuito SAD.
-- Responsável por gerar os sinais de controle para o bloco operativo (BO),
-- geralmente por meio de uma FSM.
entity sad_bc is
	port(
		clk   : in std_logic;  -- clock (sinal de relógio)
		rst_a : in std_logic;  -- reset assíncrono ativo em nível alto
		enable : in std_logic;
		menor : in std_logic;
        ci, zi, cpA, cpB, zsoma, csoma, csad_reg : out std_logic;
        done     : out std_logic;
        read      : out std_logic
		-- defina os demais sinais necessários
		-- não esqueça de colocar o ; no final da linha que declara o rst_a :)
	);
end entity;
-- Não altere o nome da entidade nem da arquitetura!

architecture behavior of sad_bc is
    type state_type is (S0, S1, S2, S3, S4, S5);
    signal state, next_state : state_type;
begin
    -- Processo 1: Carga e reset do registrador de estado
    process(clk, rst_a)
    begin
        if rst_a = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;
    -- Processo 2: Lógica de Próximo Estado (LPE)
    process(state, enable, menor)
    begin
        case state is
            when S0 =>
                if enable = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
            when S1 =>
                next_state <= S2;
            when S2 =>
                if menor = '1' then
                    next_state <= S3;
                else
                    next_state <= S5;
                end if;
            when S3 =>
                next_state <= S4;
            when S4 =>
                next_state <= S2;
            when S5 =>
                next_state <= S0;
        end case;
    end process;

    -- Processo 3: Lógica de Saída (LS) - Sensível a state
    process(state)
    begin
    done      <= '0';
    read      <= '0';
    zi        <= '0';
    ci        <= '0';
    zsoma     <= '0';
    csoma     <= '0';
    cpA       <= '0';
    cpB       <= '0';
    csad_reg <= '0';
        case state is
            when S0 =>
                done <= '1';
                read <= '0';
            when S1 =>
                done <= '0';
                zi <= '1';
                ci <= '1';
                zsoma <= '1';
                csoma <= '1';
            when S2 =>
                null;
            when S3 =>
                read <= '1';
                cpA <= '1';
                cpB <= '1';
            when S4 =>
                zi <= '0';
                ci <= '1';
                zsoma <= '0';
                csoma <= '1';
                read <= '0';
            when S5 =>
                csad_reg <= '1';
        end case;
    end process;
end architecture;
