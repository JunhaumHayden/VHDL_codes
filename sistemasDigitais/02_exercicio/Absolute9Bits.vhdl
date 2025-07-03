library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Em sua implementação, use as funções disponíveis na biblioteca numeric_std:
USE IEEE.NUMERIC_STD.ALL;
-- Perceba que ela já é usada na definição das entradas e saídas da arquitetura.

-- Não altere a definição da entidade!
-- Ou seja, não modifique o nome da entidade, nome das portas e tipos/tamanhos das portas!
ENTITY Absolute9Bits IS -- Declaração da entidade Absolute9bits
    Port (
        value:         IN  SIGNED(8 DOWNTO 0); -- valor de entrada, sinalizado, com 9 bits  (-256,...,255)
        absoluteValue: OUT UNSIGNED(7 DOWNTO 0); -- valor de saída, não-sinalizado, com 8 bits (0,...,255)
        overflow:      OUT STD_LOGIC -- sinal para representar que a saída não é válida
    );
END Absolute9Bits;


-- Não alterar o nome da arquitetura!
ARCHITECTURE arch OF Absolute9Bits IS
   SIGNAL abs_value: unsigned(8 downto 0);
BEGIN
    abs_value <= unsigned(ABS(value));
    overflow <= abs_value(8);
    
    absoluteValue <= abs_value(7 downto 0);
END arch;