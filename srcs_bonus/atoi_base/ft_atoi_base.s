global check_base
section .text
extern ft_strlen

check_base:
    .prologe:
        push r14        ; i = 0
        push r15        ; j = 0
        push rbx

    .init_vars:
        xor rax, rax
        mov r14, -1    ; i = 0
        xor r15, r15    ; j = i
    
    .outer_loop:
        inc r14
        cmp byte [rsi+r14], 0
        je .return
        jmp .check_invalid_chars
        .continue:
        mov r15, r14    ; j = i
        inc r15         ; j = j + 1
        .inner_loop:
            cmp byte [rsi+r15], 0
            je .outer_loop
            movzx rbx, byte [rsi+r15]
            movzx rcx, byte [rsi+r14]
            cmp rbx, rcx
            je .error
            inc r15
            jmp .inner_loop

    .error:
        mov rax, -1
        jmp .return

    .return:
        pop rbx
        pop r15
        pop r14
        ret

    .check_invalid_chars:
        cmp byte [rsi+r14], 8  ; '\b'
        je .error
        cmp byte [rsi+r14], 9  ; '\t'
        je .error
        cmp byte [rsi+r14], 10 ; '\n'
        je .error
        cmp byte [rsi+r14], 11 ; '\v'
        je .error
        cmp byte [rsi+r14], 12 ; '\f'
        je .error
        cmp byte [rsi+r14], 32 ; ' '
        je .error
        cmp byte [rsi+r14], 43 ; '+'
        je .error
        cmp byte [rsi+r14], 45 ; '-'
        je .error
        jmp .continue


; int     ft_atoi_base(char *str, char *base); (C Piscine C 04 : ex05)
;   ◦ rdi -> char   *str
;   ◦ rsi -> char   *base

global ft_atoi_base
section .text
extern ft_strlen
extern ft_isspace

ft_atoi_base:

    .init_vars:
        mov rax, 0  ; change to xor rax, rax
        mov rdx, -1
    
    call check_base
    test rax, rax   ; check if rax is negative and set rax to 0
    js .error
    ; ret

    .skip_spaces:
        xor rax, rax
        inc rdx
        cmp byte [rdi+rdx], 0
        je .check_symbol
        call ft_isspace
        cmp rax, 1
        je .skip_spaces

    .check_symbol:
        cmp byte [rdi+rdx], 45 ; '-'
        je .found_minus
        cmp byte [rdi+rdx], 43 ; '+'
        je .found_plus
    
    .found_minus:
        mov var, -1
    .found_plus:
        inc rdx

    .error:
        mov rax, 0  ; set rax to 0 if there was any errors
        ret
