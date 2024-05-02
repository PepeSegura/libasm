#include <stdio.h>

int ft_strcmp(const char *s1, const char *s2)
{
    int i = 0;

    while (s1[i] && s1[i] == s2[i])
        i++;
    return (s1[i] - s2[i]);
}

int main(int argc, char **argv)
{
    char *str = argv[1];
    printf("char: %c\n", *str);
    if (argc == 3)
        printf("s1: [%s] s2: [%s] ret: [%d]\n", argv[1], argv[2], ft_strcmp(argv[1], argv[2]));
}
