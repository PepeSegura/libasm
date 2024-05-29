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

    .prologe:
        push rbp        ; save old base pointer
        mov rbp, rsp    ; set new base pointer to the current stack pointer
        sub rsp, 40     ; Allocate 40 bytes for local variables

    .init_vars:
        ; mov dword [rsp - 4], 0  ; int i = 0 used to move the string
        ; mov dword [rsp - 8], 0  ; int total = 0 -> return (sign * total)
        ; mov dword [rsp - 12], 1 ; int sign = 0 -> return (sign * total)
        ; mov dword [rsp - 16], 1 ; int len_base = 0 -> total = total * len_base;
        mov rax, 0              ; change to xor rax, rax
        mov rdx, -1
    
    call check_base
    test rax, rax   ; check if rax is negative and set rax to 0
    js .error

    .skip_spaces:
        xor rax, rax        ; rax used to check return from isspace
        inc rdx
        cmp byte [rdi+rdx], 0
        je .return          ; return if everything is space
        call ft_isspace
        cmp rax, 1          ; check if [rdi+rdx] isspace
        je .skip_spaces
        jmp .check_symbol   ; if not space go to next (can remove it)

    .check_symbol:
        cmp byte [rdi+rdx], 45 ; '-'
        je .found_minus
        cmp byte [rdi+rdx], 43 ; '+'
        je .found_plus
        jmp .final_loop
    
    .found_minus:
        mov dword [rsp - 4], -1   ; set sign to negative
    .found_plus:
        inc rdx

    .final_loop:
        ; TODO
        jmp .return

    .error:
        mov rax, 0  ; set rax to 0 if there was any errors
        jmp .return

    .return:
        mov rsp, rbp
        pop rbp
        ; add rsp, 40
        ret
