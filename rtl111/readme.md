# Projeto SAD (Sum of Absolute Differences)

## Introdução

Este projeto implementa o circuito **SAD (Sum of Absolute Differences)** utilizando a linguagem de descrição de hardware **VHDL**. O circuito é responsável por calcular a soma das diferenças absolutas entre dois blocos de amostras, com suporte à parametrização por meio de generics.

Trata-se de um exercício da disciplina INE5406 – Sistemas Digitais, realizado em dupla e com foco em técnicas de paralelismo, controle sequencial e design parametrizável.

---

## Descrição do Projeto

O circuito SAD é composto por dois blocos principais:

- **BO (Bloco Operativo)**: realiza o cálculo das diferenças absolutas e soma parcial.
- **BC (Bloco de Controle)**: gerencia os sinais de controle e temporização via uma máquina de estados finita (FSM).
- **Top-Level**: instancia e interconecta os blocos BO e BC.

### Parametrização via Generic

Este projeto foi projetado de forma **parametrizável**, com uso obrigatório do generic:

- `bits_per_sample` – Define o número de bits utilizados para representar cada amostra.  
  ✅ **Este parâmetro foi implementado e testado.**

Outros generics utilizados incluem:

- `samples_per_block` – Número de amostras por bloco.
- `parallel_samples` – Número de amostras processadas em paralelo.

Essa parametrização permite adaptar o circuito para diferentes precisões e quantidades de dados sem modificar a estrutura interna dos componentes.

---

## Estrutura do Projeto

A organização do projeto segue a separação por componentes e pacotes reutilizáveis:
```
sad/
├── sad.vhdl                  # Módulo top-level: instancia e interconecta BO e BC
├── sad_bo.vhdl               # Bloco Operativo
├── sad_bc.vhdl               # Bloco de Controle
├── sad_pack.vhdl             # Pacote com funções utilitárias
├── absolute_difference.vhdl  # Módulo que calcula a diferença absoluta entre duas amostras
├── mux_2to1.vhdl             # Multiplexador 2 para 1
├── signed_subtractor.vhdl    # Subtrator com suporte a sinal
├── unsigned_adder.vhdl       # Somador genérico para inteiros sem sinal
├── unsigned_register.vhdl    # Registrador para armazenar valores intermediários
├── sad.qpf                   # Arquivo de projeto do Quartus (Project File)
├── sad.qsf                   # Arquivo de configuração do projeto Quartus
├── resultados.json           # Arquivo com resumo dos Resultados de síntese
└── README.md                 # Documentação do projeto

```

---

## Simulação e Verificação

A simulação foi realizada para verificar:

- Corretude do cálculo de diferenças absolutas
- Temporização dos sinais de controle
- Parametrização correta via generics

---

## Implementação no Quartus

### Ambiente

- **Sistema Operacional**: Ubuntu 16.04.1 LTS
- **Quartus**: Intel Quartus Prime (versão compatível)
- **Família FPGA**: Cyclone II
- **Dispositivo Alvo**: EP2C5AF256A7

### Utilização de Recursos

- **Funções combinacionais**: 51
- **Registradores lógicos dedicados**: 57
- **Total de pinos utilizados**: 41

### Desempenho

- **Fmax**: 164.02 MHz

---

## Dupla

| Nome Completo                             | Matrícula   |
|-------------------------------------------|-------------|
| Vitor Luiz Paz Roseno da Silva            | 20202147    |
| Carlos Benedito Hayden de Albuquerque Jr | 23100455    |

---

## Conclusão

O projeto SAD foi concluído com sucesso, atendendo aos requisitos de parametrização e organização modular. A utilização do `generic bits_per_sample` foi fundamental para garantir flexibilidade e reuso do código, permitindo adaptar o circuito para diferentes resoluções de amostras com facilidade.

A síntese no Quartus demonstrou um uso eficiente dos recursos da FPGA Cyclone II e desempenho satisfatório, alcançando mais de 160 MHz de Fmax. O projeto foi validado por simulações e preparado para implementação física.

---

## Possíveis Melhorias Futuras

- Adição de suporte a entrada serial (amostras via shift registers)
- Uso de pipeline no bloco operativo para maior throughput
- Interface com memória RAM externa para processar blocos maiores

---

## 📄 Licença

Projeto acadêmico – uso restrito à disciplina INE5406 – UFSC.
