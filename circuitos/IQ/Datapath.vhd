library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all; -- necessário para o +

entity datapath is
port(
    	-- Entradas de dados
    	clk: in std_logic;
    	SW: in std_logic_vector(17 downto 0);
    	
    	-- Entradas de controle
    	R1, R2, E1, E2, E3, E4, E5: in std_logic;
    	
    	-- Saídas de dados
    	hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7: out std_logic_vector(6 downto 0);
    	ledr: out std_logic_vector(15 downto 0);
    	
    	-- Saídas de status
    	end_game, end_time, end_round, end_FPGA: out std_logic
    );
end entity;

architecture arc of datapath is
---------------------------SIGNALS-----------------------------------------------------------
    --contadores
    signal tempo, X: std_logic_vector(3 downto 0);
    --FSM_clock
    signal CLK_1Hz, CLK_050Hz, CLK_033Hz, CLK_025Hz, CLK_020Hz: std_logic;
    --Logica combinacional
    signal RESULT: std_logic_vector(7 downto 0);
    --Registradores
    signal SEL, SW_sel: std_logic_vector(3 downto 0);
    signal USER, SW_user: std_logic_vector(14 downto 0);
    signal Bonus, Bonus_reg: std_logic_vector(3 downto 0);
    --ROMs
    signal CODE_aux: std_logic_vector(14 downto 0);
    signal CODE: std_logic_vector(31 downto 0);
    --COMP
    signal erro: std_logic;
    --NOR enables displays
    signal E23, E25, E12: std_logic;
	
	
	

--signals implícitos--

    --dec termometrico
    signal stermoround, stermobonus, andtermo: std_logic_vector(15 downto 0);
    --decoders HEX 7-0
    signal sdecod7, sdec7, sdecod6, sdec6, sdecod5, sdecod4, sdec4, sdecod3, sdecod2, sdec2, sdecod1, sdecod0, sdec0, aba: std_logic_vector(6 downto 0);
    signal smuxhex7, smuxhex6, smuxhex5, smuxhex4, smuxhex3, smuxhex2, smuxhex1, smuxhex0: std_logic_vector(6 downto 0);
    signal edec2, edec0: std_logic_vector(3 downto 0);
    --saida ROMs
    signal srom0, srom1, srom2, srom3: std_logic_vector(31 downto 0);
    signal srom0a, srom1a, srom2a, srom3a: std_logic_vector(14 downto 0);
    --FSM_clock
    signal E2orE3: std_logic;
   

---------------------------COMPONENTS-----------------------------------------------------------
component counter_time is 
port(
        R, E, clock: in std_logic;
        Q: out std_logic_vector(3 downto 0);
        tc: out std_logic
    );
end component;

component counter_round is
port(
        R, E, clock: in std_logic;
        Q: out std_logic_vector(3 downto 0);
        tc: out std_logic
    );
end component;

component decoder_termometrico is
 port(
    	X: in  std_logic_vector(3 downto 0);
    	S: out std_logic_vector(15 downto 0)
     );
end component;

component FSM_clock_de2 is
port(
    	reset, E: in std_logic;
    	clock: in std_logic;
    	CLK_1Hz, CLK_050Hz, CLK_033Hz, CLK_025Hz, CLK_020Hz: out std_logic
    );
end component;

component FSM_clock_emu is
port(
    	reset, E: in std_logic;
    	clock: in std_logic;
    	CLK_1Hz, CLK_050Hz, CLK_033Hz, CLK_025Hz, CLK_020Hz: out std_logic
    );
end component;

component decod7seg is
port(
	C: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(6 downto 0)
 );
end component;

component d_code is
port(
	C: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(6 downto 0)
 );
end component;

component mux2x1_7bits is
port(
	E0, E1: in std_logic_vector(6 downto 0);
	sel: in std_logic;
	saida: out std_logic_vector(6 downto 0)
);
end component;

component mux2x1_16bits is
port(
	E0, E1: in std_logic_vector(15 downto 0);
	sel: in std_logic;
	saida: out std_logic_vector(15 downto 0)
);
end component;

component mux4x1_1bit is
port(
	E0, E1, E2, E3: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	saida: out std_logic
);
end component;

component mux4x1_15bits is
port(
	E0, E1, E2, E3: in std_logic_vector(14 downto 0);
	sel: in std_logic_vector(1 downto 0);
	saida: out std_logic_vector(14 downto 0)
);
end component;

component mux4x1_32bits is
port(
	E0, E1, E2, E3: in std_logic_vector(31 downto 0);
	sel: in std_logic_vector(1 downto 0);
	saida: out std_logic_vector(31 downto 0)
);
end component;

