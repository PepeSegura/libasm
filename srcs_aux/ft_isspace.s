; int     ft_isspace(int c); man 3 isspace
;   ◦ rdi -> int    c

section .text

global ft_isspace

ft_isspace:
    mov rax, 1
    cmp rdi, 8  ; '\b'
    je .true
    cmp rdi, 9  ; '\t'
    je .true
    cmp rdi, 10 ; '\n'
    je .true
    cmp rdi, 11 ; '\v'
    je .true
    cmp rdi, 12 ; '\f'
    je .true
    cmp rdi, 32 ; ' '
    je .true
    cmp rdi, 43 ; '+'
    je .true
    cmp rdi, 45 ; '-'
    je .true
    mov rax, 0

    .true:
        ret