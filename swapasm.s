	.file	"swapasm.c"
	.text
	.globl	inplace_swap
	.type	inplace_swap, @function
inplace_swap:
.LFB1:
	.cfi_startproc
	movq	(%rsi), %rax
	xorq	(%rdi), %rax
	movq	%rax, (%rdi)
	xorq	(%rsi), %rax
	movq	%rax, (%rsi)
	xorq	%rax, (%rdi)
	ret
	.cfi_endproc
.LFE1:
	.size	inplace_swap, .-inplace_swap
	.globl	swap
	.type	swap, @function
swap:
.LFB2:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	%rax, (%rsi)
	ret
	.cfi_endproc
.LFE2:
	.size	swap, .-swap
	.globl	test_swap
	.type	test_swap, @function
test_swap:
.LFB0:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movabsq	$1234605616436508552, %rax
	movq	%rax, 8(%rsp)
	movabsq	$-7373874951294615808, %rax
	movq	%rax, 16(%rsp)
	leaq	16(%rsp), %rsi
	leaq	8(%rsp), %rdi
	call	swap
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L6
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE0:
	.size	test_swap, .-test_swap
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
