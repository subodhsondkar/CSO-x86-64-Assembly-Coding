.data
N:
	.long	10
		# Nth fibonacci number to be computed;
X:
	.long
		# Value of Nth fibonacci number;
.text
.global main
fibonacci:
		# %rdi <-> X;
		# %rsi <-> A;
		# %rcx <-> I;
		# %rdx <-> N;
	cmp	%rcx,%rdx
		# Comparing I & N;
	jle	exit
		# Not if;
	mov	%rdi,%rbx
		# X stored in temporary register.
	add	%rsi,%rdi
		# X = X + A;
	mov	%rbx,%rsi
		# old X stored as new A;
	inc	%rcx
		# I++;
	mov	%rdi,%rax
		# Return X;
	call	fibonacci
exit:
	ret
main:
	mov	N@GOTPCREL(%rip),%rcx
		# addr(N) <-> %rcx;
	mov	(%rcx),%rdx
		# N <-> %rdx;
	mov	$2,%rcx
		# I = 2;
	mov	$1,%rdi
		# X = 1;
	mov	$1,%rsi
		# Sequence creator A = 1;
	call	fibonacci
		# Calling fibonacci function;
	ret
