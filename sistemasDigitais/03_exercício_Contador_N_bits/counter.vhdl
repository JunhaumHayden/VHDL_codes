library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Importante para aritmética com vetores

-- Entidade com generic N corretamente definido
ENTITY counter IS
    GENERIC (N : POSITIVE := 4); -- N define o número de bits do contador
    PORT (
        clock  : IN STD_LOGIC;
        reset  : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        count  : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) -- count agora usa N bits
    );
END counter;

ARCHITECTURE arch OF counter IS
    -- Sinal interno do tipo UNSIGNED para manipulação aritmética
    SIGNAL count_reg : UNSIGNED(N-1 DOWNTO 0);
BEGIN
    PROCESS (clock, reset)
    BEGIN
        IF reset = '1' THEN
            count_reg <= (OTHERS => '0');
        ELSIF rising_edge(clock) THEN
            IF enable = '1' THEN
                count_reg <= count_reg + 1;
            END IF;
        END IF;
    END PROCESS;

    -- Atribuição final para a saída como STD_LOGIC_VECTOR
    count <= STD_LOGIC_VECTOR(count_reg);

END arch;
