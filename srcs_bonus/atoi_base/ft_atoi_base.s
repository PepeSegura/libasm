global check_base
section .text
extern ft_strlen

check_base:
    xor rax, rax
    mov rdi, rsi
    call ft_strlen
    ; ret
    cmp rax, 2
    jl .error

    .error:
        mov rax, -1

    ret

; int     ft_atoi_base(char *str, char *base); (C Piscine C 04 : ex05)
;   ◦ rdi -> char   *str
;   ◦ rsi -> char   *base

global ft_atoi_base
section .text
extern ft_strlen

ft_atoi_base:
    .init_vars:
        mov rax, 1  ; change to xor rax, rax
    
    call check_base
    ; ret
    test rax, rax   ; check if rax is negative and set rax to 0
    js .error

    .error:
        mov rax, -10  ; set rax to 0 if there was any errors

    ret
