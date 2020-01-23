.text
.global fibonacci
fibonacci:
		# Argument N <-> %rdi;
	mov	$1,%rax
		# Answer X <-> %rax;
	mov	$1,%rbx
		# Creator A <-> %rbx;
	mov	$2,%rdx
		# I <-> %rdx;
loop:
	cmp	%rdx,%rdi
		# Compare I and N;
	jle	loopexit
		# Not while;
	mov	%rax,%rcx
		# Copy X[I] to a temporary register;
	add	%rbx,%rax
		# X[I+1]=X[I]+X[I-1];
	mov	%rcx,%rbx
		# A <-> X[I];
	inc	%rdx
		# I++;
	jmp	loop
loopexit:
	ret
		# Returns %rax;

