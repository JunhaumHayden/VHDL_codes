--------------------------------------------------
--	Author:      Ismael Seidel (entidade)
--	Created:     May 1, 2025
--
--	Project:     Exercício 6 de INE5406
--	Description: Contém a descrição da entidade `sad_bo`, que representa o
--               bloco operativo (BO) do circuito para cálculo da soma das
--               diferenças absolutas (SAD - Sum of Absolute Differences).
--               Este bloco implementa o *datapath* principal do circuito e
--               realiza operações como subtração, valor absoluto e acumulação
--               dos valores calculados. Além disso, também será feito aqui o
--               calculo de endereçamento e do sinal de controle do laço de
--               execução (menor), que deve ser enviado ao bloco de controle (i.e.,
--               menor será um sinal de status gerado no BO).
--               A parametrização é feita por meio do tipo
--               `datapath_configuration_t` definido no pacote `sad_pack`.
--               Os parâmetros incluem:
--               - `bits_per_sample`: número de bits por amostra; (uso obrigatório)
--               - `samples_per_block`: número total de amostras por bloco; (uso 
--                  opcional, útil para definição do número de bits da sad e 
--                  endereço, conforme feito no top-level, i.e., no arquivo sad.vhdl)
--               - `parallel_samples`: número de amostras processadas em paralelo.
--                  (uso opcional)
--               A arquitetura estrutural instanciará os componentes necessários
--               à implementação completa do bloco operativo.
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sad_pack.all;

-- Bloco Operativo (BO) do circuito SAD.
-- Responsável pelo processamento aritmético dos dados de entrada, incluindo
-- subtração, cálculo de valor absoluto e soma acumulada.
-- Totalmente parametrizável por meio do tipo `datapath_configuration_t`.
entity sad_bo is
	generic(
		CFG : datapath_configuration_t := (
			bits_per_sample   => 8,  -- número de bits por amostra
			samples_per_block => 64, -- número total de amostras por bloco
			parallel_samples  => 1   -- paralelismo no processamento
		));
        --N : positive := address_length(CFG.samples_per_block, CFG.parallel_samples) + 1;
        --M : positive := CFG.bits_per_sample * CFG.parallel_samples;
        --O : positive := sad_length(CFG.bits_per_sample, CFG.samples_per_block)
	--);
	port(
		clk : in std_logic;
		menor : out std_logic;
		address    : out std_logic_vector(address_length(CFG.samples_per_block, CFG.parallel_samples) + 1 - 2 downto 0);
        ci, zi, cpA, cpB, zsoma, csoma, csad_reg : in std_logic;
		-- defina os demais sinais necessários
		-- não esqueça de colocar o ; no final da linha que declara o clk :)
		A : in std_logic_vector(CFG.bits_per_sample * CFG.parallel_samples - 1 downto 0);
		B : in std_logic_vector(CFG.bits_per_sample * CFG.parallel_samples - 1 downto 0);
		sad_value : out std_logic_vector(sad_length(CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0)
	);
end entity;
-- Não altere o nome da entidade! Como você quem irá instanciar, neste caso podes
-- mudar o nome da arquitetura, embora isso não seja necessário. 
-- A arquitetura será estrutural, composta por instâncias de componentes auxiliares.

architecture structure OF sad_bo is
    signal saidamux1 : std_logic_vector(address_length(CFG.samples_per_block, CFG.parallel_samples) + 1 - 1 downto 0);
    signal saidareg1 : unsigned(address_length(CFG.samples_per_block, CFG.parallel_samples) + 1 - 1 downto 0);
    signal soma1res : unsigned(address_length(CFG.samples_per_block, CFG.parallel_samples) + 1 - 1 downto 0);
    ---------
    signal saidaregA : unsigned(CFG.bits_per_sample * CFG.parallel_samples - 1 downto 0);
    signal saidaregB : unsigned(CFG.bits_per_sample * CFG.parallel_samples - 1 downto 0);
    signal saidasub : unsigned(CFG.bits_per_sample * CFG.parallel_samples - 1 downto 0);
    signal soma2res : unsigned(sad_length(CFG.bits_per_sample, CFG.samples_per_block) downto 0);
    signal saidamux2 : std_logic_vector(sad_length(CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0);
    signal saidasoma : unsigned(sad_length(CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0);
    signal resultado : unsigned(sad_length(CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0);
begin
    -- Bloco 1:
    mult1_inst : entity work.mux_2to1
        generic map (
            N => address_length(CFG.samples_per_block, CFG.parallel_samples) + 1
        )
        port map (
            sel => zi,
            in_0 => std_logic_vector(soma1res),
            in_1 => (others => '0'),
            y => saidamux1
        );
    reg1_inst : entity work.unsigned_register
        generic map (
            N => address_length(CFG.samples_per_block, CFG.parallel_samples) + 1
        )
        port map (
            clk => clk,
            enable => ci,
            d => unsigned(saidamux1),
            q => saidareg1
        );
    address <= std_logic_vector(saidareg1(address_length(CFG.samples_per_block, CFG.parallel_samples) + 1-2 downto 0));
    menor <= not saidareg1(address_length(CFG.samples_per_block, CFG.parallel_samples) + 1-1);
    som1_inst : entity work.unsigned_adder
        generic map(
            N => address_length(CFG.samples_per_block, CFG.parallel_samples) + 1 - 1
        )
        port map(
            input_a => resize(saidareg1, address_length(CFG.samples_per_block, CFG.parallel_samples) + 1 - 1),
            input_b => to_unsigned(1, address_length(CFG.samples_per_block, CFG.parallel_samples) + 1 - 1),
            sum => soma1res
        );
    
    -- Bloco 2
    
    reg2_inst : entity work.unsigned_register
        generic map (
            N => CFG.bits_per_sample * CFG.parallel_samples
        )
        port map (
            clk => clk,
            enable => cpA,
            d => unsigned(A),
            q => saidaregA
        );

    reg3_inst : entity work.unsigned_register
        generic map (
            N => CFG.bits_per_sample * CFG.parallel_samples
        )
        port map (
            clk => clk,
            enable => cpB,
            d => unsigned(B),
            q => saidaregB
        );
    
    sub1_inst : entity work.absolute_difference
        generic map (
            N => CFG.bits_per_sample * CFG.parallel_samples
        )
        port map (
            input_a => saidaregA,
            input_b => saidaregB,
            abs_diff => saidasub
        );
        
    som2_inst : entity work.unsigned_adder
        generic map(
            N => sad_length(CFG.bits_per_sample, CFG.samples_per_block
        ))
        port map(
            input_a => resize(saidasub, sad_length(CFG.bits_per_sample, CFG.samples_per_block)),
            input_b => saidasoma,
            sum => soma2res
        );
    mult2_inst : entity work.mux_2to1
        generic map (
            N => sad_length(CFG.bits_per_sample, CFG.samples_per_block
        ))
        port map (
            sel => zsoma,
            in_0 => std_logic_vector(soma2res(sad_length(CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0)),
            in_1 => (others => '0'),
            y => saidamux2
        );
    reg4_inst : entity work.unsigned_register
        generic map (
            N => sad_length(CFG.bits_per_sample, CFG.samples_per_block
        ))
        port map (
            clk => clk,
            enable => csoma,
            d => unsigned(saidamux2),
            q => saidasoma
        );
    reg5_inst : entity work.unsigned_register
        generic map (
            N => sad_length(CFG.bits_per_sample, CFG.samples_per_block)
        )
        port map (
            clk => clk,
            enable => csad_reg,
            d => saidasoma,
            q => resultado
        );
    sad_value <= std_logic_vector(resultado);
    
    
end architecture structure;