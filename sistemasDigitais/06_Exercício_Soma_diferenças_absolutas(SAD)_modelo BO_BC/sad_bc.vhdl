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
		rst_a : in std_logic;   -- reset assíncrono ativo em nível alto
		-- defina os demais sinais necessários
		-- não esqueça de colocar o ; no final da linha que declara o rst_a :)
        enable     : in std_logic;

        done    : out std_logic;    -- sinal de término

        menor  : in std_logic;     -- vem do BO: contador < 64?
        
        read_mem : OUT STD_LOGIC; -- read
        
        zi, zsoma : out std_logic;    -- mux_i e mux_soma

        ci, cPA, cPB : out std_logic; -- enable do registrador de entrada
        csoma     : out std_logic;    -- enable da soma
        csad_reg  : out std_logic    -- enable do registrador de SAD
        
        );
end entity;
-- Não altere o nome da entidade nem da arquitetura!

architecture behavior of sad_bc is
    -- Se necessário, declare sinais internos aqui.
    type state_type is (S0, S1, S2, S3, S4, S5);
    signal current_state, next_state : state_type;
begin
    -- Preencher aqui (remova este comentário).
    -- Descreva a FSM responsável por coordenar o circuito SAD.
    
    -- Dica: separar em 3 processos:
    -- 1) carga e reset do registrador de estado;
    -- 2) LPE;
    -- 3) LS.
    -- 1. Processo de reset e carga de estado
    process(clk, rst_a)
    begin
        if rst_a = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- 2. Lógica de Próximo Estado (LPE)
    process(current_state, enable, menor)
    begin
        case current_state is
            when S0 =>
                if enable = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                next_state <= S2;

            when S2 =>
			if(menor = '0') then
				next_state <= S5;
			else
				next_state <= S3;
			end if;

            when S3 =>
                next_state <= S4;
                
            when S4 =>
                next_state <= S2;

            when S5 =>
                next_state <= S0;

            when others =>
                next_state <= S0;
        end case;
    end process;

    -- 3. Lógica de Saída (LS)
    process(current_state)
    begin
        case current_state is
            when S0 =>
                done <= '1';
                zi <= '0';
                ci <= '0';
                cPA <= '0';
                cPB <= '0';
                zsoma <= '0';
                csoma <= '0';
                csad_reg <= '0';
                read_mem <= '0';

            when S1 =>
                done <= '0';
                zi <= '1';
                ci <= '1';
                cPA <= '0';
                cPB <= '0';
                zsoma <= '1';
                csoma <= '1';
                csad_reg <= '0';
                read_mem <= '0';

            when S2 =>
                done <= '0';
                zi <= '0';
                ci <= '0';
                cPA <= '0';
                cPB <= '0';
                zsoma <= '0';
                csoma <= '0';
                csad_reg <= '0';
                read_mem <= '0';
			
            when S3 =>
                done <= '0';
                zi <= '0';
                ci <= '0';
                cPA <= '1';
                cPB <= '1';
                zsoma <= '0';
                csoma <= '0';
                csad_reg <= '0';
                read_mem <= '1';
                
            when S4 =>
                done <= '0';
                zi <= '0';
                ci <= '1';
                cPA <= '0';
                cPB <= '0';
                zsoma <= '0';
                csoma <= '1';
                csad_reg <= '0';
                read_mem <= '0';
            when S5 =>
                done <= '0';
                zi <= '0';
                ci <= '0';
                cPA <= '0';
                cPB <= '0';
                zsoma <= '0';
                csoma <= '0';
                csad_reg <= '1';
                read_mem <= '0';

            when others =>
                done <= '1';
                zi <= '0';
                ci <= '0';
                cPA <= '0';
                cPB <= '0';
                zsoma <= '0';
                csoma <= '0';
                csad_reg <= '0';
                read_mem <= '0';
        end case;
    end process;

end architecture;
