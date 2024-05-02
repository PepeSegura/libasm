#include <stdio.h>

int     ft_strcmp(const char *s1, const char *s2);

int main(int argc, char **argv)
{
    const char *s1 = argv[1];
    const char *s2 = argv[2];
    printf("s1: [%s] s2: [%s] dif: [%d]\n", s1, s2, ft_strcmp(s1, s2));
}