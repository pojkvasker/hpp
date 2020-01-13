	.file	"Multigrid0.c"
	.text
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB43:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, %r12d
	movslq	%edi, %rbp
	leaq	0(,%rbp,8), %rdi
	call	malloc@PLT
	movq	%rax, %r13
	testl	%r12d, %r12d
	jle	.L1
	movq	%rax, %rbx
	leal	-1(%r12), %eax
	leaq	8(%r13,%rax,8), %r12
.L3:
	movl	$8, %esi
	movq	%rbp, %rdi
	call	calloc@PLT
	movq	%rax, (%rbx)
	addq	$8, %rbx
	cmpq	%r12, %rbx
	jne	.L3
.L1:
	movq	%r13, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	alloc_matrix, .-alloc_matrix
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB44:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %r12
	testl	%esi, %esi
	jle	.L7
	movq	%rdi, %rbx
	leal	-1(%rsi), %eax
	leaq	8(%rdi,%rax,8), %rbp
.L8:
	movq	(%rbx), %rdi
	call	free@PLT
	addq	$8, %rbx
	cmpq	%rbp, %rbx
	jne	.L8
.L7:
	movq	%r12, %rdi
	call	free@PLT
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE44:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"%lf\n"
	.text
	.globl	read_data
	.type	read_data, @function
