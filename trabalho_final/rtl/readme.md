# Projeto VHDL: Matriz Transposta Sequencial

## Introdução

Este projeto em VHDL implementa uma arquitetura digital para realizar a transposição de uma matriz quadrada de forma **sequencial**, utilizando uma **Máquina de Estados Finitos (FSM)** para controle. O objetivo é ler os dados de uma matriz de entrada, calcular sua transposta e disponibilizá-la de forma sequencial na saída.

O circuito é totalmente **parametrizável** via `generic`, permitindo definir a **ordem da matriz** (`matrix_order`) e o número de **bits por elemento** (`bits_per_element`).

---

## Descrição do Projeto

A transposição de uma matriz quadrada envolve trocar as linhas pelas colunas, isto é:
```plaintext
Entrada:        Saída:
[ a b c ]     [ a d g ]
[ d e f ] =>  [ b e h ]
[ g h i ]     [ c f i ]
```

No projeto, os dados são lidos sequencialmente, armazenados em memória interna e, após o carregamento completo, a FSM passa para o estado de escrita da transposta, também feita sequencialmente.

### Parametrização

Os principais parâmetros estão definidos no pacote `matrix_pack.vhdl`:
- `matrix_order` (ex: 3) — Define a ordem da matriz (n × n).
- `bits_per_element` (ex: 8) — Número de bits de cada elemento da matriz.

---

## Estrutura do Projeto
```plaintext
matrix_transpose/
├── matrix_pack.vhdl # Pacote com tipos e parâmetros globais
├── transpose_bo.vhdl # Bloco Operativo (Datapath)
├── transpose_bc.vhdl # Bloco de Controle (FSM)
├── toplevel.vhdl # Módulo Top-Level
├── resultados.json # Arquivo com resumo dos Resultados de síntese
└── README.md # Este arquivo
``` 

### Módulos

- **`matrix_pack.vhdl`**: Define tipos auxiliares como `matrix_t` e funções úteis (ex: `index_to_coords`).
- **`transpose_bo.vhdl`**: Implementa o armazenamento da matriz, a lógica de leitura/escrita e acesso sequencial à transposta.
- **`transpose_bc.vhdl`**: FSM com estados `IDLE`, `READING`, `TRANSPOSE`, `DONE`, controlando o fluxo do sistema.
- **`toplevel.vhdl`**: Instancia e conecta o bloco de controle e o bloco operativo, formando o top-level.

---

<img src="../../assets/diagram.png" width=400><br><sub>Diagrama 01</sub>

---

## Como Utilizar

### Simulação

1. Configure o projeto no Quartus ou ModelSim.
2. Compile todos os arquivos do projeto (`matrix_pack`, `transpose_bo`, `transpose_bc`, `transpose`).
3. Forneça os dados da matriz de entrada um por um, com `valid_in = '1'`.
4. Aguarde o sinal `done = '1'` para indicar que a transposta está disponível.
5. Leia os dados da transposta com `valid_out = '1'`.

### Entradas e Saídas

#### Entradas:
- `clk` — Clock do sistema.
- `rst_a` — Reset assíncrono.
- `enable` — Início do processo.
- `data_in` — Entrada sequencial dos dados da matriz.
- `valid_in` — Indica que `data_in` é válido.

#### Saídas:
- `data_out` — Saída sequencial dos dados da transposta.
- `valid_out` — Indica que `data_out` é válido.
- `done` — Indica o fim do processamento.

---

##  Exemplo de Uso

Para `matrix_order = 3`, forneça os 9 elementos da matriz de entrada na ordem linha por linha. O circuito armazenará os dados e, após o processamento, fornecerá os elementos da transposta na saída, coluna por coluna.

---

## Considerações Finais

- O circuito é **flexível e reutilizável** para qualquer tamanho de matriz quadrada.
- A divisão clara entre bloco operativo e bloco de controle favorece a manutenção e entendimento.
- Arquitetura sequencial adequada para ambientes com restrições de área.

---

## 👨‍💻 Desenvolvedores

Projeto realizado como parte da disciplina **INE5406 - Organização de Computadores**, UFSC.



