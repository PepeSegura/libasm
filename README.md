### How to compile
- as asem.s -o asem.o
- gcc -o asem asem.o -nostdlib -static

nasm -f elf64 hello.asm -o hola.o
ld -e _start hola.o && ./a.out

### Usefull links
- https://harm-smits.github.io/42docs/projects/libasm
- https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf
- https://www.inf.usi.ch/faculty/soule/teaching/2015-fall/cc/x64-intro.pdf
- 
- https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
- 
- https://cratecode.com/info/x86-assembly-nasm-stack
- https://www.youtube.com/watch?v=6S5KRJv-7RU
- https://cs.brown.edu/courses/csci1260/spring-2021/lectures/x86-64-assembly-language-reference.html
- https://web.stanford.edu/class/cs107/guide/x86-64.html
- 
