.data
N:
	.long	15
		# Nth fibonacci number to compute;
X:
	.long
		# Nth fibonacci number value;
.text
.global main
main:
	mov	$1,%rax
		# %rax <-> X;
	mov	$1,%rbx
		# A <-> %rbx; A = X[I-1];
	mov	N@GOTPCREL(%rip),%rdx
		# addr(N) <-> %rdx;
	mov	(%rdx),%r8
		# N <-> %r8;
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
	ret
		# Returns X (in %rax);

