	.file	"inlasm.c"
	.text
	.globl	inlineasm
	.type	inlineasm, @function
inlineasm:
.LFB24:
	.cfi_startproc
	movl	$10, %edx
#APP
# 12 "inlasm.c" 1
	movl %edx, %eax; 
	         movl %eax, %edx;
# 0 "" 2
#NO_APP
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	inlineasm, .-inlineasm
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Test inline asm!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	call	inlineasm
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
