#include <stdio.h>

// prototype de la routine assembleur

void calc_sum(int, int *) __attribute__((cdecl));

int main(void)
{
  int n, sum;
  printf("Somme des entiers jusqu'à : ");
  scanf("%d", &n);
  calc_sum(n, &sum);
  printf("La somme des entiers de 1 à %d est %d\n", n, sum);
  return 0;
}