.data
A:
    .long   10, 8, 9
.text
.global main
main:
    mov A@GOTPCREL(%rip),%rax
    mov (%rax),%ebx
    add $4,%rax
    mov (%rax),%ecx
    add $4,%rax
    mov (%rax),%edx
    ret
