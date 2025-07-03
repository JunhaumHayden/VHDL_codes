
Para ilustração e mantermos alinhado o comportamento da SAD. O Algoritmo que desejamos que seja executado é:

Início
pronto ¬ 0; soma ¬ 0; i ¬ 0; end ¬ 0;
Enquanto i<64 faça
{
pA ¬ Mem_A[end]; pB ¬ Mem_B[end];
soma ¬ soma + ABS(pA – pB); end ¬ end +1; i ¬ i +1;
}
SAD_reg ¬ soma;
pronto ¬ 1;
Fim