
# VHDLCodes
Codes in VHDL for FPGA



<h1 align="center"> My first steps in VHDL </h1>



<p align="center">
<img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/>
</p>

# Description

English

Project under development for the discipline of Digital Circuits and Techniques at the Federal University of Santa Catarina (UFSC).
It deals with concepts and applications of basic synthesis.
The codes are indicating the necessary changes to be used with FPGA. They are commented, just remove the comment to be used and comment the corresponding part.


These are codes used in hierarchical VHDL designs.
The "somador" file uses a half adder from the "halfadder" file and the full adder from the "fulladder" file to perform the sum of a 4-bit binary word.
The "mult3" file uses the "somador" file to multiply a 4-bit input value by 3.



Português-Br

Projeto em desenvolvimento para a disciplina de Circuitos e Técnicas Digitais da Universidade Federal de Santa Catarina (UFSC).
Trata-se de conceitos e aplicações de sinteses básicas.
Os códigos estão indicando as alterações necessárias para ser utilizado com FPGA. Os mesmos encontran-se comentados, bastantando retirar o comentário para ser utilizado e comentar a parte correspondente.


Entender o uso de atribuições condicionais (usando estruturas when/else) para facilitar o projeto de circuitos em VHDL.
• Trabalhar os conceitos de multiplexador e decodificador.
• Implementar multiplexadores e decodificadores em VHDL
utilizando atribuições condicionais visando fixar os conceitos estudados.Tem-se Circuito1 implementado diretamente no topo.vhd para obtermos o valor da operação.
Implementou-se um multiplexador 4:1 de 4 bits que passará o valor de acordo com a operação selecionada (Control) para a entrada B do somador, este por sua vez, recebe este valor e o valor do operando A e sua saida é passada para o circuito Dec7seg que ira converter os valores para serem apresentados no display de 7 segmentos. Utilizou-se, também, Leds para apresentar a saida do somador como forma auxiliar.





# Author

| [<img src="https://avatars.githubusercontent.com/u/79289647?v=4" width=115><br><sub>Carlos Hayden</sub>](https://github.com/JunhaumHayden) |
| :---: |
