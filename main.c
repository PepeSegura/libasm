#include "inc/libasm.h"

#define TEST_STRLEN(x) printf("Text: [%-10s] STD: [%ld] ASM: [%ld]\n", x, strlen(x), ft_strlen(x))
#define TEST_STRCMP(a, b) printf("a: [%5s] b: [%5s]  STD: [%4d] ASM: [%4d]\n", a, b, strcmp(a, b), ft_strcmp(a, b))
#define TEST_WRITE(a, b, c) printf("STD: %ld ASM: %ld\n", write(a, b, c), ft_write(a, b, c))

#define UNDERLINE "\033[4m"
#define RESET "\033[0m"

#define PRINT_UNDERLINE(STR) printf("\n" UNDERLINE "     " STR "     " RESET "\n")

jmp_buf jump_buffer;

#if defined(STRLEN) || defined(TEST)
int test_strlen(void)
{
    PRINT_UNDERLINE("TEST STRLEN");

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
#endif

#if defined(STRCMP) || defined(TEST)
int test_strcmp(void)
{
    PRINT_UNDERLINE("TEST STRCM");

    TEST_STRCMP("A", "A");
    TEST_STRCMP("a", "A");
    TEST_STRCMP("A", "a");
    TEST_STRCMP("AA", "A");
    TEST_STRCMP("A", "AA");
    TEST_STRCMP("AAA", "B");
    return (0);
}
#endif

#if defined(READ) || defined(TEST)
int test_read(void)
{
    PRINT_UNDERLINE("TEST READ");

    static char buffer_std[256];
    static char buffer_asm[256];
    printf("STD: %ld -> [%s]\n", read(-1, buffer_std, 256), buffer_std);
    perror("STD");
    printf("erno: %d\n", errno);
    errno = 0;
    printf("ASM: %ld -> [%s]\n", ft_read(-1, buffer_asm, 256), buffer_asm);
    perror("ASM");
    printf("erno: %d\n", errno);
    return (0);
}
#endif

#if defined(STRCPY) || defined(TEST)
int test_strcpy(void)
{
    PRINT_UNDERLINE("TEST STRCPY");

    char dest_std[256];
    char dest_asm[256];
    printf("ASM: B: %p A: %p\n", dest_asm, ft_strcpy(dest_asm, "hola asm"));
    printf("STD: B: %p A: %p\n", dest_std, strcpy(dest_std, "hola std"));
    printf("ASM: [%s]\nSTD: [%s]\n", dest_asm, dest_std);
    return (0);
}
#endif

#if defined(STRDUP) || defined(TEST)
int test_strdup(void)
{
    PRINT_UNDERLINE("TEST STRDUP");

    {
        char *input = "Hola";
        printf("Duplicating text: [%s]\n", input);
        char *str_asm = ft_strdup(input);
        char *str_std = strdup(input);
        printf("ASM: [%s]\n", str_asm);
        printf("STD: [%s]\n", str_std);
        free(str_asm), free(str_std);
    }
    {
        char *input = "";
        printf("Duplicating text: [%s]\n", input);
        char *str_asm = ft_strdup(input);
        char *str_std = strdup(input);
        printf("ASM: [%s]\n", str_asm);
        printf("STD: [%s]\n", str_std);
        free(str_asm), free(str_std);
    }
    {
        char *input = NULL;
        printf("Duplicating text: [%s]\n", input);
        if (setjmp(jump_buffer) == 0)
        {
            char *str_asm = ft_strdup(input);
            free(str_asm);
        }
    }
    return (0);
}
#endif

#if defined(WRITE) || defined(TEST)
int test_write(void)
{
    PRINT_UNDERLINE("TEST WRITE");

    TEST_WRITE(1, "stdout\n", 7);
    TEST_WRITE(2, "stderr\n", 7);
    TEST_WRITE(-1, "stderr\n", 7);
    perror("write");
    return (0);
}
#endif

#if defined(ISSPACE) || defined(TEST)
int test_isspace(void)
{
    PRINT_UNDERLINE("TEST ISSPACE");

    int i = 7;

    while (++i < 14)
        printf("is [%d] - [%c] a space: [%d]\n", i, i, ft_isspace(i));
    i = 32;
    printf("is [%d] - [%c] a space: [%d]\n", i, i, ft_isspace(i));
    i = 47;
    while (++i < 60)
        printf("is [%d] - [%c] a space: [%d]\n", i, i, ft_isspace(i));

    printf("is [%d] - [%c] a space: [%d]\n", '\t', '\t', ft_isspace('\t'));
    return (0);
}
#endif

#if defined(ATOI) || defined(TEST)
int test_atoi(void)
{
    PRINT_UNDERLINE("TEST ATOI");

    char *inputs[] = {
        "acb",
        "acb",
        "acb",
        "acb",
        "acb",
        "10",
        "0",
        "-2147483648",
        "ABC",
        NULL,
    };

    char *bases[] = {
        "",
        "1",
        "ab\tc",
        "-abc",
        "aabc",
        "abcdefg",
        "0123456789",
        "0123456789acdef",
        "0123456789ABCDEF",
        NULL,
    };

    int i = -1;
    int result = 0;

    while (inputs[++i])
    {
        printf("Trying to convert: [[%s]] with base: [[%s]]\n", inputs[i], bases[i]);
        result = ft_atoi_base(inputs[i], bases[i]);
        if (result == 0)
            printf("   Potential error with the base: [[%s]] atoi_result = [%d]\n", bases[i], result);
        else
            printf("   Atoi_result: [%d]\n", result);
        printf("\n");
    }
    return (0);
}
#endif

void sigsegv_handler(int signal)
{
    printf("Caught segmentation fault (signal %d).\n", signal);
    longjmp(jump_buffer, 1);
}

int main(int argc, char **argv)
{
    signal(SIGSEGV, sigsegv_handler);

    #if defined(STRLEN) || defined(TEST)
        test_strlen();
    #endif
    #if defined(STRCMP) || defined(TEST)
        test_strcmp();
    #endif
    #if defined(READ) || defined(TEST)
        test_read();
    #endif
    #if defined(STRCPY) || defined(TEST)
        test_strcpy();
    #endif
    #if defined(STRDUP) || defined(TEST)
        test_strdup();
    #endif
    #if defined(WRITE) || defined(TEST)
        test_write();
    #endif
    #if defined(ISSPACE) || defined(TEST)
        test_isspace();
    #endif
    #if defined(ATOI) || defined(TEST)
        test_atoi();
    #endif
}
