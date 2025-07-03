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
		)
	);
	port(
		clk       : in std_logic; -- sinal de clock
		-- defina os demais sinais necessários
		-- não esqueça de colocar o ; no final da linha que declara o clk :)
        reset     : in  std_logic;  -- reset síncrono
        enable    : in  std_logic;

        ------------sinais de entrada de dados do BO-----------------
        -- exemplo: 8 bits × 4 amostras = 32 bits no total
        --  bit 31 ............ bit 0
        --   [ a3 ][ a2 ][ a1 ][ a0 ]
        -- Onde cada aX tem 8 bits (unsigned(7 downto 0)), e o vetor completo tem 32 bits.
        block_a   : in  std_logic_vector(CFG.bits_per_sample * CFG.parallel_samples - 1 downto 0);  
		block_b   : in  std_logic_vector(CFG.bits_per_sample * CFG.parallel_samples - 1 downto 0);

        ------------sinais de saída de dados do BO-----------------  
        sad_value   : out unsigned(sad_length(CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0); -- saída com o valor acumulado final da SAD 
        mem_address : out unsigned(address_length(CFG.samples_per_block, CFG.parallel_samples) - 1 downto 0);
        -- para ler Men_A e Mem_B (saida end so datapath(log2(samples_per_block))

        ------------sinais de comandos do BO-----------------
        cpA,cpB, csad_reg, ci, csoma : IN STD_LOGIC; -- cpA,cpB, csad_reg, ci, csoma
        zi, zSoma : IN STD_LOGIC; -- para o selecao mux de i (zi), soma (zsoma)
        
        ------------sinais de status do BO-----------------
        menor : OUT STD_LOGIC -- indica que todos os blocos foram processados
		
	);
end entity;
-- Não altere o nome da entidade! Como você quem irá instanciar, neste caso podes
-- mudar o nome da arquitetura, embora isso não seja necessário. 
-- A arquitetura será estrutural, composta por instâncias de componentes auxiliares.

architecture structure OF sad_bo is
    -- Se precisar, podes adicionar declarações aqui (remova este comentário).
     -- Constantes derivadas da configuração
     ------------SIGNALS-----------------
     -- Largura total (em bits) necessária para armazenar a SAD completa -- 14 bits
    constant SAD_WIDTH        : positive := sad_length(CFG.bits_per_sample, CFG.samples_per_block);
    -- número de bits de mem_address
    constant ADDR_WIDTH       : positive := address_length(CFG.samples_per_block, CFG.parallel_samples);

    -- Tipos e sinais auxiliares
    signal register_out_sad_reg_s: unsigned(SAD_WIDTH - 1 downto 0);
   

    signal register_p_a_out_s  : unsigned((CFG.bits_per_sample * CFG.parallel_samples) - 1 downto 0);
    signal register_p_b_out_s  : unsigned((CFG.bits_per_sample * CFG.parallel_samples) - 1 downto 0);
    signal abs_sub_a_b_out_s   : unsigned(CFG.bits_per_sample - 1 downto 0);

    signal register_soma_out_s : unsigned(SAD_WIDTH - 1 downto 0);
    signal mux_soma_out_s      : unsigned(SAD_WIDTH - 1 downto 0);
    signal acumulador_out_s    : unsigned(SAD_WIDTH - 1 downto 0);

    signal register_i_out_s    : unsigned(ADDR_WIDTH downto 0);
    signal mux_i_out_s         : unsigned(ADDR_WIDTH downto 0);
    signal counter_i_out_s     : unsigned(ADDR_WIDTH downto 0);

    
begin
    -- Preencher aqui (remova este comentário).
    -- A arquitetura deve instanciar módulos para formar o datapath do SAD.
    -- Isso inclui, por exemplo:
    --   - subtratores
    --   - módulos de valor absoluto
    --   - acumuladores
    --   - registradores
    
    -- DICA: Melhor ainda do que instanciar diretamente os componentes listados acima,
    -- minha recomendação é a divisão do bloco operativo em dois submódulos, um que
    -- ficará responsável por calcular os endereços, e o outro que ficará responsável
    -- por calcular o valor da SAD.

        -- 1. Registradores
    ------------variáveis que são usadas para armazenar dados-----------------
    -- pA recebe bits_per_sample bits e devolve bits_per_sample 
    register_p_a: entity work.unsigned_register
        generic map(N => CFG.bits_per_sample)
        port map(
            reset  => reset,
            clk    => clk,
            enable => cpA,  -- cpA
            d      => block_a,
            q      => register_p_a_out_s -- ->abs_sub_a_b.input_a
        );

    -- pB recebe bits_per_sample bits e devolve bits_per_sample
    register_p_b: entity work.unsigned_register
        generic map(N => CFG.bits_per_sample)
        port map(
            reset  => reset,
            clk    => clk,
            enable => cpB, -- cpB
            d      => block_b,
            q      => register_p_b_out_s -- ->abs_sub_a_b.input_b
        );
    -- soma
    register_soma: entity work.unsigned_register
        generic map(N => SAD_WIDTH)
        port map(
            reset  => reset,
            clk    => clk,
            enable => csoma, -- csoma
            d      => mux_soma_out_s,
            q      => register_soma_out_s -- ->sad_reg.d e acumulator.input_b
        );

    -- SAD_reg
    sad_reg: entity work.unsigned_register
        generic map(N => SAD_WIDTH)
        port map(
            reset  => reset,
            clk    => clk,
            enable => csad_reg, -- csad_reg
            d      => register_soma_out_s,
            q      => register_out_sad_reg_s
        );

    -- i
    register_i: entity work.unsigned_register
        generic map(N => ADDR_WIDTH + 1)
        port map(
            reset  => reset,
            clk    => clk,
            enable => ci, -- cI
            d      => mux_i_out_s,
            q      => register_i_out_s
        );

    ------------operações que são realizadas-----------------
    --Cálculo do módulo da subtração de números de bits_per_sample bits (pA – pB)
    abs_sub_a_b: entity work.absolute_difference
        generic map(N => CFG.bits_per_sample + 1)
        port map(
            input_a  => resize(register_p_a_out_s, (CFG.bits_per_sample * CFG.parallel_samples) + 1), -- pA -- expande para 9 bits
            input_b  => resize(register_p_b_out_s, (CFG.bits_per_sample * CFG.parallel_samples) + 1), -- pB -- expande para 9 bits
            abs_diff => resize(abs_sub_a_b_out_s, (CFG.bits_per_sample * CFG.parallel_samples)) -- ->register_soma_in -- reduz saída para 8 bits
        );

    -- Uma adição de números de SAD_WIDTH bits (para acumular)
     acumulator: entity work.unsigned_adder
        generic map(N => SAD_WIDTH)
        port map(
            input_a => abs_sub_a_b_out_s, -- abs(pA - pB)
		    input_b => register_soma_out_s, 
		    sum     => acumulador_out_s -- soma
        );

    -- Uma adição de número de ADDR_WIDTH +1 bits (para incrementar variável ”i” - register_i)
    counter_i: entity work.unsigned_adder
        generic map(N => ADDR_WIDTH + 1)
        port map(
            input_a => register_i_out_s,
		    input_b => to_unsigned(1, ADDR_WIDTH + 1), -- soma 1 - to_unsigned(<valor_inteiro>, <número_de_bits>)
		    sum     => counter_i_out_s
        );
    
    -- Comparador para sinal "menor" - Teste =< samples_per_block 
    menor <= '1' when to_integer(register_i_out_s) < CFG.samples_per_block else '0';



    ------------transferências entre registradores-----------------
    -- soma <- 0; soma <- soma+ABS(pA-pB)(requer um mux2:1)
        mux_soma: entity work.mux_2to1
            generic map(N => SAD_WIDTH)
            port map(
                sel   => zSoma, -- zsoma
                in_0  => acumulador_out_s,
                in_1  => (OTHERS => '0'),
                y     => mux_soma_out_s -- ->register_soma_in
            );

    -- i ¬ 0 , i ¬ i + 1 (requer um mux2:1) e i < cont (teste)
        mux_i: entity work.mux_2to1
        generic map(N => ADDR_WIDTH + 1)
        port map(
            sel   => zi, -- zi
		    in_0  => counter_i_out_s,
            in_1  => (OTHERS => '0'),
		    y     => mux_i_out_s -- ->register_in_i
        );
   
        -- recebe um sinal de ADDR_WIDTH + 1 bits deve fazer resize um sinal de ADDR_WIDTH bits
        mem_address <= register_i_out_s(ADDR_WIDTH - 1 downto 0); -- end so datapath(log2(samples_per_block))
    -- 6. Saida do SAD
    sad_value <= register_out_sad_reg_s; -- saída com o valor acumulado final da SAD

end architecture structure;