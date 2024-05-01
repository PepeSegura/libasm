// #include "inc/libasm.h"
#include <stdio.h>

size_t ft_strlen(const char *s);

int main(void)
{
    const char *input[] = {
        "hola",
        "que",
        "tal",
        "",
        NULL,
    };

    for (int i = 0; input[i]; i++)
    {
        printf("Text: [%s]\tLen: [%ld]\n", input[i], ft_strlen(input[i]));
    }
    return (0);
}
