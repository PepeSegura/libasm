section .text

global ft_read
extern __errno_location	

ft_read:
    mov rax, 0
    syscall
;     jc .error
    ret

; .error:
;     mov r15, rax    ; save errno
;     call __errno_location	   ; retrieve address to errno
;     mov [rax], r15  ; put errno in return value of __error (pointer to errno)
;     mov rax, -1
;     ret

