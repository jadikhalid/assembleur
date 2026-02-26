#include <stdio.h>
void calc_sum(int n, int *sump)
{
  int i, sum = 0;
  for (i = 1; i <= n; i++)
    sum += i;
  *sump = sum;
}

int main()
{
  int resultat = 0;
  calc_sum(10, &resultat); // Calcule la somme de 1 à 10
  printf("La somme est : %d\n", resultat);
  return 0;
}