read_data:
.LFB45:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %r13
	movq	%rsi, %rdi
	movl	%edx, %ebx
	leaq	.LC0(%rip), %rsi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L15
	movq	%rax, %r12
	testl	%ebx, %ebx
	jle	.L16
	movq	%r13, %rbp
	leal	-1(%rbx), %eax
	leaq	8(%r13,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	leaq	.LC1(%rip), %r13
.L13:
	movl	$0, %ebx
.L14:
	movq	%rbx, %rdx
	addq	0(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addq	$8, %rbx
	cmpq	%rbx, %r14
	jne	.L14
	addq	$8, %rbp
	cmpq	%r15, %rbp
	jne	.L13
	movl	$1, %eax
.L11:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L11
.L16:
	movl	$1, %eax
	jmp	.L11
	.cfi_endproc
.LFE45:
	.size	read_data, .-read_data
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB46:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L23
	movl	$1, %eax
	movl	$1, %edx
.L22:
	addl	%eax, %eax
	addl	$1, %edx
	cmpl	%edx, %edi
	jge	.L22
	rep ret
.L23:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE46:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC2:
	.string	"\n"
	.text
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB47:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, %rbp
	movl	%esi, %r14d
	movsd	%xmm0, (%rsp)
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	testl	%r14d, %r14d
	jle	.L25
	movsd	(%rsp), %xmm6
	movapd	%xmm6, %xmm7
	mulsd	%xmm6, %xmm7
	movsd	%xmm7, 40(%rsp)
	movl	$0, %r13d
	leal	-1(%r14), %r12d
	addq	$1, %r12
.L27:
	pxor	%xmm5, %xmm5
	cvtsi2sd	%r13d, %xmm5
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm5, 8(%rsp)
	mulsd	%xmm5, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	%xmm0, 24(%rsp)
	movsd	.LC5(%rip), %xmm0
	mulsd	8(%rsp), %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	%xmm0, 32(%rsp)
	movl	$0, %ebx
.L28:
	pxor	%xmm2, %xmm2
	cvtsi2sd	%ebx, %xmm2
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm2, 8(%rsp)
	mulsd	%xmm2, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	%xmm0, 16(%rsp)
	movsd	.LC4(%rip), %xmm4
	mulsd	8(%rsp), %xmm4
	movapd	%xmm4, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movq	0(%rbp), %rax
	movsd	16(%rsp), %xmm1
	mulsd	40(%rsp), %xmm1
	mulsd	%xmm1, %xmm0
	mulsd	24(%rsp), %xmm0
	mulsd	32(%rsp), %xmm0
	movsd	%xmm0, (%rax,%rbx,8)
	addq	$1, %rbx
	cmpq	%rbx, %r12
	jne	.L28
	addl	$1, %r13d
	addq	$8, %rbp
	cmpl	%r13d, %r14d
	jne	.L27
.L25:
	addq	$48, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE47:
	.size	fill_f, .-fill_f
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB48:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L35
	movq	%rdi, %rcx
	leal	-1(%rsi), %esi
	salq	$3, %rsi
	leaq	8(%rdi,%rsi), %rdi
	pxor	%xmm0, %xmm0
	addq	$8, %rsi
	movq	.LC7(%rip), %xmm2
.L33:
	movq	(%rcx), %rax
	leaq	(%rsi,%rax), %rdx
.L34:
	movsd	(%rax), %xmm1
	andpd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L34
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	jne	.L33
.L31:
	rep ret
.L35:
	pxor	%xmm0, %xmm0
	jmp	.L31
	.cfi_endproc
.LFE48:
	.size	L1_norm, .-L1_norm
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB49:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	testl	%esi, %esi
	jle	.L42
	movq	%rdi, %rcx
	leal	-1(%rsi), %esi
	salq	$3, %rsi
	leaq	8(%rdi,%rsi), %rdi
	pxor	%xmm0, %xmm0
	addq	$8, %rsi
.L39:
	movq	(%rcx), %rax
	leaq	(%rsi,%rax), %rdx
.L40:
	movsd	(%rax), %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L40
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	jne	.L39
	sqrtsd	%xmm0, %xmm2
	movsd	%xmm2, 8(%rsp)
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L45
.L37:
	movsd	8(%rsp), %xmm0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L45:
	.cfi_restore_state
	call	sqrt@PLT
	jmp	.L37
.L42:
	pxor	%xmm3, %xmm3
	movsd	%xmm3, 8(%rsp)
	jmp	.L37
	.cfi_endproc
.LFE49:
	.size	L2_norm, .-L2_norm
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB50:
	.cfi_startproc
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0
	testl	%esi, %esi
	jle	.L46
	movq	%rdi, %rcx
	leal	-1(%rsi), %esi
	salq	$3, %rsi
	leaq	8(%rdi,%rsi), %rdi
	addq	$8, %rsi
	movq	.LC7(%rip), %xmm2
.L48:
	movq	(%rcx), %rax
	leaq	(%rsi,%rax), %rdx
.L51:
	movsd	(%rax), %xmm1
	andpd	%xmm2, %xmm1
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L51
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	jne	.L48
.L46:
	rep ret
	.cfi_endproc
.LFE50:
	.size	Max_norm, .-Max_norm
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB51:
	.cfi_startproc
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jle	.L60
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %r8
	addq	$8, %rdx
	addq	$8, %rsi
	leal	-3(%rcx), %eax
	leaq	8(%rdi,%rax,8), %rbp
	leaq	16(,%rax,8), %r11
	movl	$8, %ebx
	movsd	.LC8(%rip), %xmm1
.L56:
	movq	%rbx, %rax
.L57:
	movq	8(%r8), %rcx
	leaq	8(%rax), %rdi
	movq	(%rsi), %r9
	movapd	%xmm1, %xmm0
	mulsd	(%rcx,%rax), %xmm0
	movq	(%r8), %r10
	subsd	(%r10,%rax), %xmm0
	movq	16(%r8), %r10
	subsd	(%r10,%rax), %xmm0
	subsd	-8(%rcx,%rax), %xmm0
	subsd	8(%rcx,%rax), %xmm0
	movq	(%rdx), %rcx
	subsd	(%rcx,%rax), %xmm0
	movsd	%xmm0, (%r9,%rax)
	movq	%rdi, %rax
	cmpq	%rdi, %r11
	jne	.L57
	addq	$8, %r8
	addq	$8, %rdx
	addq	$8, %rsi
	cmpq	%rbp, %r8
	jne	.L56
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L60:
	.cfi_restore 3
	.cfi_restore 6
	rep ret
	.cfi_endproc
.LFE51:
	.size	L_def, .-L_def
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB52:
	.cfi_startproc
	leal	-1(%rdx), %eax
	cmpl	$1, %eax
	jle	.L69
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rcx
	addq	$8, %rsi
	leal	-3(%rdx), %eax
	leaq	8(%rdi,%rax,8), %rbx
	leaq	16(,%rax,8), %r10
	movl	$8, %r11d
	movsd	.LC9(%rip), %xmm1
.L65:
	movq	%r11, %rax
.L66:
	movq	8(%rcx), %rdx
	leaq	8(%rax), %rdi
	movq	(%rcx), %r9
	movq	16(%rcx), %r8
	movsd	(%r9,%rax), %xmm0
	addsd	(%r8,%rax), %xmm0
	addsd	-8(%rdx,%rax), %xmm0
	addsd	8(%rdx,%rax), %xmm0
	movq	(%rsi), %r8
	addsd	(%r8,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx,%rax)
	movq	%rdi, %rax
	cmpq	%rdi, %r10
	jne	.L66
	addq	$8, %rcx
	addq	$8, %rsi
	cmpq	%rbx, %rcx
	jne	.L65
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L69:
	.cfi_restore 3
	rep ret
	.cfi_endproc
.LFE52:
	.size	GS_update, .-GS_update
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB53:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L72
	movslq	%esi, %rax
	leaq	-8(,%rax,8), %rcx
	leaq	(%rdi,%rcx), %r8
	leal	-1(%rsi), %eax
	leaq	8(,%rax,8), %rsi
	movl	$0, %eax
.L74:
	movq	(%rdi), %rdx
	movq	$0x000000000, (%rdx,%rax)
	movq	(%r8), %rdx
	movq	$0x000000000, (%rdx,%rax)
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%rdx)
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%rdx,%rcx)
	addq	$8, %rax
	cmpq	%rsi, %rax
	jne	.L74
