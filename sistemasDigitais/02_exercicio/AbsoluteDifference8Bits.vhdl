LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Não altere a definição da entidade!
-- Ou seja, não modifique o nome da entidade, nome das portas e tipos/tamanhos das portas!
ENTITY AbsoluteDifference8Bits IS -- declaração da entidade AbsoluteDifference8Bits
	PORT (
        A : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- Entrada A, valor sem sinal de 8 bits (0,...,255).
        B : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- Entrada B, valor sem sinal de 8 bits (0,...,255).
    	S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)  -- Saída S,   valor sem sinal em 8 bits (0,...,255), representando |A-B|.
    );
END AbsoluteDifference8Bits;

-- Não alterar o nome da arquitetura!
ARCHITECTURE structure OF AbsoluteDifference8Bits IS
    SIGNAL diff_result : signed(8 downto 0);
    SIGNAL abs_result : unsigned(7 downto 0);
BEGIN
    diff_inst : ENTITY work.Difference8Bits
        PORT MAP (
        A => unsigned(A),
        B => unsigned(B),
        S => diff_result
        );
        
    abs_inst : ENTITY work.Absolute9Bits
        PORT MAP (
        value         => diff_result,
        absoluteValue => abs_result,
        overflow      => open -- open é usado para não conectar a porta overflow
        -- overflow não é utilizado, então não precisamos conectar
        );
        
    S <= STD_LOGIC_VECTOR(abs_result);    
END structure;