// #include "inc/libasm.h"
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

typedef int (*FunctionType)(void);

size_t  ft_strlen(const char *s);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);

#define TEST_STRLEN(x) printf("Text: [%-10s] STD: [%ld] ASM: [%ld]\n", x, strlen(x), ft_strlen(x))
#define TEST_STRCMP(a, b) printf("a: [%5s] b: [%5s]  STD: [%4d] ASM: [%4d]\n", a, b, strcmp(a, b), ft_strcmp(a, b))
#define TEST_WRITE(a, b, c) printf("STD: %ld ASM: %ld\n", write(a, b, c), ft_write(a, b, c))

int test_strlen(void)
{
    printf("Test strlen\n");

    TEST_STRLEN("");
    TEST_STRLEN("1");
    TEST_STRLEN("22");
    TEST_STRLEN("333");
    TEST_STRLEN("4444");
    TEST_STRLEN("55555");
    TEST_STRLEN("666666");
    TEST_STRLEN("7777777");
    TEST_STRLEN("88888888");
    TEST_STRLEN("999999999");
    return (0);
}
int test_strcmp(void)
{
    printf("Test strcmp\n");

    TEST_STRCMP("A", "A");
    TEST_STRCMP("a", "A");
    TEST_STRCMP("A", "a");
    TEST_STRCMP("AA", "A");
    TEST_STRCMP("A", "AA");
    TEST_STRCMP("AAA", "B");
    return (0);
}
int test_read(void)
{
    char buffer_std[256];
    char buffer_asm[256];
    printf("Test read\n");
    // printf("STD: %ld -> %s", read(42, buffer_std, 256), buffer_std);
    printf("ASM: %ld -> %s", ft_read(42, buffer_asm, 256), buffer_asm);
    return (0);
}
int test_strcpy(void)
{
    printf("Test strcpy\n");
    return (0);
}
int test_strdup(void)
{
    printf("Test strdup\n");
    return (0);
}
int test_write(void)
{
    printf("Test write\n");
    TEST_WRITE(1, "stdout\n", 7);
    TEST_WRITE(2, "stderr\n", 7);
    return (0);
}

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        dprintf(2, "Invalid number of arguments\n");
        return (1);
    }
    const char *input[] = {
        "strlen",
        "strcmp",
        "read",
        "strcpy",
        "strdup",
        "write",
        NULL,
    };

    const FunctionType functions[] = {
        test_strlen,
        test_strcmp,
        test_read,
        test_strcpy,
        test_strdup,
        test_write,
        NULL
    };

    for (int i = 0; input[i]; i++)
    {
        if (strcmp(input[i], argv[1]) == 0)
        {
            functions[i]();
            exit (0);
        }
    }
    return (0);
}
