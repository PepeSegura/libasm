; ssize_t write(int fd, const void *buf, size_t count); (man 2 write)
;   ◦ rdi -> int    fd
;   ◦ rsi -> void   *buf
;   ◦ rdx -> size_t count

section .text

global ft_write
extern __errno_location

ft_write:
    mov rax, 1              ; write() syscall number
    syscall
    test rax, rax
    js .error
    ret

.error:
    neg eax                           ; convert to positive
    mov edi, eax
    call __errno_location wrt ..plt   ; retrieve address to errno
    mov [rax], edi                    ; put errno in return value of __error (pointer to errno)
    mov rax, -1
    ret
