#include <stdio.h>

int count_bits(unsigned int data)
{
    int cnt = 0;

    while (data != 0)
    {
        data = data & (data - 1);
        cnt++;
    }
    return cnt;
}

int main(void)
{
    unsigned int data = 22;
    int result = count_bits(data);
    printf("Nombre de bit : %d\n", result);

    return 0;
}