component registrador_sel is 
port(
	R, E, clock: in std_logic;
	D: in std_logic_vector(3 downto 0);
	Q: out std_logic_vector(3 downto 0) 
);
end component;

component registrador_user is 
port(
	R, E, clock: in std_logic;
	D: in std_logic_vector(14 downto 0);
	Q: out std_logic_vector(14 downto 0) 
);
end component;

component registrador_bonus is 
port(
	S, E, clock: in std_logic;
	D: in std_logic_vector(3 downto 0);
	Q: out std_logic_vector(3 downto 0) 
);
end component;

component COMP_erro is
port(
	E0, E1: in std_logic_vector(14 downto 0);
	diferente: out std_logic
);
end component;

component COMP_end is
port(
	E0: in std_logic_vector(3 downto 0);
	endgame: out std_logic
);
end component;

component subtracao is
port(
	E0: in std_logic_vector(3 downto 0);
	E1: in std_logic;
	resultado: out std_logic_vector(3 downto 0)
);
end component;

component logica is 
port(
	round, bonus: in std_logic_vector(3 downto 0);
	nivel: in std_logic_vector(1 downto 0);
	points: out std_logic_vector(7 downto 0)
);
end component;

component ROM0 is
port(
	address: in std_logic_vector(3 downto 0);
	output : out std_logic_vector(31 downto 0)
);
end component;

component ROM1 is
port(
	address: in std_logic_vector(3 downto 0);
	output : out std_logic_vector(31 downto 0)
);
end component;

component ROM2 is
port(
	address: in std_logic_vector(3 downto 0);
	output : out std_logic_vector(31 downto 0)
);
end component;

component ROM3 is
port(
	address: in std_logic_vector(3 downto 0);
	output : out std_logic_vector(31 downto 0)
);
end component;

component ROM0a is
port(
	address: in std_logic_vector(3 downto 0);
	output : out std_logic_vector(14 downto 0)
);
end component;

component ROM1a is
port(
	address: in std_logic_vector(3 downto 0);
	output : out std_logic_vector(14 downto 0)
);
end component;

component ROM2a is
port(
	address: in std_logic_vector(3 downto 0);
	output : out std_logic_vector(14 downto 0)
);
end component;

component ROM3a is
port(
	address: in std_logic_vector(3 downto 0);
	output : out std_logic_vector(14 downto 0)
);
end component;

-- COMECO DO CODIGO ---------------------------------------------------------------------------------------

begin	

   -- declaracao port maps
   
        --CONTADOR
count_time: counter_time port map (R1, E3, CLK_1Hz, tempo, end_time);
count_round: counter_round port map (R2, E4, CLK_050Hz, X, end_round);

		--REGISTRADOR
reg_sel: registrador_sel port map(R2, E1, clk, SW_sel, SEL);
reg_user: registrador_user port map(R2, E3, clk, SW_user, USER);
reg_bonus: registrador_bonus port map(R2, E4, clk, Bonus, Bonus_reg);


        --DECODIFICADOR
-- Decodificador termometrico para round - entra sinal X, saida Porta AND - 
dec_term_round: decoder_termometrico port map (X, stermoround);
dec_term_bonus: decoder_termometrico port map (Bonus_reg, stermobonus);

		--SUBTRACAO
SUB: subtracao port map(Bonus_reg, erro, Bonus);

		-- COMPARADOR ERRO
comp_igual:	COMP_erro port map(CODE_aux, USER, erro);

		-- COMPARADOR FIM DE BONUS
comp_bonus:	COMP_end port map(Bonus_reg, end_game);

		-- COMPARADOR ERRO
log_comb: logica port map(X, Bonus_reg, SEL(1 downto 0), RESULT);



        --DIVISOR FREQUENCIA
--FSM_Clock - Para FPGA--
--FSM_clock: FSM_clock_de2 port map (R1, E2 or E3, clk, CLK_1Hz, CLK_050Hz, CLK_033Hz, CLK_025Hz, CLK_020Hz);
--FSM_Clock - Para emulador--
FSM_clock: FSM_clock_emu port map (R1, E2orE3, clk, CLK_1Hz, CLK_050Hz, CLK_033Hz, CLK_025Hz, CLK_020Hz);
         
edec0 <= "00" & SEL(1 downto 0);
edec2 <= "00" & SEL(3 downto 2);
        --Dec7seg
