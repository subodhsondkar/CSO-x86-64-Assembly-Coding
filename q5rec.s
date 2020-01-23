.data
N:                                                                                                                                                                                                     
    .long   10
        # Nth fibonacci number to be computed;
X:
    .long
        # Value of Nth fibonacci number;
.text
.global main
fibonacci:
    push    %rdi
        # Pushing old N;
    mov $0,%rcx
        # %rcx <-> 0;
    cmp %rdi,%rcx
        # Compare N & 0;
    je  ohif
    mov $1,%rcx
        # %rcx <-> 1;
    cmp %rdi,%rcx
    jne ohno
ohif:
    mov $1,%rax
        # Returning 1;
    ret
ohno:
    dec %rdi
        # N--;
    call fibonacci
        # fibonacci(N-1);
    mov %rax,%rbx
        # Temporary storage;
#    mov %r8,%rdi
        # N <-> %rdx;
    dec %rdi
        # N--;
    call fibonacci
        # fibonacci(N-2);
    add %rbx,%rax
        # fibonacci(N-1) + fibonacci(N-2);
    pop %rdi
        # popping old N;
    ret
main:
    mov N@GOTPCREL(%rip),%rcx
        # addr(N) <-> %rcx;
    mov (%rcx),%edx
        # Temporary storage of N;
    mov %rdx,%r8
        # N <-> %r8;
    mov %r8,%rdi
        # Argument build;
    call    fibonacci
        # Calling fibonacci function;
    ret

