global ft_strlen

ft_strlen:

    .init_vars:
        mov rax, 0 ; int len = 0

    .loop:
        cmp byte [rdi+rax], 0   ; compare byte with ascii char (0) \0
        je .return              ; jump if equal/zero
        inc rax                 ; increment by 1
        jmp .loop               ; jump always
    
    .return:
       ret
