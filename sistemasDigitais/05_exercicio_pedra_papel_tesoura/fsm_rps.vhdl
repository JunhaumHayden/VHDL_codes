LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fsm_rps IS
	PORT (
		clk : IN std_logic;
		rst_a : IN std_logic;
		ok : IN std_logic;
		play : IN std_logic_vector(1 DOWNTO 0);
		winner : OUT std_logic_vector(1 DOWNTO 0)
	);
END fsm_rps;

ARCHITECTURE arch OF fsm_rps IS
    TYPE state_type IS (
        WAIT_P1,
        SC_WAIT_P2,  -- Jogador 1 jogou tesoura
        RO_WAIT_P2,  -- Jogador 1 jogou pedra
        PA_WAIT_P2,  -- Jogador 1 jogou papel
        P1_WINS,
        P2_WINS,
        DRAW
    );

    SIGNAL state, next_state : state_type;
    SIGNAL play_p1 : std_logic_vector(1 DOWNTO 0);  -- Armazena jogada do jogador 1

BEGIN
	-- Processo de transição de estado (com reset assíncrono)
    process(clk, rst_a)
    begin
        IF rst_a = '1' THEN
            state <= WAIT_P1;
        ELSIF rising_edge(clk) THEN
            state <= next_state;
        END IF;
    end process;

    -- Processo de lógica de próxima transição
    process(state, ok, play)
    begin
        -- Valor padrão
        next_state <= state;

        case state is

            when WAIT_P1 =>
                if ok = '1' then
                    case play is
                        when "01" =>  -- Tesoura
                            next_state <= SC_WAIT_P2;
                        when "10" =>  -- Pedra
                            next_state <= RO_WAIT_P2;
                        when "11" =>  -- Papel
                            next_state <= PA_WAIT_P2;
                        when others =>
                            next_state <= WAIT_P1;  -- Jogada inválida
                    end case;
                end if;

            when SC_WAIT_P2 =>
                if ok = '1' then
                    case play is
                        when "01" =>  -- Tesoura
                            next_state <= DRAW;
                        when "10" =>  -- Pedra
                            next_state <= P2_WINS;
                        when "11" =>  -- Papel
                            next_state <= P1_WINS;
                        when others =>
                            next_state <= SC_WAIT_P2;
                    end case;
                end if;

            when RO_WAIT_P2 =>
                if ok = '1' then
                    case play is
                        when "01" =>  -- Tesoura
                            next_state <= P1_WINS;
                        when "10" =>  -- Pedra
                            next_state <= DRAW;
                        when "11" =>  -- Papel
                            next_state <= P2_WINS;
                        when others =>
                            next_state <= RO_WAIT_P2;
                    end case;
                end if;

            when PA_WAIT_P2 =>
                if ok = '1' then
                    case play is
                        when "01" =>  -- Tesoura
                            next_state <= P2_WINS;
                        when "10" =>  -- Pedra
                            next_state <= P1_WINS;
                        when "11" =>  -- Papel
                            next_state <= DRAW;
                        when others =>
                            next_state <= PA_WAIT_P2;
                    end case;
                end if;

            when others =>  -- Estados terminais: P1_WINS, P2_WINS, DRAW
                -- Após resultado, reinicia para próxima partida
                next_state <= WAIT_P1;

        end case;
    end process;

    -- Processo de saída (Moore - depende apenas do estado atual)
    process(state)
    begin
        case state is
            when WAIT_P1 | SC_WAIT_P2 | RO_WAIT_P2 | PA_WAIT_P2 =>
                winner <= "00";  -- Partida ainda em curso
            when P1_WINS =>
                winner <= "01";
            when P2_WINS =>
                winner <= "10";
            when DRAW =>
                winner <= "11";
        end case;
    end process;

END arch;