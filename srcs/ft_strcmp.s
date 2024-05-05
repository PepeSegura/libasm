global ft_strcmp

ft_strcmp:

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
        ret

    .return:
        ret             ; return(rax)

