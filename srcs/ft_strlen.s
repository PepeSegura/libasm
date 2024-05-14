; size_t strlen(const char *s); (man 3 strlen)
;   ◦ rdi -> const char *s

global ft_strlen

ft_strlen:

    .init_vars:
        xor rax, rax            ; int len = 0

    .loop:
        cmp byte [rdi+rax], 0   ; compare byte with ascii char (0) \0
        je .return              ; jump if equal/zero
        inc rax                 ; increment by 1
        jmp .loop               ; jump always
    
    .return:
       ret
