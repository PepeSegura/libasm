; int     ft_isspace(int c); man 3 isspace
;   ◦ rdi -> int    c

section .text

global ft_isspace

ft_isspace:
    mov rax, 1
    cmp byte rdi, 8     ; '\b'
    je .true
    cmp byte rdi, 9     ; '\t'
    je .true
    cmp byte rdi, 10    ; '\n'
    je .true
    cmp byte rdi, 11    ; '\v'
    je .true
    cmp byte rdi, 12    ; '\f'
    je .true
    cmp byte rdi, 32    ; ' '
    je .true
    mov rax, 0

    .true:
        ret