.L72:
	rep ret
	.cfi_endproc
.LFE53:
	.size	set_BC, .-set_BC
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB54:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L76
	movq	%rdi, %r8
	leal	-1(%rdx), %eax
	movq	%rax, %rdx
	salq	$4, %rdx
	leaq	16(%rdi,%rdx), %r9
	leaq	8(,%rax,8), %rdi
	movsd	.LC8(%rip), %xmm1
.L78:
	movl	$0, %eax
.L79:
	movq	(%rsi), %rdx
	movq	(%r8), %rcx
	movapd	%xmm1, %xmm0
	mulsd	(%rcx,%rax,2), %xmm0
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rdi
	jne	.L79
	addq	$16, %r8
	addq	$8, %rsi
	cmpq	%r9, %r8
	jne	.L78
.L76:
	rep ret
	.cfi_endproc
.LFE54:
	.size	res_R, .-res_R
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB55:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L82
	movq	%rdi, %r8
	leal	-1(%rdx), %eax
	leaq	8(%rdi,%rax,8), %r10
	leaq	8(,%rax,8), %r9
.L83:
	movl	$0, %eax
.L84:
	movq	(%r8), %rdx
	movq	$0x000000000, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%r9, %rax
	jne	.L84
	addq	$8, %r8
	cmpq	%r10, %r8
	jne	.L83
.L82:
	leal	-1(%rcx), %eax
	testl	%eax, %eax
	jle	.L91
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rdx
	leal	-2(%rcx), %eax
	movq	%rax, %rcx
	salq	$4, %rcx
	leaq	16(%rdi,%rcx), %rbp
	leaq	8(,%rax,8), %r11
	movl	$0, %ebx
	movsd	.LC10(%rip), %xmm1
	movsd	.LC9(%rip), %xmm2
.L86:
	movl	$8, %ecx
	movq	%rbx, %rax
.L87:
	movq	(%rsi), %rdi
	movsd	(%rdi,%rax), %xmm0
	movq	(%rdx), %rdi
	movsd	%xmm0, (%rdi,%rax,2)
	movq	8(%rdx), %rdi
	movq	(%rsi), %r9
	movq	8(%rsi), %r8
	movsd	(%r9,%rax), %xmm0
	addsd	(%r8,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdi,%rax,2)
	movq	(%rsi), %r8
	leaq	8(%rax), %rdi
	movq	(%rdx), %r9
	movsd	(%r8,%rax), %xmm0
	addsd	8(%r8,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%r9,%rcx)
	movq	(%rsi), %r9
	movq	8(%rsi), %r8
	movq	8(%rdx), %r10
	movsd	(%r9,%rax), %xmm0
	addsd	8(%r9,%rax), %xmm0
	addsd	(%r8,%rax), %xmm0
	addsd	8(%r8,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%r10,%rcx)
	addq	$16, %rcx
	movq	%rdi, %rax
	cmpq	%rdi, %r11
	jne	.L87
	addq	$8, %rsi
	addq	$16, %rdx
	cmpq	%rbp, %rdx
	jne	.L86
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L91:
	.cfi_restore 3
	.cfi_restore 6
	rep ret
	.cfi_endproc