dec_hex0_1: decod7seg port map (edec0, sdec0);
dec_hex2_1: decod7seg port map (edec2, sdec2);
dec_hex4_1: decod7seg port map (tempo, sdec4);
dec_hex6_1: decod7seg port map (RESULT(3 downto 0), sdec6);
dec_hex7_1: decod7seg port map (RESULT(7 downto 4), sdec7);

        --D_code
dec_hex0_2: d_code port map (srom0(3 downto 0), sdecod0);
dec_hex1_2: d_code port map (srom0(7 downto 4), sdecod1);
dec_hex2_2: d_code port map (srom0(11 downto 8), sdecod2);
dec_hex3_2: d_code port map (srom0(15 downto 12), sdecod3);
dec_hex4_2: d_code port map (srom0(19 downto 16), sdecod4);
dec_hex5_2: d_code port map (srom0(23 downto 20), sdecod5);
dec_hex6_2: d_code port map (srom0(27 downto 24), sdecod6);
dec_hex7_2: d_code port map (srom0(31 downto 28), sdecod7);

		--	MULTIPLEX
		--2x1 7 bits saida p/ or
mux_hex0: mux2x1_7bits port map(sdecod0, sdec0, E1, smuxhex0);
mux_hex1: mux2x1_7bits port map(sdecod1, "1000111", E1, smuxhex1); -- L
mux_hex2: mux2x1_7bits port map(sdecod2, sdec2, E1, smuxhex2);
mux_hex3: mux2x1_7bits port map(sdecod3, "1000110", E1, smuxhex3); -- C
mux_hex4: mux2x1_7bits port map(sdecod4, sdec4, E3, smuxhex4);
mux_hex5: mux2x1_7bits port map(sdecod5, "0000111", E3, smuxhex5); --t
mux_hex6: mux2x1_7bits port map(sdecod6, sdec6, E5, smuxhex6);
mux_hex7: mux2x1_7bits port map(sdecod7, sdec7, E5, smuxhex7);
		--2x1 16 bits saida leds
mux_LEDR: mux2x1_16bits port map(andtermo, stermobonus, SW(17), ledr);
		--4x1 1bit saida p/ Controle end_FPGA
mux_end_FPGA: mux4x1_1bit port map(CLK_050Hz, CLK_033Hz, CLK_025Hz, CLK_020Hz, SEL(1 downto 0), end_FPGA);
		--4x1 15bits saida p/ display
mux_code_aux: mux4x1_15bits port map(srom0a, srom1a, srom2a, srom3a, SEL(3 downto 2), CODE_aux);
		--4x1 32bits saida p/ comparar c/ entrada
mux_code: mux4x1_32bits port map(srom0, srom1, srom2, srom3, SEL(3 downto 2), CODE);

		-- ROMs
		--Principal saida p/ D_code
r_00: ROM0 port map (X, srom0);
r_01: ROM1 port map (X, srom1);
r_02: ROM2 port map (X, srom2);
r_03: ROM3 port map (X, srom3);
		--Aux saida p/ comparador
ra_00: ROM0a port map (X, srom0a);
ra_01: ROM1a port map (X, srom1a);
ra_02: ROM2a port map (X, srom2a);
ra_03: ROM3a port map (X, srom3a);


		--OR enables displays

hex0 <= smuxhex0 or (E12 & E12 & E12 & E12 & E12 & E12 & E12);
hex1 <= smuxhex1 or (E12 & E12 & E12 & E12 & E12 & E12 & E12);
hex2 <= smuxhex2 or (E12 & E12 & E12 & E12 & E12 & E12 & E12);
hex3 <= smuxhex3 or (E12 & E12 & E12 & E12 & E12 & E12 & E12);
hex4 <= smuxhex4 or (E23 & E23 & E23 & E23 & E23 & E23 & E23);
hex5 <= smuxhex5 or (E23 & E23 & E23 & E23 & E23 & E23 & E23);
hex6 <= smuxhex6 or (E25 & E25 & E25 & E25 & E25 & E25 & E25);
hex7 <= smuxhex7 or (E25 & E25 & E25 & E25 & E25 & E25 & E25);

andtermo <= stermoround and (not(E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1 & E1));

		--NOR enables displays
E12 <= not (E1 or E2);
E23 <= not (E2 or E3);
E25 <= not (E2 or E5);
		--OR enables clock
E2orE3 <= (E2 or E3);

		--ENTRADAS EXTERNAS
SW_user <= SW(14 downto 0);
SW_sel <= SW(3 downto 0); 

--Conexoes e atribuicoes a partir daqui. Dica: usar os mesmos nomes e I/O ja declarados nos components. Todos os signals necessarios ja estao declarados.

end arc;