; char *strcpy(char *dest, const char *src); (man 3 strcpy)
;   ◦ rdi -> char       *dest
;   ◦ rsi -> const char *src

section .text

global ft_strcpy

ft_strcpy:
    xor rax, rax
    .loop:
        cmp byte [rsi+rax], 0
        je .return

    .copy:
        mov r15, [rsi+rax]  ;copy rsi+rax to aux register
        mov [rdi+rax], r15  ;copy aux register to rdi+rax -> dest byte -> rdi[rax] = aux

        inc rax
        jmp .loop


    .return:
        mov byte [rdi+rax], 0
        mov rax, rdi
        ret