.LFE55:
	.size	prol_P, .-prol_P
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB56:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L94
	movq	%rdi, %r8
	leal	-1(%rdx), %eax
	leaq	8(%rdi,%rax,8), %r9
	leaq	8(,%rax,8), %rdi
.L96:
	movl	$0, %eax
.L97:
	movq	%rax, %rdx
	addq	(%r8), %rdx
	movq	(%rsi), %rcx
	movsd	(%rdx), %xmm0
	subsd	(%rcx,%rax), %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rax
	cmpq	%rax, %rdi
	jne	.L97
	addq	$8, %r8
	addq	$8, %rsi
	cmpq	%r9, %r8
	jne	.L96
.L94:
	rep ret
	.cfi_endproc
.LFE56:
	.size	u_update, .-u_update
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB42:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	%edi, %r14d
	movq	%rsi, %rbp
	movq	%rdx, %r13
	movsd	%xmm0, 40(%rsp)
	movsd	%xmm1, 8(%rsp)
	call	get_m
	movl	%eax, %ebx
	leal	-1(%r14), %r15d
	movl	%r15d, %edi
	call	get_m
	cmpl	$1, %r14d
	je	.L108
	addl	$1, %ebx
	leal	1(%rax), %r12d
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, %r14
	movl	%r12d, %edi
	call	alloc_matrix
	movq	%rax, 16(%rsp)
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, 24(%rsp)
	movl	%r12d, %edi
	call	alloc_matrix
	movq	%rax, 32(%rsp)
	movsd	8(%rsp), %xmm3
	movapd	%xmm3, %xmm0
	divsd	%xmm3, %xmm0
	ucomisd	.LC11(%rip), %xmm0
	jbe	.L102
.L104:
	movl	%ebx, %edx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	GS_update
	movl	%ebx, %ecx
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%rbp, %rdi
	call	L_def
	movl	%r12d, %edx
	movq	16(%rsp), %rsi
	movq	%r14, %rdi
	call	res_R
	movsd	8(%rsp), %xmm1
	movsd	40(%rsp), %xmm0
	movq	16(%rsp), %rdx
	movq	32(%rsp), %rsi
	movl	%r15d, %edi
	call	multigrid_vcycle
	movl	%r12d, %ecx
	movl	%ebx, %edx
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	prol_P
	movl	%ebx, %edx
	movq	24(%rsp), %rsi
	movq	%rbp, %rdi
	call	u_update
	movl	%ebx, %edx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	GS_update
	movl	%ebx, %esi
	movq	%r14, %rdi
	call	L2_norm
	divsd	8(%rsp), %xmm0
	ucomisd	.LC11(%rip), %xmm0
	ja	.L104
.L102:
	movl	%ebx, %esi
	movq	%r14, %rdi
	call	dealloc_matrix
	movl	%r12d, %esi
	movq	16(%rsp), %rdi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	24(%rsp), %rdi
	call	dealloc_matrix
	movl	%r12d, %esi
	movq	32(%rsp), %rdi
	call	dealloc_matrix
.L99:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L108:
	.cfi_restore_state
	movq	8(%rbp), %rax
	movq	8(%r13), %rdx
	movsd	40(%rsp), %xmm0
	mulsd	%xmm0, %xmm0
	mulsd	8(%rdx), %xmm0
	movsd	%xmm0, 8(%rax)
	jmp	.L99
	.cfi_endproc
.LFE42:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB57:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L109
	movq	%rdi, %rcx
	leal	-1(%rsi), %eax
	leaq	8(%rdi,%rax,8), %rdi
	leaq	8(,%rax,8), %rsi
.L111:
	movl	$0, %eax
.L112:
	movq	(%rcx), %rdx
	movq	$0x000000000, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rsi
	jne	.L112
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	jne	.L111
.L109:
	rep ret
	.cfi_endproc
.LFE57:
	.size	set_zeros, .-set_zeros
	.globl	verify
	.type	verify, @function
