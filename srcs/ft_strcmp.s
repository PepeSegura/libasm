; int strcmp(const char *s1, const char *s2); (man 3 strcmp)
;   ◦ rdi -> const char *s1
;   ◦ rsi -> const char *s2

global ft_strcmp

ft_strcmp:
    .prologe:
        push rbx

    .init_vars:
        xor rax, rax
    
    .loop:
        movzx rbx, byte [rdi]
        movzx rcx, byte [rsi]
        cmp rbx, rcx
        jne .not_equal

        cmp byte [rdi], 0
        je .return

        inc rdi
        inc rsi
        jmp .loop

    .not_equal:
        sub rbx, rcx
        mov rax, rbx

    .return:
        pop rbx
        ret             ; return(rax)
