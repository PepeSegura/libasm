; RAX -> system call number
; RDI -> first argument
; RSI -> second argument
; RDX -> third argument
; R10 -> fourth argument
; R8 -> fifth argument
; R9 -> sixth argument

; Data section: declare global vars
section .data
msg: DB 'Hello World!', 10
msgSize: EQU $ - msg

global _start

; Text section is where the actual code is implemented.
section .text

    _start:
    ;   ssize_t write(int fd, const void *buf, size_t count)
        mov rax, 1
        mov rdi, 1
        mov rsi, msg
        mov rdx, msgSize
        syscall

    ;   exit(result)
        mov rax, 60
        mov rdi, 0
        syscall
