; char *ft_strdup(const char *s); man 3 strdup
;   ◦ rdi -> const char *s

section .text

global ft_strdup
extern ft_strlen
extern malloc
extern ft_strcpy

ft_strdup:
    call ft_strlen
    mov r15, rdi
    mov rdi, rax
    inc rdi
    call malloc ; check NULL
    mov rdi, rax
    mov rsi, r15
    call ft_strcpy
    ret
