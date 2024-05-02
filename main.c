// #include "inc/libasm.h"
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

size_t  ft_strlen(const char *s);
int     ft_strcmp(const char *s1, const char *s2);

// size_t ft_strlen(const char *s)
// {
//     size_t i = 0;
//     while (s[i])
//     {
//         i++;
//     }
//     return (i);
// }

int main(void)
{
    const char *input[] = {
        "Hola",
        "hola",
        "tal",
        "",
        NULL,
    };

    // for (int i = 0; input[i]; i++)
    // {
    //     printf("Text: [%s]\tLen: [%ld]\n", input[i], ft_strlen(input[i]));
    // }

    printf("ret: %d\n", ft_strcmp(input[0], input[1]));
    return (0);
}
