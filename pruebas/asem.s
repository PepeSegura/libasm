.global         _start
.intel_syntax   noprefix

_start:
    # sys_write
    mov     rax, 1
    mov     rdi, 1
    lea     rsi, [hello_world]
    mov     rdx, 13
    syscall

    # sys_exit
    mov     rax, 60
    mov     rdi, 1
    syscall 

hello_world:
    .asciz "Hello World!\n"