verify:
.LFB58:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L120
	leal	-1(%rdx), %eax
	leaq	8(,%rax,8), %r8
	movl	$0, %r9d
	movq	.LC7(%rip), %xmm4
	movsd	.LC11(%rip), %xmm3
	movapd	%xmm4, %xmm2
	movapd	%xmm3, %xmm1
.L116:
	movq	(%rdi,%r9), %rcx
	movq	(%rsi,%r9), %rdx
	movsd	(%rcx), %xmm0
	subsd	(%rdx), %xmm0
	andpd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	ja	.L126
	movl	$8, %eax
.L118:
	cmpq	%rax, %r8
	je	.L127
	movsd	(%rcx,%rax), %xmm0
	subsd	(%rdx,%rax), %xmm0
	andpd	%xmm2, %xmm0
	addq	$8, %rax
	ucomisd	%xmm1, %xmm0
	jbe	.L118
	movl	$0, %eax
	ret
.L127:
	addq	$8, %r9
	cmpq	%rax, %r9
	jne	.L116
	movl	$1, %eax
	ret
.L126:
	movl	$0, %eax
	ret
.L120:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE58:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC13:
	.string	"\nResult OK!"
.LC14:
	.string	"\nResult not OK!"
.LC16:
	.string	"time = %lf s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$9, %edi
	call	get_m
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC12(%rip), %xmm1
	movapd	%xmm1, %xmm3
	divsd	%xmm0, %xmm3
	movsd	%xmm3, (%rsp)
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %ebx
	movl	$1680762733, 49(%rsp)
	movw	$29793, 53(%rsp)
	movb	$0, 55(%rsp)
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, %r13
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, %r12
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, %rbp
	leaq	49(%rsp), %rsi
	movl	%ebx, %edx
	movq	%r13, %rdi
	call	read_data
	movsd	(%rsp), %xmm0
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	fill_f
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	L2_norm
	movsd	%xmm0, 8(%rsp)
	leaq	16(%rsp), %rdi
	movl	$0, %esi
	call	gettimeofday@PLT
	movsd	8(%rsp), %xmm1
	movsd	(%rsp), %xmm0
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$9, %edi
	call	multigrid_vcycle
	leaq	32(%rsp), %rdi
	movl	$0, %esi
	call	gettimeofday@PLT
	movl	%ebx, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	verify
	testl	%eax, %eax
	jne	.L133
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
.L130:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	40(%rsp), %xmm0
	movsd	.LC15(%rip), %xmm2
	divsd	%xmm2, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	32(%rsp), %xmm1
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	24(%rsp), %xmm1
	divsd	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdq	16(%rsp), %xmm2
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	movl	$0, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L134
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L133:
	.cfi_restore_state
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L130
.L134:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.str1.1
.LC17:
	.string	"%lf "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB59:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L141
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbp
	leal	-1(%rsi), %eax
	leaq	8(%rdi,%rax,8), %r14
	leaq	8(,%rax,8), %r13
	leaq	.LC17(%rip), %r12
.L137:
	movl	$0, %ebx
.L138:
	movq	0(%rbp), %rax
	movsd	(%rax,%rbx), %xmm0
	movq	%r12, %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	addq	$8, %rbx
	cmpq	%rbx, %r13
	jne	.L138
	movl	$10, %edi
	call	putchar@PLT
	addq	$8, %rbp
	cmpq	%r14, %rbp
	jne	.L137
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L141:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	rep ret
	.cfi_endproc
.LFE59:
	.size	print_matrix, .-print_matrix
	.globl	epsilon
	.section	.rodata
	.align 8
	.type	epsilon, @object
	.size	epsilon, 8
epsilon:
	.long	2296604913
	.long	1055193269
	.globl	pi
	.align 8
	.type	pi, @object
	.size	pi, 8
pi:
	.long	1413754136
	.long	1074340347
	.globl	l
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.long	9
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	1413754136
	.long	1074340347
	.align 8
.LC4:
	.long	3700601565
	.long	1075168253
	.align 8
.LC5:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	0
	.long	1074790400
	.align 8
.LC9:
	.long	0
	.long	1070596096
	.align 8
.LC10:
	.long	0
	.long	1071644672
	.align 8
.LC11:
	.long	2296604913
	.long	1055193269
	.align 8
.LC12:
	.long	0
	.long	1072693248
	.align 8
.LC15:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
