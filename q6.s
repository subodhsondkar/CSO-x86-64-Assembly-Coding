.data
A:
	.long	8, 5, 2, 12, 7, 6
		# Array of length N;
N:
	.long	6
		# Size of array A;
sum:
	.long
		# Sum of all array elements;
max:
	.long
		# Maximum of all array elements;
.text
.global main
main:
    mov N@GOTPCREL(%rip),%rcx
        # addr(N) <-> %rcx;
    mov (%rcx),%edx
        # N <-> %rdx;
	mov	A@GOTPCREL(%rip),%rcx
		# addr(A) <-> %rcx;
	mov	(%rcx),%ebx
		# max <-> %rbx <-> A[0];
	mov	%rbx,%rax
		# sum <-> %rax;
	mov	$1,%r9
		# %r9 <-> 1
loop:
	cmp	%rdx,%r9
		# Compare N with 1;
	je	loopexit
		# Not while;
	mov	%rdx,%r8
		# temporary storage of N;
	add	$4,%rcx
		# Move to address of next array element;
	mov	(%rcx),%edx;
		# Temporary storage of array element;
	add	%rdx,%rax
		# Update sum;
	cmp	%rdx,%rbx
		# Compare array element and max;
	jge	notif
		# Not if;
	mov	%rdx,%rbx
		# Array element is new max;
notif:
	mov	%r8,%rdx
		# N back in %rdx;
	dec	%rdx
		# N--;
	jmp	loop
		# Loop;
loopexit:
    mov sum@GOTPCREL(%rip),%rcx
        # addr(sum) <-> %rcx;
    mov %rax,(%rcx)
        # %rax <-> sum;
    mov max@GOTPCREL(%rip),%rcx
        # addr(max) <-> %rcx;
    mov %rbx,(%rcx)
        # %rbx <-> max;
	ret

