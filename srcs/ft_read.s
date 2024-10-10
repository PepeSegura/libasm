; ssize_t read(int fd, void *buf, size_t count); (man 2 read)
;   ◦ rdi -> int    fd
;   ◦ rsi -> void   *buf
;   ◦ rdx -> size_t count

section .text

global ft_read
extern __errno_location	

ft_read:
    mov rax, 0              ; read() syscall number
    syscall
    test rax, rax           ; check if rax is negative
    js .error               ; jump if negative
    ret

.error:
    neg eax                           ; convert to positive
    mov edi, eax                      ; mov rax to an aux register
    call __errno_location wrt ..plt   ; retrieve address to errno
    mov [rax], edi                    ; put errno in return value of __error (pointer to errno)
    mov rax, -1
    ret


