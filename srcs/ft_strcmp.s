global ft_strcmp

ft_strcmp:

    .init_vars:
        mov rax, 0
    
    .loop:
        cmp byte [rdi], 0
        je .return
        cmp byte [rsi], 0
        je .return

        movzx rax, byte [rdi]
        movzx rbx, byte [rsi]
        cmp rax, rbx
        jne .not_equal

        inc rdi
        inc rsi
        jmp .loop

    .not_equal:
        ; movzx rax, byte [rd]
        sub rax, rdi
        ret

    .return:
        ret             ; return(rax)
