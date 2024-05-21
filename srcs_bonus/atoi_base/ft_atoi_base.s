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
        cmp byte [rsi+r14], 43 ; '+'
        je .error
        cmp byte [rsi+r14], 45 ; '+'
        je .error
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

    .return:
        pop rbx
        pop r15
        pop r14
        ret

    .error:
        mov rax, -1
        jmp .return

    .check_invalid_chars:
        cmp rdi, 8  ; '\b'
        je .error
        cmp rdi, 9  ; '\t'
        je .error
        cmp rdi, 10 ; '\n'
        je .error
        cmp rdi, 11 ; '\v'
        je .error
        cmp rdi, 12 ; '\f'
        je .error
        cmp rdi, 32 ; ' '
        je .error
        cmp rdi, 43 ; '+'
        je .error
        cmp rdi, 45 ; '-'
        je .error
        jmp .continue

; int     ft_atoi_base(char *str, char *base); (C Piscine C 04 : ex05)
;   ◦ rdi -> char   *str
;   ◦ rsi -> char   *base

global ft_atoi_base
section .text
extern ft_strlen

ft_atoi_base:
    .init_vars:
        mov rax, 0  ; change to xor rax, rax
    
    call check_base
    ; ret
    test rax, rax   ; check if rax is negative and set rax to 0
    js .error
    mov rax, 42
    ret

    .error:
        mov rax, 0  ; set rax to 0 if there was any errors
        ret
