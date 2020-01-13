	.file	"Multigrid0.c"
	.text
	.p2align 4,,15
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB52:
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
	movslq	%edi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	0(,%rbp,8), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	movq	%rax, %r13
	testl	%ebp, %ebp
	jle	.L5
	movq	%rax, %rbx
	leal	-1(%rbp), %eax
	leaq	8(%r13,%rax,8), %r12
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$8, %esi
	movq	%rbp, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r12, %rbx
	jne	.L3
.L5:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	%r13, %rax
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
.LFE52:
	.size	alloc_matrix, .-alloc_matrix
	.p2align 4,,15
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB53:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testl	%esi, %esi
	jle	.L9
	leal	-1(%rsi), %eax
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L10
.L9:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE53:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"%lf\n"
	.text
	.p2align 4,,15
	.globl	read_data
	.type	read_data, @function
read_data:
.LFB54:
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
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	.LC0(%rip), %rsi
	movl	%edx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	fopen@PLT
	testq	%rax, %rax
	je	.L19
	testl	%ebx, %ebx
	jle	.L18
	leaq	.LC1(%rip), %r13
	movq	%rax, %r12
	leal	-1(%rbx), %eax
	leaq	8(%rbp,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L16:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L17:
	movq	0(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	addq	%rbx, %rdx
	addq	$8, %rbx
	call	__isoc99_fscanf@PLT
	cmpq	%rbx, %r14
	jne	.L17
	addq	$8, %rbp
	cmpq	%r15, %rbp
	jne	.L16
.L18:
	movl	$1, %eax
.L21:
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
.L19:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L21
	.cfi_endproc
.LFE54:
	.size	read_data, .-read_data
	.p2align 4,,15
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB55:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L29
	leal	-1(%rdi), %eax
	cmpl	$8, %eax
	jbe	.L30
	movl	%edi, %edx
	vmovdqa	.LC2(%rip), %xmm0
	xorl	%eax, %eax
	shrl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L26:
	addl	$1, %eax
	vpslld	$1, %xmm0, %xmm0
	cmpl	%edx, %eax
	jb	.L26
	vpsrldq	$8, %xmm0, %xmm1
	movl	%edi, %ecx
	vpmulld	%xmm1, %xmm0, %xmm0
	andl	$-4, %ecx
	leal	1(%rcx), %edx
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	cmpl	%ecx, %edi
	je	.L33
.L25:
	leal	1(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L32
	leal	2(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L32
	leal	3(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L32
	leal	4(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L32
	leal	5(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L32
	leal	6(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L32
	leal	7(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L32
	addl	%eax, %eax
	addl	$8, %edx
	leal	(%rax,%rax), %ecx
	cmpl	%edx, %edi
	cmovge	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	movl	$1, %eax
.L32:
	ret
	.p2align 4,,10
	.p2align 3
.L33:
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$1, %eax
	movl	$1, %edx
	jmp	.L25
	.cfi_endproc
.LFE55:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC4:
	.string	"\n"
	.text
	.p2align 4,,15
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB56:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	.LC4(%rip), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	vmovsd	%xmm0, 32(%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L39
	vmovsd	32(%rsp), %xmm4
	subl	$1, %ebx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm3, %xmm3, %xmm3
	addq	$2, %rbx
	movl	$1, %r12d
	vmulsd	%xmm4, %xmm4, %xmm7
	vmovsd	%xmm7, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L36:
	vmulsd	%xmm1, %xmm3, %xmm1
	movq	-8(%r13,%r12,8), %rbp
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	vmulsd	40(%rsp), %xmm1, %xmm6
	movl	$1, %r14d
	vmovsd	%xmm6, 24(%rsp)
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L37:
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vmulsd	32(%rsp), %xmm1, %xmm1
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC6(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm2
.L38:
	vmulsd	24(%rsp), %xmm2, %xmm2
	movl	%r14d, %eax
	vmulsd	%xmm0, %xmm2, %xmm2
	vmovsd	%xmm2, -8(%rbp,%r14,8)
	addq	$1, %r14
	cmpq	%rbx, %r14
	jne	.L37
	movl	%r12d, %eax
	addq	$1, %r12
	cmpq	%rbx, %r12
	je	.L39
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vmulsd	32(%rsp), %xmm1, %xmm1
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC7(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm3
	vmovapd	%xmm0, %xmm1
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L39:
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
.LFE56:
	.size	fill_f, .-fill_f
	.p2align 4,,15
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB57:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L50
	vmovq	.LC8(%rip), %xmm5
	leal	-1(%rsi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	vmovapd	.LC9(%rip), %ymm3
	movq	%rax, %r9
	pushq	-8(%r10)
	pushq	%rbp
	leaq	8(%rdi,%rax,8), %r11
	vmovapd	%xmm5, %xmm4
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	movl	$4, %r10d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	.p2align 4,,10
	.p2align 3
.L43:
	movq	(%rdi), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$4, %edx
	cmovb	%r10d, %edx
	cmpl	%r9d, %edx
	ja	.L51
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L48
	vmovsd	(%r8), %xmm1
	movl	$1, %ecx
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	$1, %eax
	je	.L48
	vmovsd	8(%r8), %xmm1
	movl	$2, %ecx
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	$3, %eax
	jne	.L48
	vmovsd	16(%r8), %xmm1
	movl	$3, %ecx
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L48:
	leaq	(%r8,%rax,8), %rdx
	movl	%esi, %r12d
	vxorpd	%xmm1, %xmm1, %xmm1
	subl	%eax, %r12d
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$2, %ebx
	.p2align 4,,10
	.p2align 3
.L45:
	addl	$1, %eax
	vandpd	(%rdx), %ymm3, %ymm2
	vaddpd	%ymm2, %ymm1, %ymm1
	addq	$32, %rdx
	cmpl	%ebx, %eax
	jb	.L45
	vhaddpd	%ymm1, %ymm1, %ymm1
	movl	%r12d, %edx
	andl	$-4, %edx
	leal	(%rdx,%rcx), %eax
	vperm2f128	$1, %ymm1, %ymm1, %ymm2
	vaddpd	%ymm2, %ymm1, %ymm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %r12d
	je	.L44
.L47:
	movslq	%eax, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	1(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L44
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	2(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L44
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	3(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L44
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	4(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L44
	movslq	%edx, %rdx
	addl	$5, %eax
	vmovsd	(%r8,%rdx,8), %xmm1
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L44
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L44:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L43
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L47
.L50:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	vxorpd	%xmm0, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE57:
	.size	L1_norm, .-L1_norm
	.p2align 4,,15
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB58:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L88
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	vxorpd	%xmm0, %xmm0, %xmm0
	pushq	-8(%r10)
	leal	-1(%rsi), %eax
	pushq	%rbp
	leaq	8(%rdi,%rax,8), %r11
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	movq	%rax, %r9
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	movl	$4, %r10d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	.p2align 4,,10
	.p2align 3
.L71:
	movq	(%rdi), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$4, %edx
	cmovb	%r10d, %edx
	cmpl	%r9d, %edx
	ja	.L75
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L73
	vmovsd	(%r8), %xmm1
	movl	$1, %ecx
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	$1, %eax
	je	.L73
	vmovsd	8(%r8), %xmm1
	movl	$2, %ecx
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	$3, %eax
	jne	.L73
	vmovsd	16(%r8), %xmm1
	movl	$3, %ecx
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L73:
	leaq	(%r8,%rax,8), %rdx
	movl	%esi, %r12d
	vxorpd	%xmm1, %xmm1, %xmm1
	subl	%eax, %r12d
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$2, %ebx
	.p2align 4,,10
	.p2align 3
.L69:
	vmovapd	(%rdx), %ymm2
	addl	$1, %eax
	addq	$32, %rdx
	vmulpd	%ymm2, %ymm2, %ymm2
	vaddpd	%ymm2, %ymm1, %ymm1
	cmpl	%ebx, %eax
	jb	.L69
	vhaddpd	%ymm1, %ymm1, %ymm1
	movl	%r12d, %edx
	andl	$-4, %edx
	leal	(%rdx,%rcx), %eax
	vperm2f128	$1, %ymm1, %ymm1, %ymm2
	vaddpd	%ymm2, %ymm1, %ymm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %r12d
	je	.L68
.L72:
	movslq	%eax, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	1(%rax), %edx
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L68
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	2(%rax), %edx
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L68
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	3(%rax), %edx
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L68
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	4(%rax), %edx
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L68
	movslq	%edx, %rdx
	addl	$5, %eax
	vmovsd	(%r8,%rdx,8), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L68
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L68:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L71
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L75:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L72
.L88:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	vxorpd	%xmm0, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE58:
	.size	L2_norm, .-L2_norm
	.p2align 4,,15
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB59:
	.cfi_startproc
	movq	(%rdi), %rax
	vmovsd	(%rax), %xmm0
	testl	%esi, %esi
	jle	.L109
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	vmovq	.LC8(%rip), %xmm4
	andq	$-32, %rsp
	leal	-1(%rsi), %eax
	vmovapd	.LC9(%rip), %ymm2
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rax, %r9
	vmovapd	%xmm4, %xmm3
	leaq	8(%rdi,%rax,8), %r11
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	movl	$4, %r10d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	.p2align 4,,10
	.p2align 3
.L91:
	movq	(%rdi), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$4, %edx
	cmovb	%r10d, %edx
	xorl	%ecx, %ecx
	cmpl	%r9d, %edx
	ja	.L95
	testl	%eax, %eax
	je	.L96
	vmovsd	(%r8), %xmm1
	movl	$1, %ecx
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	$1, %eax
	je	.L96
	vmovsd	8(%r8), %xmm1
	movl	$2, %ecx
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	$3, %eax
	jne	.L96
	vmovsd	16(%r8), %xmm1
	movl	$3, %ecx
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
.L96:
	leaq	(%r8,%rax,8), %rdx
	movl	%esi, %r12d
	vmovddup	%xmm0, %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	subl	%eax, %r12d
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$2, %ebx
	.p2align 4,,10
	.p2align 3
.L93:
	addl	$1, %eax
	vandpd	(%rdx), %ymm2, %ymm1
	vmaxpd	%ymm1, %ymm0, %ymm0
	addq	$32, %rdx
	cmpl	%ebx, %eax
	jb	.L93
	vperm2f128	$1, %ymm0, %ymm0, %ymm1
	vmaxpd	%ymm0, %ymm1, %ymm1
	movl	%r12d, %eax
	andl	$-4, %eax
	addl	%eax, %ecx
	vshufpd	$1, %ymm1, %ymm1, %ymm0
	vmaxpd	%ymm1, %ymm0, %ymm0
	cmpl	%eax, %r12d
	je	.L92
.L95:
	movslq	%ecx, %rax
	vmovsd	(%r8,%rax,8), %xmm1
	leal	1(%rcx), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L92
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	leal	2(%rcx), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L92
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	leal	3(%rcx), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L92
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	leal	4(%rcx), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L92
	cltq
	addl	$5, %ecx
	vmovsd	(%r8,%rax,8), %xmm1
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%ecx, %esi
	jle	.L92
	movslq	%ecx, %rcx
	vmovsd	(%r8,%rcx,8), %xmm1
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
.L92:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L91
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L109:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE59:
	.size	Max_norm, .-Max_norm
	.p2align 4,,15
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB60:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	leal	-1(%rcx), %eax
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -96(%rbp)
	movq	%rsi, -104(%rbp)
	movq	%rdx, -112(%rbp)
	movl	%eax, -120(%rbp)
	cmpl	$1, %eax
	jle	.L138
	leal	-3(%rcx), %eax
	vmovsd	.LC10(%rip), %xmm5
	movl	$8, %r15d
	movl	%eax, -116(%rbp)
	leaq	16(,%rax,8), %rax
	vmovapd	.LC11(%rip), %ymm3
	movq	%rax, -88(%rbp)
	leal	-2(%rcx), %eax
	vmovapd	%xmm5, %xmm4
	vmovapd	%xmm5, %xmm6
	movl	%eax, -64(%rbp)
	movq	%r15, %rax
	movq	%r15, -56(%rbp)
	.p2align 4,,10
	.p2align 3
.L121:
	movq	-112(%rbp), %rsi
	movq	-96(%rbp), %rbx
	movq	(%rsi,%rax), %r13
	movq	-104(%rbp), %rsi
	movq	-8(%rbx,%rax), %r14
	movq	(%rbx,%rax), %rdx
	movq	8(%rbx,%rax), %r12
	movq	(%rsi,%rax), %r15
	leaq	8(%r14), %rax
	leaq	40(%r15), %rdi
	leaq	8(%r15), %rsi
	cmpq	%rax, %rdi
	leaq	40(%r14), %rax
	setbe	%r8b
	cmpq	%rax, %rsi
	setnb	%al
	orl	%eax, %r8d
	leaq	48(%rdx), %rax
	cmpq	%rax, %rsi
	setnb	%cl
	cmpq	%rdi, %rdx
	setnb	%al
	orl	%ecx, %eax
	andl	%r8d, %eax
	cmpl	$5, -64(%rbp)
	leaq	40(%r12), %r8
	seta	%cl
	andl	%ecx, %eax
	leaq	8(%r12), %rcx
	cmpq	%rcx, %rdi
	setbe	%cl
	cmpq	%r8, %rsi
	setnb	%r8b
	orl	%r8d, %ecx
	testb	%cl, %al
	je	.L122
	leaq	8(%r13), %rax
	leaq	40(%r13), %rcx
	cmpq	%rax, %rdi
	setbe	%al
	cmpq	%rcx, %rsi
	setnb	%cl
	orb	%cl, %al
	je	.L122
	leaq	8(%rdx), %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %ecx
	cmpl	-116(%rbp), %ecx
	ja	.L123
	movl	$1, -60(%rbp)
	testl	%eax, %eax
	je	.L116
	vmulsd	8(%rdx), %xmm6, %xmm0
	movl	$2, -60(%rbp)
	vsubsd	8(%r14), %xmm0, %xmm0
	vsubsd	8(%r12), %xmm0, %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vsubsd	16(%rdx), %xmm0, %xmm0
	vsubsd	8(%r13), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r15)
	cmpl	$1, %eax
	je	.L116
	vmulsd	16(%rdx), %xmm6, %xmm0
	movl	$3, -60(%rbp)
	vsubsd	16(%r14), %xmm0, %xmm0
	vsubsd	16(%r12), %xmm0, %xmm0
	vsubsd	8(%rdx), %xmm0, %xmm0
	vsubsd	24(%rdx), %xmm0, %xmm0
	vsubsd	16(%r13), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r15)
	cmpl	$3, %eax
	jne	.L116
	vmulsd	24(%rdx), %xmm6, %xmm0
	movl	$4, -60(%rbp)
	vsubsd	24(%r14), %xmm0, %xmm0
	vsubsd	24(%r12), %xmm0, %xmm0
	vsubsd	16(%rdx), %xmm0, %xmm0
	vsubsd	32(%rdx), %xmm0, %xmm0
	vsubsd	24(%r13), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r15)
.L116:
	movl	-64(%rbp), %esi
	leaq	8(,%rax,8), %rcx
	movq	%rdx, -80(%rbp)
	leaq	(%rdx,%rcx), %rbx
	leaq	-8(%rdx,%rcx), %r9
	leaq	8(%rdx,%rcx), %r8
	leaq	(%r14,%rcx), %r11
	subl	%eax, %esi
	xorl	%eax, %eax
	movl	%esi, -68(%rbp)
	leaq	(%r12,%rcx), %r10
	shrl	$2, %esi
	movl	%esi, -72(%rbp)
	movl	-72(%rbp), %edx
	leaq	0(%r13,%rcx), %rdi
	xorl	%esi, %esi
	addq	%r15, %rcx
	.p2align 4,,10
	.p2align 3
.L118:
	vmulpd	(%rbx,%rax), %ymm3, %ymm1
	vmovupd	(%r11,%rax), %xmm2
	addl	$1, %esi
	vinsertf128	$0x1, 16(%r11,%rax), %ymm2, %ymm0
	vsubpd	%ymm0, %ymm1, %ymm2
	vmovupd	(%r10,%rax), %xmm1
	vinsertf128	$0x1, 16(%r10,%rax), %ymm1, %ymm0
	vsubpd	%ymm0, %ymm2, %ymm1
	vmovupd	(%r9,%rax), %xmm2
	vinsertf128	$0x1, 16(%r9,%rax), %ymm2, %ymm0
	vsubpd	%ymm0, %ymm1, %ymm2
	vmovupd	(%r8,%rax), %xmm0
	vinsertf128	$0x1, 16(%r8,%rax), %ymm0, %ymm0
	vsubpd	%ymm0, %ymm2, %ymm1
	vmovupd	(%rdi,%rax), %xmm0
	vinsertf128	$0x1, 16(%rdi,%rax), %ymm0, %ymm0
	vsubpd	%ymm0, %ymm1, %ymm0
	vmovups	%xmm0, (%rcx,%rax)
	vextractf128	$0x1, %ymm0, 16(%rcx,%rax)
	addq	$32, %rax
	cmpl	%edx, %esi
	jb	.L118
	movl	-68(%rbp), %edi
	movl	-60(%rbp), %ebx
	movq	-80(%rbp), %rdx
	movl	%edi, %eax
	andl	$-4, %eax
	addl	%eax, %ebx
	cmpl	%eax, %edi
	je	.L120
.L115:
	movslq	%ebx, %rax
	movl	-120(%rbp), %edi
	vmulsd	(%rdx,%rax,8), %xmm4, %xmm0
	vsubsd	(%r14,%rax,8), %xmm0, %xmm0
	vsubsd	(%r12,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	0(%r13,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax,8)
	leal	1(%rbx), %eax
	cmpl	%edi, %eax
	jge	.L120
	cltq
	vmulsd	(%rdx,%rax,8), %xmm4, %xmm0
	vsubsd	(%r14,%rax,8), %xmm0, %xmm0
	vsubsd	(%r12,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	0(%r13,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax,8)
	leal	2(%rbx), %eax
	cmpl	%eax, %edi
	jle	.L120
	cltq
	vmulsd	(%rdx,%rax,8), %xmm4, %xmm0
	vsubsd	(%r14,%rax,8), %xmm0, %xmm0
	vsubsd	(%r12,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	0(%r13,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax,8)
	leal	3(%rbx), %eax
	cmpl	%eax, %edi
	jle	.L120
	cltq
	vmulsd	(%rdx,%rax,8), %xmm4, %xmm0
	vsubsd	(%r14,%rax,8), %xmm0, %xmm0
	vsubsd	(%r12,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	0(%r13,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax,8)
	leal	4(%rbx), %eax
	cmpl	%eax, %edi
	jle	.L120
	cltq
	addl	$5, %ebx
	vmulsd	(%rdx,%rax,8), %xmm4, %xmm0
	vsubsd	(%r14,%rax,8), %xmm0, %xmm0
	vsubsd	(%r12,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	0(%r13,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax,8)
	cmpl	%ebx, %edi
	jle	.L120
	movslq	%ebx, %rbx
	vmulsd	(%rdx,%rbx,8), %xmm4, %xmm0
	vsubsd	(%r14,%rbx,8), %xmm0, %xmm0
	vsubsd	(%r12,%rbx,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rbx,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rbx,8), %xmm0, %xmm0
	vsubsd	0(%r13,%rbx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rbx,8)
.L120:
	addq	$8, -56(%rbp)
	movq	-56(%rbp), %rax
	cmpq	%rax, -88(%rbp)
	jne	.L121
	vzeroupper
.L138:
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L122:
	.cfi_restore_state
	movq	-88(%rbp), %rcx
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L114:
	vmulsd	(%rdx,%rax), %xmm5, %xmm0
	vsubsd	(%r14,%rax), %xmm0, %xmm0
	vsubsd	(%r12,%rax), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax), %xmm0, %xmm0
	vsubsd	0(%r13,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L114
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L123:
	movl	$1, %ebx
	jmp	.L115
	.cfi_endproc
.LFE60:
	.size	L_def, .-L_def
	.p2align 4,,15
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB61:
	.cfi_startproc
	cmpl	$2, %edx
	jle	.L148
	leal	-3(%rdx), %eax
	vmovsd	.LC12(%rip), %xmm2
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ecx, %ecx
	leaq	8(,%rax,8), %rbx
	leaq	16(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L143:
	movq	8(%rdi,%rcx), %rdx
	movl	$8, %eax
	movq	(%rdi,%rcx), %r10
	movq	16(%rdi,%rcx), %r9
	movq	8(%rsi,%rcx), %r8
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L142:
	vmovsd	(%r10,%rax), %xmm1
	vaddsd	(%r9,%rax), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	8(%rdx,%rax), %xmm0, %xmm0
	vaddsd	(%r8,%rax), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L142
	addq	$8, %rcx
	cmpq	%rcx, %rbx
	jne	.L143
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L148:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE61:
	.size	GS_update, .-GS_update
	.p2align 4,,15
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB62:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L155
	movslq	%esi, %rax
	movq	(%rdi), %r10
	salq	$3, %rax
	leaq	-8(%rax), %r9
	movq	-8(%rdi,%rax), %r8
	leal	-1(%rsi), %eax
	leaq	8(,%rax,8), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L153:
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%r10,%rax)
	movq	$0x000000000, (%r8,%rax)
	addq	$8, %rax
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	cmpq	%rcx, %rax
	jne	.L153
.L155:
	ret
	.cfi_endproc
.LFE62:
	.size	set_BC, .-set_BC
	.p2align 4,,15
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB63:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L175
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	leal	-1(%rdx), %eax
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rax, %r13
	salq	$4, %rax
	pushq	%r12
	leaq	16(%rdi,%rax), %r15
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movslq	%edx, %r12
	movl	%r13d, %r9d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	movq	%r12, %r14
	addq	$16, %rax
	salq	$3, %r12
	pushq	%rbx
	salq	$4, %r14
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%r13d, %ebx
	shrl	$2, %r9d
	andl	$-4, %ebx
	movq	%rax, -64(%rbp)
	movl	%ebx, -52(%rbp)
	vmovsd	.LC10(%rip), %xmm4
	vmovapd	.LC11(%rip), %ymm3
	.p2align 4,,10
	.p2align 3
.L158:
	movq	(%rsi), %rcx
	movq	(%rdi), %rax
	leaq	(%rcx,%r12), %r8
	cmpq	%r8, %rax
	leaq	(%rax,%r14), %r8
	setnb	%r10b
	cmpq	%r8, %rcx
	setnb	%r8b
	orb	%r8b, %r10b
	je	.L165
	cmpl	$10, %edx
	jbe	.L165
	cmpl	$3, %r13d
	jbe	.L166
	movq	%rax, %r8
	movq	%rcx, %r10
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L162:
	addl	$1, %r11d
	vmovupd	(%r8), %xmm2
	addq	$32, %r10
	addq	$64, %r8
	vinsertf128	$0x1, -48(%r8), %ymm2, %ymm2
	vmovupd	-32(%r8), %xmm1
	vinsertf128	$0x1, -16(%r8), %ymm1, %ymm1
	vinsertf128	$1, %xmm1, %ymm2, %ymm0
	vperm2f128	$49, %ymm1, %ymm2, %ymm1
	vunpcklpd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm0
	vmovups	%xmm0, -32(%r10)
	vextractf128	$0x1, %ymm0, -16(%r10)
	cmpl	%r11d, %r9d
	ja	.L162
	movl	-52(%rbp), %r8d
.L161:
	leal	(%r8,%r8), %r10d
	movslq	%r8d, %rbx
	movslq	%r10d, %r10
	vmulsd	(%rax,%r10,8), %xmm4, %xmm0
	leaq	0(,%r10,8), %r11
	leal	1(%r8), %r10d
	vmovsd	%xmm0, (%rcx,%rbx,8)
	cmpl	%edx, %r10d
	jge	.L159
	vmulsd	16(%rax,%r11), %xmm4, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	2(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L159
	vmulsd	32(%rax,%r11), %xmm4, %xmm0
	movslq	%r10d, %r10
	addl	$3, %r8d
	vmovsd	%xmm0, (%rcx,%r10,8)
	cmpl	%r8d, %edx
	jle	.L159
	vmulsd	48(%rax,%r11), %xmm4, %xmm0
	movslq	%r8d, %r8
	vmovsd	%xmm0, (%rcx,%r8,8)
.L159:
	addq	$16, %rdi
	addq	$8, %rsi
	cmpq	%r15, %rdi
	jne	.L158
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	.cfi_restore_state
	movq	-64(%rbp), %rbx
	leaq	(%rax,%rbx), %r8
	.p2align 4,,10
	.p2align 3
.L160:
	vmulsd	(%rax), %xmm4, %xmm0
	addq	$16, %rax
	addq	$8, %rcx
	vmovsd	%xmm0, -8(%rcx)
	cmpq	%r8, %rax
	jne	.L160
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L166:
	xorl	%r8d, %r8d
	jmp	.L161
.L175:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE63:
	.size	res_R, .-res_R
	.p2align 4,,15
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB64:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%ecx, %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	subq	$96, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	testl	%edx, %edx
	jle	.L179
	leal	-1(%rdx), %eax
	movq	%rdi, %r14
	leaq	8(%rdi,%rax,8), %r13
	leaq	8(,%rax,8), %rbx
	.p2align 4,,10
	.p2align 3
.L180:
	movq	(%r14), %rdi
	movq	%rbx, %rdx
	xorl	%esi, %esi
	addq	$8, %r14
	call	memset@PLT
	cmpq	%r13, %r14
	jne	.L180
.L179:
	leal	-1(%r12), %r15d
	testl	%r15d, %r15d
	jle	.L200
	leal	-2(%r12), %eax
	xorl	%r14d, %r14d
	movl	%r15d, %r12d
	vmovsd	.LC15(%rip), %xmm7
	movl	%eax, -64(%rbp)
	leaq	8(,%rax,8), %rax
	vmovsd	.LC12(%rip), %xmm9
	shrl	$2, %r12d
	movq	%rax, -80(%rbp)
	movl	%r15d, %eax
	vmovapd	.LC13(%rip), %ymm4
	vmovapd	%xmm7, %xmm6
	leaq	0(,%rax,8), %rsi
	vmovapd	.LC14(%rip), %ymm5
	vmovapd	%xmm9, %xmm8
	movl	%r15d, -60(%rbp)
	movq	%rsi, -104(%rbp)
	movq	%rax, %rsi
	leaq	8(,%rax,8), %rax
	salq	$4, %rsi
	movq	%rax, -112(%rbp)
	movl	%r15d, %eax
	andl	$-4, %eax
	movq	%rsi, -120(%rbp)
	movl	%eax, -124(%rbp)
	movq	%r14, %rax
	movl	%r12d, %r14d
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L188:
	movq	-96(%rbp), %rbx
	movq	-88(%rbp), %rcx
	movq	-112(%rbp), %r10
	movq	-120(%rbp), %r15
	movq	(%rbx,%r12), %rax
	movq	(%rcx,%r12,2), %rdx
	movq	8(%rbx,%r12), %rsi
	movq	-104(%rbp), %rdi
	leaq	(%rax,%r10), %rbx
	movq	8(%rcx,%r12,2), %rcx
	leaq	(%rdx,%r15), %r8
	movq	%rbx, -56(%rbp)
	leaq	8(%rax), %rbx
	leaq	(%rax,%rdi), %r13
	cmpq	%r8, %rbx
	leaq	(%rsi,%rdi), %r11
	leaq	(%rsi,%r10), %rdi
	setnb	%r10b
	cmpq	-56(%rbp), %rdx
	movq	%rdi, -72(%rbp)
	leaq	(%rcx,%r15), %r9
	setnb	%dil
	orl	%edi, %r10d
	cmpq	%r8, %rax
	setnb	%dil
	cmpq	%r13, %rdx
	setnb	%r15b
	orl	%r15d, %edi
	andl	%edi, %r10d
	cmpl	$3, -60(%rbp)
	seta	%dil
	andl	%edi, %r10d
	cmpq	%r9, %rax
	setnb	%r15b
	cmpq	%r13, %rcx
	movq	-72(%rbp), %r13
	setnb	%dil
	orl	%edi, %r15d
	andl	%r10d, %r15d
	cmpq	-56(%rbp), %rcx
	setnb	%dil
	cmpq	%rbx, %r9
	setbe	%r10b
	orl	%r10d, %edi
	leaq	8(%rsi), %r10
	andl	%edi, %r15d
	cmpq	%r11, %rdx
	setnb	%bl
	cmpq	%r8, %rsi
	setnb	%dil
	orl	%edi, %ebx
	andl	%ebx, %r15d
	cmpq	%r13, %rdx
	setnb	%dil
	cmpq	%r8, %r10
	leaq	64(%rdx), %r8
	setnb	%bl
	orl	%ebx, %edi
	andl	%edi, %r15d
	leaq	64(%rcx), %rdi
	cmpq	%rdi, %rdx
	setnb	%dil
	cmpq	%r8, %rcx
	setnb	%r8b
	orl	%r8d, %edi
	andl	%edi, %r15d
	cmpq	%r11, %rcx
	setnb	%dil
	cmpq	%r9, %rsi
	setnb	%r8b
	orl	%r8d, %edi
	testb	%dil, %r15b
	je	.L182
	cmpq	%r13, %rcx
	setnb	%dil
	cmpq	%r10, %r9
	setbe	%r8b
	orb	%r8b, %dil
	je	.L182
	cmpl	$2, -64(%rbp)
	jbe	.L189
	movq	%rax, %rdi
	movq	%rsi, %r8
	movq	%rdx, %r10
	movq	%rcx, %r9
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L184:
	vmovupd	(%rdi), %xmm2
	addl	$1, %r11d
	addq	$32, %rdi
	addq	$32, %r8
	vinsertf128	$0x1, -16(%rdi), %ymm2, %ymm2
	vmovupd	-24(%rdi), %xmm0
	addq	$64, %r10
	addq	$64, %r9
	vinsertf128	$0x1, -8(%rdi), %ymm0, %ymm0
	vaddpd	%ymm2, %ymm0, %ymm0
	vmovupd	-32(%r8), %xmm1
	vinsertf128	$1, %xmm2, %ymm2, %ymm10
	vinsertf128	$0x1, -16(%r8), %ymm1, %ymm1
	vaddpd	%ymm2, %ymm1, %ymm1
	vperm2f128	$49, %ymm2, %ymm2, %ymm2
	vmulpd	%ymm4, %ymm0, %ymm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm3
	vperm2f128	$49, %ymm0, %ymm0, %ymm0
	vshufpd	$12, %ymm3, %ymm10, %ymm3
	vshufpd	$12, %ymm0, %ymm2, %ymm0
	vmovups	%xmm3, -64(%r10)
	vmulpd	%ymm4, %ymm1, %ymm1
	vextractf128	$0x1, %ymm3, -48(%r10)
	vmovups	%xmm0, -32(%r10)
	vextractf128	$0x1, %ymm0, -16(%r10)
	vmovupd	-32(%r8), %xmm2
	vinsertf128	$0x1, -16(%r8), %ymm2, %ymm3
	vmovupd	-24(%r8), %xmm0
	vinsertf128	$0x1, -8(%r8), %ymm0, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm2
	vmovupd	-32(%rdi), %xmm0
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm3
	vmovupd	-24(%rdi), %xmm0
	vinsertf128	$0x1, -8(%rdi), %ymm0, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vinsertf128	$1, %xmm1, %ymm1, %ymm3
	vperm2f128	$49, %ymm1, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm2, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm2
	vperm2f128	$49, %ymm0, %ymm0, %ymm0
	vshufpd	$12, %ymm2, %ymm3, %ymm2
	vshufpd	$12, %ymm0, %ymm1, %ymm0
	vmovups	%xmm2, -64(%r9)
	vextractf128	$0x1, %ymm2, -48(%r9)
	vextractf128	$0x1, %ymm0, -16(%r9)
	vmovups	%xmm0, -32(%r9)
	cmpl	%r11d, %r14d
	ja	.L184
	movl	-124(%rbp), %ebx
	movl	%ebx, %edi
	cmpl	%ebx, -60(%rbp)
	je	.L187
.L183:
	movslq	%edi, %r9
	movl	-60(%rbp), %r15d
	leal	(%rdi,%rdi), %r8d
	salq	$3, %r9
	leaq	(%rax,%r9), %r10
	movslq	%r8d, %r8
	vmovsd	(%r10), %xmm0
	leaq	(%rsi,%r9), %rbx
	leaq	8(%rax,%r9), %r11
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	(%r10), %xmm0
	vaddsd	(%rbx), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	vmovsd	(%r10), %xmm0
	addq	$1, %r8
	vaddsd	(%r11), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	(%rbx), %xmm0
	vaddsd	(%r10), %xmm0, %xmm0
	vaddsd	(%r11), %xmm0, %xmm0
	vaddsd	8(%rsi,%r9), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	1(%rdi), %r8d
	cmpl	%r15d, %r8d
	jge	.L187
	movslq	%r8d, %r9
	addl	%r8d, %r8d
	addl	$2, %edi
	salq	$3, %r9
	movslq	%r8d, %r8
	leaq	(%rax,%r9), %r10
	vmovsd	(%r10), %xmm0
	leaq	(%rsi,%r9), %rbx
	leaq	8(%rax,%r9), %r11
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	(%r10), %xmm0
	vaddsd	(%rbx), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	vmovsd	(%r10), %xmm0
	addq	$1, %r8
	vaddsd	(%r11), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	(%r10), %xmm0
	vaddsd	(%rbx), %xmm0, %xmm0
	vaddsd	(%r11), %xmm0, %xmm0
	vaddsd	8(%rsi,%r9), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	cmpl	%edi, %r15d
	jle	.L187
	movslq	%edi, %r8
	addl	%edi, %edi
	salq	$3, %r8
	movslq	%edi, %rdi
	leaq	(%rax,%r8), %r9
	vmovsd	(%r9), %xmm0
	leaq	(%rsi,%r8), %r10
	leaq	8(%rax,%r8), %rax
	vmovsd	%xmm0, (%rdx,%rdi,8)
	vmovsd	(%r9), %xmm0
	vaddsd	(%r10), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,8)
	vmovsd	(%r9), %xmm0
	addq	$1, %rdi
	vaddsd	(%rax), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rdi,8)
	vmovsd	(%r9), %xmm0
	vaddsd	(%r10), %xmm0, %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	vaddsd	8(%rsi,%r8), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,8)
.L187:
	addq	$8, %r12
	cmpq	-80(%rbp), %r12
	jne	.L188
	vzeroupper
.L200:
	addq	$96, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L182:
	.cfi_restore_state
	movq	-80(%rbp), %r8
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L186:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
	vmovsd	%xmm0, (%rdx,%rdi,2)
	vmovsd	-8(%rax), %xmm0
	vaddsd	(%rsi,%rdi), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,2)
	vmovsd	-8(%rax), %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rdx,%rdi,2)
	vmovsd	(%rsi,%rdi), %xmm0
	vaddsd	8(%rsi,%rdi), %xmm0, %xmm0
	vaddsd	-8(%rax), %xmm0, %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rcx,%rdi,2)
	addq	$8, %rdi
	cmpq	%r8, %rdi
	jne	.L186
	jmp	.L187
	.p2align 4,,10
	.p2align 3
.L189:
	xorl	%edi, %edi
	jmp	.L183
	.cfi_endproc
.LFE64:
	.size	prol_P, .-prol_P
	.p2align 4,,15
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB51:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12
	pushq	%rbx
	subq	$296, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	testl	%edi, %edi
	jle	.L260
	leal	-1(%rdi), %eax
	movl	%eax, -108(%rbp)
	cmpl	$8, %eax
	jbe	.L261
	movl	%edi, %ecx
	vmovdqa	.LC2(%rip), %xmm2
	xorl	%eax, %eax
	shrl	$2, %ecx
	.p2align 4,,10
	.p2align 3
.L205:
	addl	$1, %eax
	vpslld	$1, %xmm2, %xmm2
	cmpl	%eax, %ecx
	ja	.L205
	vpsrldq	$8, %xmm2, %xmm3
	movl	%edi, %ecx
	vpmulld	%xmm3, %xmm2, %xmm2
	andl	$-4, %ecx
	leal	1(%rcx), %eax
	vpsrldq	$4, %xmm2, %xmm3
	vpmulld	%xmm3, %xmm2, %xmm2
	vmovd	%xmm2, -52(%rbp)
	cmpl	%edi, %ecx
	je	.L206
.L204:
	sall	-52(%rbp)
	leal	1(%rax), %ecx
	movl	-52(%rbp), %ebx
	cmpl	%ecx, %edi
	jl	.L206
	leal	2(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L206
	leal	3(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L206
	leal	4(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L206
	leal	5(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L206
	leal	6(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L206
	leal	7(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L206
	addl	%ebx, %ebx
	addl	$8, %eax
	leal	(%rbx,%rbx), %ecx
	cmpl	%eax, %edi
	cmovl	%ebx, %ecx
	movl	%ecx, -52(%rbp)
.L206:
	movl	-52(%rbp), %eax
	leal	1(%rax), %r12d
	cmpl	$1, %edi
	jle	.L203
	leal	-2(%rdi), %eax
	cmpl	$8, %eax
	jbe	.L262
	movl	-108(%rbp), %ecx
	xorl	%eax, %eax
	vmovdqa	.LC2(%rip), %xmm2
	shrl	$2, %ecx
	.p2align 4,,10
	.p2align 3
.L208:
	addl	$1, %eax
	vpslld	$1, %xmm2, %xmm2
	cmpl	%eax, %ecx
	ja	.L208
	vpsrldq	$8, %xmm2, %xmm3
	movl	-108(%rbp), %ebx
	vpmulld	%xmm3, %xmm2, %xmm2
	vpsrldq	$4, %xmm2, %xmm3
	movl	%ebx, %r8d
	vpmulld	%xmm3, %xmm2, %xmm2
	andl	$-4, %r8d
	leal	1(%r8), %ecx
	vmovd	%xmm2, %eax
	cmpl	%ebx, %r8d
	je	.L209
.L207:
	leal	1(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L209
	leal	2(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L209
	leal	3(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L209
	leal	4(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L209
	leal	5(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L209
	leal	6(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L209
	leal	7(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L209
	addl	%eax, %eax
	addl	$8, %ecx
	leal	(%rax,%rax), %r8d
	cmpl	%ecx, %edi
	cmovg	%r8d, %eax
.L209:
	addl	$1, %eax
	movl	%eax, -72(%rbp)
.L210:
	movslq	%r12d, %rbx
	movq	%rsi, %r13
	movq	%rdx, -88(%rbp)
	leaq	0(,%rbx,8), %rax
	vmovsd	%xmm1, -176(%rbp)
	movq	%rax, %rdi
	vmovsd	%xmm0, -272(%rbp)
	movq	%rax, -96(%rbp)
	call	malloc@PLT
	leal	-1(%r12), %esi
	leaq	8(,%rsi,8), %r14
	movq	%rax, -80(%rbp)
	movq	%rax, %r15
	movq	%r14, -128(%rbp)
	addq	%rax, %r14
	movq	%rax, -328(%rbp)
	movl	%esi, -56(%rbp)
	movq	%rsi, -144(%rbp)
	.p2align 4,,10
	.p2align 3
.L212:
	movl	$8, %esi
	movq	%rbx, %rdi
	addq	$8, %r15
	call	calloc@PLT
	movq	%rax, -8(%r15)
	cmpq	%r14, %r15
	jne	.L212
	movslq	-72(%rbp), %r14
	movq	%r15, -256(%rbp)
	leaq	0(,%r14,8), %rax
	movq	%rax, %rdi
	movq	%rax, -64(%rbp)
	call	malloc@PLT
	leal	-1(%r14), %esi
	movq	%rbx, -152(%rbp)
	leaq	8(,%rsi,8), %r15
	movq	%rax, -104(%rbp)
	movq	%rax, %rbx
	movq	%r15, -120(%rbp)
	addq	%rax, %r15
	movq	%rax, -280(%rbp)
	movl	%esi, -68(%rbp)
	movq	%rsi, -136(%rbp)
	.p2align 4,,10
	.p2align 3
.L213:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r15, %rbx
	jne	.L213
	movq	-96(%rbp), %rdi
	movq	%rbx, -320(%rbp)
	movq	-152(%rbp), %rbx
	call	malloc@PLT
	movq	-128(%rbp), %r15
	movl	%r12d, -128(%rbp)
	movq	%rax, -96(%rbp)
	movq	%rax, %r12
	movq	%rax, -296(%rbp)
	addq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L214:
	movl	$8, %esi
	movq	%rbx, %rdi
	addq	$8, %r12
	call	calloc@PLT
	movq	%rax, -8(%r12)
	cmpq	%r15, %r12
	jne	.L214
	movq	-64(%rbp), %rdi
	movq	%r12, -312(%rbp)
	movl	-128(%rbp), %r12d
	call	malloc@PLT
	movq	-120(%rbp), %rbx
	movq	%rax, -168(%rbp)
	movq	%rax, %r15
	movq	%rax, -288(%rbp)
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L215:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %r15
	call	calloc@PLT
	movq	%rax, -8(%r15)
	cmpq	%rbx, %r15
	jne	.L215
	movl	-52(%rbp), %eax
	movq	%r15, -304(%rbp)
	movq	-80(%rbp), %rdi
	vmovsd	.LC10(%rip), %xmm4
	vmovapd	.LC11(%rip), %ymm3
	subl	$2, %eax
	vmovsd	.LC16(%rip), %xmm0
	vdivsd	-176(%rbp), %xmm0, %xmm6
	vmovsd	%xmm6, -216(%rbp)
	leaq	8(,%rax,8), %rbx
	movq	%rbx, -128(%rbp)
	leaq	16(,%rax,8), %rbx
	movq	-136(%rbp), %rax
	salq	$4, %rax
	movq	%rax, -248(%rbp)
	leaq	16(%rdi,%rax), %rax
	movq	-144(%rbp), %rdi
	movq	%rax, -64(%rbp)
	movq	%r14, %rax
	salq	$4, %rax
	movq	%rax, -232(%rbp)
	leaq	0(,%r14,8), %rax
	movq	%rax, -224(%rbp)
	movl	-68(%rbp), %eax
	leaq	8(,%rdi,8), %rdi
	movq	%rdi, -240(%rbp)
	movl	%eax, %r14d
	andl	$-4, %eax
	movl	%eax, -112(%rbp)
	addl	%eax, %eax
	shrl	$2, %r14d
	cltq
	salq	$3, %rax
	movq	%rax, -264(%rbp)
.L216:
	xorl	%ecx, %ecx
	cmpl	$1, -52(%rbp)
	vmovsd	.LC12(%rip), %xmm2
	je	.L253
	movq	-128(%rbp), %r9
	movq	-88(%rbp), %r10
	.p2align 4,,10
	.p2align 3
.L218:
	movq	8(%r13,%rcx), %rdx
	movl	$8, %eax
	movq	0(%r13,%rcx), %r8
	movq	16(%r13,%rcx), %rdi
	movq	8(%r10,%rcx), %rsi
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L217:
	vmovsd	(%r8,%rax), %xmm1
	vaddsd	(%rdi,%rax), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	8(%rdx,%rax), %xmm0, %xmm0
	vaddsd	(%rsi,%rax), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L217
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L218
.L253:
	movq	-80(%rbp), %r15
	movl	%r12d, %ecx
	movq	%r13, %rdi
	vmovapd	%ymm3, -208(%rbp)
	movq	-88(%rbp), %rdx
	vmovsd	%xmm4, -160(%rbp)
	movq	%r15, %rsi
	vzeroupper
	call	L_def
	movq	%r15, %r8
	movq	-248(%rbp), %rax
	movslq	-112(%rbp), %r11
	movl	%r12d, -136(%rbp)
	movq	%rbx, -144(%rbp)
	movq	-104(%rbp), %r9
	movq	%r13, -152(%rbp)
	movq	-232(%rbp), %r12
	leaq	16(%rax), %r15
	movq	-224(%rbp), %rbx
	movq	%r15, -120(%rbp)
	movl	-72(%rbp), %r15d
	leal	1(%r11), %r10d
	movq	-264(%rbp), %r13
	vmovsd	-160(%rbp), %xmm4
	vmovapd	-208(%rbp), %ymm3
	.p2align 4,,10
	.p2align 3
.L219:
	movq	(%r9), %rdi
	movq	(%r8), %rsi
	leaq	(%rdi,%rbx), %rax
	cmpq	%rax, %rsi
	leaq	(%rsi,%r12), %rax
	setnb	%dl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %dl
	je	.L228
	cmpl	$10, %r15d
	jbe	.L228
	cmpl	$3, -68(%rbp)
	jbe	.L222
	movq	%rdi, %rdx
	movq	%rsi, %rax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L223:
	addl	$1, %ecx
	vmovupd	(%rax), %xmm2
	addq	$32, %rdx
	addq	$64, %rax
	vinsertf128	$0x1, -48(%rax), %ymm2, %ymm2
	vmovupd	-32(%rax), %xmm1
	vinsertf128	$0x1, -16(%rax), %ymm1, %ymm1
	vinsertf128	$1, %xmm1, %ymm2, %ymm0
	vperm2f128	$49, %ymm1, %ymm2, %ymm1
	vunpcklpd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm0
	vmovups	%xmm0, -32(%rdx)
	vextractf128	$0x1, %ymm0, -16(%rdx)
	cmpl	%ecx, %r14d
	ja	.L223
	vmulsd	(%rsi,%r13), %xmm4, %xmm0
	movq	%r13, %rcx
	movl	%r10d, %eax
	vmovsd	%xmm0, (%rdi,%r11,8)
	cmpl	%r10d, %r15d
	jle	.L220
.L257:
	vmulsd	16(%rsi,%rcx), %xmm4, %xmm0
	movslq	%eax, %rdx
	vmovsd	%xmm0, (%rdi,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%edx, %r15d
	jle	.L220
	vmulsd	32(%rsi,%rcx), %xmm4, %xmm0
	movslq	%edx, %rdx
	addl	$2, %eax
	vmovsd	%xmm0, (%rdi,%rdx,8)
	cmpl	%eax, %r15d
	jle	.L220
	vmulsd	48(%rsi,%rcx), %xmm4, %xmm0
	cltq
	vmovsd	%xmm0, (%rdi,%rax,8)
.L220:
	addq	$16, %r8
	addq	$8, %r9
	cmpq	-64(%rbp), %r8
	jne	.L219
	movq	-168(%rbp), %r15
	vmovapd	%ymm3, -208(%rbp)
	movl	-136(%rbp), %r12d
	vmovsd	%xmm4, -160(%rbp)
	movq	-144(%rbp), %rbx
	movq	-152(%rbp), %r13
	movq	-104(%rbp), %rdx
	movq	%r15, %rsi
	movl	-108(%rbp), %edi
	vmovsd	-176(%rbp), %xmm1
	vmovsd	-272(%rbp), %xmm0
	vzeroupper
	call	multigrid_vcycle
	movl	-72(%rbp), %ecx
	movq	%r15, %rsi
	movq	-96(%rbp), %rdi
	movl	%r12d, %edx
	call	prol_P
	movq	%rbx, -136(%rbp)
	xorl	%r10d, %r10d
	movq	-240(%rbp), %r15
	movq	-96(%rbp), %rbx
	movl	%r14d, -120(%rbp)
	vmovsd	-160(%rbp), %xmm4
	vmovapd	-208(%rbp), %ymm3
	.p2align 4,,10
	.p2align 3
.L229:
	movq	(%rbx,%r10), %r9
	movq	0(%r13,%r10), %rsi
	leaq	32(%r9), %rax
	cmpq	%rax, %rsi
	leaq	32(%rsi), %rax
	setnb	%dl
	cmpq	%rax, %r9
	setnb	%al
	orb	%al, %dl
	je	.L272
	cmpl	$8, %r12d
	jbe	.L272
	movq	%rsi, %rdx
	shrq	$3, %rdx
	negq	%rdx
	andl	$3, %edx
	leal	3(%rdx), %eax
	cmpl	-56(%rbp), %eax
	ja	.L233
	xorl	%r8d, %r8d
	testl	%edx, %edx
	je	.L234
	vmovsd	(%rsi), %xmm0
	movl	$1, %r8d
	vsubsd	(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi)
	cmpl	$1, %edx
	je	.L234
	vmovsd	8(%rsi), %xmm0
	movl	$2, %r8d
	vsubsd	8(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rsi)
	cmpl	$3, %edx
	jne	.L234
	vmovsd	16(%rsi), %xmm0
	movl	$3, %r8d
	vsubsd	16(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rsi)
.L234:
	movl	%r12d, %r14d
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	subl	%edx, %r14d
	salq	$3, %rdx
	leaq	(%rsi,%rdx), %rdi
	movl	%r14d, %r11d
	addq	%r9, %rdx
	shrl	$2, %r11d
	.p2align 4,,10
	.p2align 3
.L236:
	vmovapd	(%rdi,%rax), %ymm1
	addl	$1, %ecx
	vmovupd	(%rdx,%rax), %xmm0
	vinsertf128	$0x1, 16(%rdx,%rax), %ymm0, %ymm0
	vsubpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, (%rdi,%rax)
	addq	$32, %rax
	cmpl	%ecx, %r11d
	ja	.L236
	movl	%r14d, %eax
	andl	$-4, %eax
	addl	%eax, %r8d
	cmpl	%r14d, %eax
	je	.L232
	movslq	%r8d, %rdx
	addl	$1, %r8d
	leaq	(%rsi,%rdx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r9,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	cmpl	%r12d, %r8d
	jge	.L232
.L258:
	movslq	%r8d, %rdx
	leaq	(%rsi,%rdx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r9,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	leal	1(%r8), %eax
	cmpl	%r12d, %eax
	jge	.L232
	cltq
	leaq	(%rsi,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	leal	2(%r8), %eax
	vmovsd	%xmm0, (%rdx)
	cmpl	%r12d, %eax
	jge	.L232
	cltq
	leaq	(%rsi,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	leal	3(%r8), %eax
	vmovsd	%xmm0, (%rdx)
	cmpl	%r12d, %eax
	jge	.L232
	cltq
	addl	$4, %r8d
	leaq	(%rsi,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
	cmpl	%r12d, %r8d
	jge	.L232
	movslq	%r8d, %r8
	leaq	(%rsi,%r8,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r9,%r8,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
.L232:
	addq	$8, %r10
	cmpq	%r15, %r10
	jne	.L229
	xorl	%ecx, %ecx
	cmpl	$1, -52(%rbp)
	movl	-120(%rbp), %r14d
	movq	-136(%rbp), %rbx
	vmovsd	.LC12(%rip), %xmm2
	je	.L239
	movq	-128(%rbp), %r9
	movq	-88(%rbp), %r10
	.p2align 4,,10
	.p2align 3
.L238:
	movq	8(%r13,%rcx), %rdx
	movl	$8, %eax
	movq	0(%r13,%rcx), %r8
	movq	16(%r13,%rcx), %rdi
	movq	8(%r10,%rcx), %rsi
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L242:
	vmovsd	(%r8,%rax), %xmm1
	vaddsd	(%rdi,%rax), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	8(%rdx,%rax), %xmm0, %xmm0
	vaddsd	(%rsi,%rax), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L242
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L238
.L239:
	movq	-80(%rbp), %r15
	movl	$4, %r9d
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	-256(%rbp), %r10
	movl	-56(%rbp), %r11d
	.p2align 4,,10
	.p2align 3
.L243:
	movq	(%r15), %rsi
	movq	%rsi, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$4, %edx
	cmovb	%r9d, %edx
	cmpl	%r11d, %edx
	ja	.L248
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L249
	vmovsd	(%rsi), %xmm0
	movl	$1, %ecx
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	$1, %eax
	je	.L249
	vmovsd	8(%rsi), %xmm0
	movl	$2, %ecx
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	$3, %eax
	jne	.L249
	vmovsd	16(%rsi), %xmm0
	movl	$3, %ecx
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
.L249:
	leaq	(%rsi,%rax,8), %rdx
	movl	%r12d, %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	subl	%eax, %r8d
	xorl	%eax, %eax
	movl	%r8d, %edi
	shrl	$2, %edi
	.p2align 4,,10
	.p2align 3
.L245:
	vmovapd	(%rdx), %ymm1
	addl	$1, %eax
	addq	$32, %rdx
	vmulpd	%ymm1, %ymm1, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	cmpl	%eax, %edi
	ja	.L245
	vhaddpd	%ymm0, %ymm0, %ymm0
	movl	%r8d, %eax
	andl	$-4, %eax
	addl	%eax, %ecx
	vperm2f128	$1, %ymm0, %ymm0, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r8d, %eax
	je	.L244
	movslq	%ecx, %rax
	addl	$1, %ecx
	vmovsd	(%rsi,%rax,8), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r12d, %ecx
	jge	.L244
.L259:
	movslq	%ecx, %rax
	vmovsd	(%rsi,%rax,8), %xmm0
	leal	1(%rcx), %eax
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r12d, %eax
	jge	.L244
	cltq
	vmovsd	(%rsi,%rax,8), %xmm0
	leal	2(%rcx), %eax
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r12d, %eax
	jge	.L244
	cltq
	vmovsd	(%rsi,%rax,8), %xmm0
	leal	3(%rcx), %eax
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r12d, %eax
	jge	.L244
	cltq
	addl	$4, %ecx
	vmovsd	(%rsi,%rax,8), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r12d, %ecx
	jge	.L244
	movslq	%ecx, %rcx
	vmovsd	(%rsi,%rcx,8), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
.L244:
	addq	$8, %r15
	cmpq	%r10, %r15
	jne	.L243
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vmulsd	-216(%rbp), %xmm2, %xmm2
	vcomisd	.LC17(%rip), %xmm2
	ja	.L216
	movq	-328(%rbp), %rbx
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L251:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r15, %rbx
	jne	.L251
	movq	-80(%rbp), %rdi
	call	free@PLT
	movq	-280(%rbp), %rbx
	movq	-320(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L254:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L254
	movq	-104(%rbp), %rdi
	call	free@PLT
	movq	-296(%rbp), %rbx
	movq	-312(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L255:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L255
	movq	-96(%rbp), %rdi
	call	free@PLT
	movq	-288(%rbp), %rbx
	movq	-304(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L256:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L256
	movq	-168(%rbp), %rdi
	addq	$296, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L272:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L231:
	vmovsd	(%rsi,%rax), %xmm0
	vsubsd	(%r9,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%rax)
	addq	$8, %rax
	cmpq	%r15, %rax
	jne	.L231
	jmp	.L232
	.p2align 4,,10
	.p2align 3
.L228:
	movq	-120(%rbp), %rax
	addq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L221:
	vmulsd	(%rsi), %xmm4, %xmm0
	addq	$16, %rsi
	addq	$8, %rdi
	vmovsd	%xmm0, -8(%rdi)
	cmpq	%rax, %rsi
	jne	.L221
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L248:
	vmovsd	(%rsi), %xmm0
	movl	$1, %ecx
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L222:
	vmulsd	(%rsi), %xmm4, %xmm0
	xorl	%ecx, %ecx
	movl	$1, %eax
	vmovsd	%xmm0, (%rdi)
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L233:
	vmovsd	(%rsi), %xmm0
	movl	$1, %r8d
	vsubsd	(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi)
	jmp	.L258
.L260:
	movl	$2, %r12d
	movl	$1, -52(%rbp)
.L203:
	cmpl	$1, %edi
	jne	.L263
	movq	8(%rdx), %rdx
	vmulsd	%xmm0, %xmm0, %xmm0
	movq	8(%rsi), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	addq	$296, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L261:
	.cfi_restore_state
	movl	$1, %eax
	movl	$1, -52(%rbp)
	jmp	.L204
.L262:
	movl	$1, %eax
	movl	$1, %ecx
	jmp	.L207
.L263:
	leal	-1(%rdi), %eax
	movl	$2, -72(%rbp)
	movl	%eax, -108(%rbp)
	jmp	.L210
	.cfi_endproc
.LFE51:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.p2align 4,,15
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB65:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L343
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	leal	-1(%rdx), %eax
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	leaq	8(,%rax,8), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	xorl	%r12d, %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%eax, -52(%rbp)
	.p2align 4,,10
	.p2align 3
.L316:
	movq	(%rsi,%r12), %rbx
	movq	(%rdi,%r12), %r9
	leaq	32(%rbx), %rax
	cmpq	%rax, %r9
	leaq	32(%r9), %rax
	setnb	%cl
	cmpq	%rax, %rbx
	setnb	%al
	orb	%al, %cl
	je	.L331
	cmpl	$8, %edx
	jbe	.L331
	movq	%r9, %rcx
	shrq	$3, %rcx
	negq	%rcx
	andl	$3, %ecx
	leal	3(%rcx), %eax
	cmpl	-52(%rbp), %eax
	ja	.L320
	xorl	%r10d, %r10d
	testl	%ecx, %ecx
	je	.L321
	vmovsd	(%r9), %xmm0
	movl	$1, %r10d
	vsubsd	(%rbx), %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
	cmpl	$1, %ecx
	je	.L321
	vmovsd	8(%r9), %xmm0
	movl	$2, %r10d
	vsubsd	8(%rbx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r9)
	cmpl	$3, %ecx
	jne	.L321
	vmovsd	16(%r9), %xmm0
	movl	$3, %r10d
	vsubsd	16(%rbx), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r9)
.L321:
	movl	%edx, %r14d
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	subl	%ecx, %r14d
	salq	$3, %rcx
	leaq	(%r9,%rcx), %r11
	movl	%r14d, %r13d
	addq	%rbx, %rcx
	shrl	$2, %r13d
	.p2align 4,,10
	.p2align 3
.L323:
	vmovupd	(%rcx,%rax), %xmm0
	vinsertf128	$0x1, 16(%rcx,%rax), %ymm0, %ymm1
	addl	$1, %r8d
	vmovapd	(%r11,%rax), %ymm0
	vsubpd	%ymm1, %ymm0, %ymm0
	vmovapd	%ymm0, (%r11,%rax)
	addq	$32, %rax
	cmpl	%r8d, %r13d
	ja	.L323
	movl	%r14d, %eax
	andl	$-4, %eax
	addl	%eax, %r10d
	cmpl	%eax, %r14d
	je	.L319
	movslq	%r10d, %rcx
	addl	$1, %r10d
	leaq	(%r9,%rcx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rbx,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	cmpl	%r10d, %edx
	jle	.L319
.L327:
	movslq	%r10d, %rcx
	leaq	(%r9,%rcx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rbx,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	leal	1(%r10), %eax
	cmpl	%eax, %edx
	jle	.L319
	cltq
	leaq	(%r9,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rbx,%rax,8), %xmm0, %xmm0
	leal	2(%r10), %eax
	vmovsd	%xmm0, (%rcx)
	cmpl	%eax, %edx
	jle	.L319
	cltq
	leaq	(%r9,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rbx,%rax,8), %xmm0, %xmm0
	leal	3(%r10), %eax
	vmovsd	%xmm0, (%rcx)
	cmpl	%eax, %edx
	jle	.L319
	cltq
	addl	$4, %r10d
	leaq	(%r9,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rbx,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	cmpl	%r10d, %edx
	jle	.L319
	movslq	%r10d, %r10
	leaq	(%r9,%r10,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rbx,%r10,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
.L319:
	addq	$8, %r12
	cmpq	%r12, %r15
	jne	.L316
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L331:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L318:
	vmovsd	(%r9,%rax), %xmm0
	vsubsd	(%rbx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r9,%rax)
	addq	$8, %rax
	cmpq	%r15, %rax
	jne	.L318
	jmp	.L319
	.p2align 4,,10
	.p2align 3
.L320:
	vmovsd	(%r9), %xmm0
	movl	$1, %r10d
	vsubsd	(%rbx), %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
	jmp	.L327
.L343:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE65:
	.size	u_update, .-u_update
	.p2align 4,,15
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB66:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L352
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	8(%rdi,%rax,8), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	8(,%rax,8), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L348:
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	xorl	%esi, %esi
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L348
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L352:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE66:
	.size	set_zeros, .-set_zeros
	.p2align 4,,15
	.globl	verify
	.type	verify, @function
verify:
.LFB67:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L363
	leal	-1(%rdx), %eax
	vmovq	.LC8(%rip), %xmm2
	xorl	%r9d, %r9d
	vmovsd	.LC17(%rip), %xmm1
	leaq	8(,%rax,8), %r8
.L357:
	movq	(%rdi,%r9), %rcx
	movq	(%rsi,%r9), %rdx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L362
	movl	$8, %eax
	jmp	.L359
	.p2align 4,,10
	.p2align 3
.L358:
	vmovsd	(%rcx,%rax), %xmm0
	vsubsd	(%rdx,%rax), %xmm0, %xmm0
	addq	$8, %rax
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L362
.L359:
	cmpq	%rax, %r8
	jne	.L358
	addq	$8, %r9
	cmpq	%r8, %r9
	jne	.L357
.L363:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L362:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE67:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC19:
	.string	"\nResult OK!"
.LC20:
	.string	"\nResult not OK!"
.LC22:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$513, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$29793, %eax
	movb	$0, 55(%rsp)
	movl	$1680762733, 49(%rsp)
	movw	%ax, 53(%rsp)
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %r12
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %rbp
	call	alloc_matrix
	movl	$513, %edx
	movq	%r12, %rdi
	leaq	49(%rsp), %rsi
	movq	%rax, %rbx
	call	read_data
	movq	.LC18(%rip), %rax
	movl	$513, %esi
	movq	%rbx, %rdi
	vmovq	%rax, %xmm0
	call	fill_f
	movl	$513, %esi
	movq	%rbx, %rdi
	call	L2_norm
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	vmovsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$9, %edi
	movq	.LC18(%rip), %rax
	vmovsd	8(%rsp), %xmm1
	vmovq	%rax, %xmm0
	call	multigrid_vcycle
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	movl	$513, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	verify
	testl	%eax, %eax
	jne	.L374
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
.L370:
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	40(%rsp), %xmm0, %xmm0
	vmovsd	.LC21(%rip), %xmm2
	vcvtsi2sdq	16(%rsp), %xmm1, %xmm1
	movl	$1, %edi
	leaq	.LC22(%rip), %rsi
	movl	$1, %eax
	vmulsd	%xmm2, %xmm0, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	24(%rsp), %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$513, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%rbx, %rdi
	call	dealloc_matrix
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L375
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L374:
	.cfi_restore_state
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	jmp	.L370
.L375:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.section	.rodata.str1.1
.LC23:
	.string	"%lf "
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB68:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L383
	leal	-1(%rsi), %eax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	8(%rdi,%rax,8), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	8(,%rax,8), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	.LC23(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L378:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L379:
	movq	(%r14), %rax
	movq	%rbp, %rsi
	movl	$1, %edi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r12
	jne	.L379
	movl	$10, %edi
	addq	$8, %r14
	call	putchar@PLT
	cmpq	%r13, %r14
	jne	.L378
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
.L383:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE68:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	1413754136
	.long	1074340347
	.align 8
.LC6:
	.long	3700601565
	.long	1075168253
	.align 8
.LC7:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC9:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	0
	.long	1074790400
	.section	.rodata.cst32
	.align 32
.LC11:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC12:
	.long	0
	.long	1070596096
	.section	.rodata.cst32
	.align 32
.LC13:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 32
.LC14:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC15:
	.long	0
	.long	1071644672
	.align 8
.LC16:
	.long	0
	.long	1072693248
	.align 8
.LC17:
	.long	2296604913
	.long	1055193269
	.align 8
.LC18:
	.long	0
	.long	1063256064
	.align 8
.LC21:
	.long	2696277389
	.long	1051772663
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
