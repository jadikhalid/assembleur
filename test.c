#include <stdio.h>

static unsigned char byte_bit_count[256]; /* tableau de recherche */

void initialize_count_bits()
{
    int cnt, i, data;

    for (i = 0; i < 256; i++)
    {
        cnt = 0;
        data = i;
        while (data != 0)
        { /* methode une */
            data = data & (data - 1);
            cnt++;
        }
        byte_bit_count[i] = cnt;
    }
}

int count_bits(unsigned int data)
{
    const unsigned char *byte = (unsigned char *)&data;

    return byte_bit_count[byte[0]] + byte_bit_count[byte[1]] +
           byte_bit_count[byte[2]] + byte_bit_count[byte[3]];
}
int main(void)
{
    initialize_count_bits();
    unsigned int data = 22;
    int result = count_bits(data);
    printf("Nombre de bit : %d\n", result);

    return 0;
}