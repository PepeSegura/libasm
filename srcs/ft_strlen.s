global ft_strlen

ft_strlen:
    ;prologue
    push  rbp
    mov rbp, rsp
    sub rsp, 8 ; Allocate 8-bytes for a size_t

    ; Assign values
    mov rdi, [ebp-8]
    mov rax, 0 ; int len = 0
    mov rcx, 0 ; int i = 0
    
    .loop:
        cmp byte [rdi+rcx], 0 ; compare byte with ascii char (0) \0
        je .end
        inc rcx
        jmp .loop
    
    .end:
        mov [rbp-8], rax

    ; epilogue
    add rsp, 8
    mov rsp, rbp
    pop rbp
    ret
