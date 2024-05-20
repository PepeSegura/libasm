#include <stdio.h>
#include <ctype.h>
#include <string.h>

int check_base(char *str)
{
    int i = 0;
    int j;

    while (str[i])
    {
        if (str[i] == '+' || str[i] == '-' || isspace(str[i]))
            return (1);
        j = i + 1;
        while (str[j])
        {
            if (str[i] == str[j])
                return 1;
            j++;
        }
        i++;
    }
    return (0);
}

int ft_atoi_base(char *str, char *base)
{
    (void)base;
    int i = 0;
    int sign = 1;
    int total = 0;
    if (check_base(base))
        return (0);
    int len_base = strlen(base);

    while(isspace(str[i]))
        i++;
    if (str[i] == '-' || str[i] == '+')
    {
        if (str[i++] == '-')
            sign = -1;
    }
    while (str[i])
    {
        total = total * len_base;
        total = total + (strchr(base, str[i]) - base);
        i++;
    }
    return (total * sign);
}

int main(void)
{
    printf("%d\n", ft_atoi_base("acb", "+abc"));
    printf("%d\n", ft_atoi_base("acb", "-abc"));
    printf("%d\n", ft_atoi_base("acb", "aabc"));
    printf("%d\n", ft_atoi_base("acb", "abcdefg"));
    printf("%d\n", ft_atoi_base("10", "0123456789"));
    printf("%d\n", ft_atoi_base("0", "0123456789ABCDEF"));
    printf("%d\n", ft_atoi_base("-2147483648", "0123456789ABCDEF"));
}