section .text

global ft_write
extern __errno_location

ft_write:

    mov rax, 1
    syscall
    test rax, rax
    js .error
    ret

.error:
    neg eax                 ; convert to positive
    mov edi, eax
    call __errno_location   ; retrieve address to errno
    mov [rax], edi          ; put errno in return value of __error (pointer to errno)
    mov rax, -1
    ret
