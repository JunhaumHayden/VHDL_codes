FSM Pedra-Papel-Tesoura
Neste quinto exercício de VHDL você irá descrever uma máquina de estados finitos (FSM) que simula uma partida de Pedra-Papel-Tesoura. 

Assuma que a partida é sequencial (cada jogador vai jogar em sua vez, sem que o outro veja sua jogada), que existe uma interface que permite aos jogadores escolherem a jogada (entre pedra, papel e tesoura) e que a interface também apresenta um botão que permite ao jogador sinalizar quando sua jogada está pronta. Tal botão, quando pressionado, gera o sinal "ok" durante tempo suficiente para ser capturado por uma e apenas uma borda de subida do relógio. 

Assim, a FSM que será projetada terá os seguintes sinais de entrada:

clk - Sinal de clock;
rst_a - Sinal de reset assíncrono (ativo alto);
ok - Sinal de que a jogada foi feita;
play - a jogada em si, que pode ser: 
Valores para o sinal play
Código	Significado
00	Inválido (nenhuma jogada)
01	Tesoura
10	Pedra
11	Papel
Ainda, a FSM terá um sinal de saída chamado de winner, que representa quem foi o vencedor da partida. O sinal winner pode ser:

Valores para o sinal winner
Código	Significado
00	Não decidido (partida ainda em curso)
01	Jogador 1 vence
02	Jogador 2 vence
11	Empate (ambos fizeram a mesma jogada)
Considerando os sinais apresentados, nossa FSM pode ser modelada como a seguinte entidade, nomeada de fsm_rps:



O comportamento da FSM deverá modelar a partida de Pedra-Papel-Tesoura entre 2 jogadores, conforme descrito no início, considerando as regras da partida, resumidas na imagem abaixo:



Para chegarmos no comportamento esperado, definimos o seguinte diagrama de estados: 



Sua tarefa será implementar, em VHDL, o diagrama de estados apresentado na figura acima. Note que você já tem disponível a entidade e, portanto, deve apenas implementar a arquitetura. A arquitetura deve ter os seguintes estados:

Estados da FSM e seu significado
Estado	Significado
WAIT_P1	Esperando a jogada do Jogador 1
SC_WAIT_P2  	Esperando a jogada do Jogador 2 após o Jogador 1 ter jogado "tesoura"
RO_WAIT_P2	Esperando a jogada do Jogador 2 após o Jogador 1 ter jogado "pedra"
PA_WAIT_P2	Esperando a jogada do Jogador 2 após o Jogador 1 ter jogado "papel"
P1_WINS	Jogador 1 ganhou a partida
DRAW	A partida empatou (não houve ganhador, ambos jogaram o mesmo)
P2_WINS	Jogador 2 ganhou a partida
Vocês podem usar outros nomes para os estados, desde que mantenham a mesma funcionalidade da arquitetura. Ainda assim, sugiro que usem os mesmos nomes propostos para ajudar na descrição. 

A saída (winner) deve dependente apenas de estado (logo, você fará a descrição de uma FSM de Moore). Os valores devem ser atribuídos de acordo com o significado de cada estado e o significado de cada valor de saída, que estão apresentados nas tabelas apresentadas acima. 