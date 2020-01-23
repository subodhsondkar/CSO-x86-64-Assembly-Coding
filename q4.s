.data
N:
	.long	10
		# Nth number to compute;
X:
	.long
		# Value of Nth fibonacci number;
.text
#.extern	fibonacci
.global	main
main:
	mov	N@GOTPCREL(%rip),%rax
		# addr(N) <-> %rax;
	mov	(%rax),%rdi
		# N <-> %rdi;
	call	fibonacci
		# Calling fibonacci function;
	ret

