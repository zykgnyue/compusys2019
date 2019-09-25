	.file	"arithmicAsm.c"
	.text
	.globl	movword
	.type	movword, @function
movword:
.LFB0:
	.cfi_startproc
	movzwl	%di, %eax
	movq	%rax, (%rsi)
	leal	2(%rdi), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	movword, .-movword
	.globl	m12
	.type	m12, @function
m12:
.LFB1:
	.cfi_startproc
	leaq	(%rdi,%rdi,2), %rdx
	leaq	0(,%rdx,4), %rax
	ret
	.cfi_endproc
.LFE1:
	.size	m12, .-m12
	.globl	arith
	.type	arith, @function
arith:
.LFB2:
	.cfi_startproc
	leaq	(%rdi,%rsi), %rax
	addq	%rdx, %rax
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	leaq	4(%rdi,%rcx), %rdx
	imulq	%rdx, %rax
	ret
	.cfi_endproc
.LFE2:
	.size	arith, .-arith
	.globl	logical
	.type	logical, @function
logical:
.LFB3:
	.cfi_startproc
	movq	%rdi, %rax
	xorq	%rsi, %rax
	sarq	$17, %rax
	andl	$8185, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	logical, .-logical
	.globl	gt
	.type	gt, @function
gt:
.LFB4:
	.cfi_startproc
	cmpq	%rsi, %rdi
	setg	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE4:
	.size	gt, .-gt
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
