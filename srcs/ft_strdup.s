; char *ft_strdup(const char *s); man 3 strdup
;   ◦ rdi -> const char *s

section .text

global ft_strdup
extern ft_strlen
extern malloc
extern ft_strcpy

ft_strdup:
    .prologe:
        push r15

    call ft_strlen
    mov r15, rdi
    mov rdi, rax
    inc rdi
    call malloc wrt ..plt
    cmp rax , 0
    je .return
    mov rdi, rax
    mov rsi, r15
    call ft_strcpy

    .epiloge:
        pop r15

    .return:
        ret
