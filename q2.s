.data
N:
	.long
		# Nth fibonacci number to compute;
X:
	.long
		# Nth fibonacci number value;
P:
    .ascii  "%d"
        # Printfing;
.text
.global main
main:
	mov	$0,%rax
		# system call; read;
	mov	$0,%rdi
		# file handle; stdin;
	mov	N@GOTPCREL(%rip),%rsi
		# Target addr(N);
	mov	$4,%rdx
		# Target length;
	syscall
	mov	N@GOTPCREL(%rip),%rdx
		# addr(N) <-> %rdx;
	mov	(%rdx),%r8
		# N <-> %r8;
	mov	$1,%rax
		# X <-> %rax;
	mov	$1,%rbx
		# A <-> %rbx; A = X[I-1];
	mov	$2,%rcx
		# I <-> %rcx; I is counter till N;
loop:
	cmp	%r8,%rcx
		# Compares I & N;
	jge	loopexit
		# Not while part;
	mov	%rax,%rdx
		# Temporary storage of X(I);
	add	%rbx,%rax
		# X(I+1) = X(I) + X(I-1);
	mov	%rdx,%rbx
		# X(I) = X(I-1);
	inc	%rcx
		# I++;
	jmp	loop
loopexit:
	mov	X@GOTPCREL(%rip),%rbx
		# addr(X) <-> %rbx;
	mov	%rax,(%rbx)
		# X <-> %rax;
    mov P@GOTPCREL(%rip),%rdi
    mov %rax,%rsi
    mov $0, %rax
    call    printf
	mov	$1,%rax
		# system call; write;
	mov	$1,%rdi
		# file handle; stdout;
	mov	%rbx,%rsi
		# Target addr(X);
	mov	$4,%rdx
		# Target length;
	syscall
	ret

