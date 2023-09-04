	.file	"pregunta2.c"
	.text
	.globl	_suma_divisores
	.def	_suma_divisores;	.scl	2;	.type	32;	.endef
_suma_divisores:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	$1, -8(%ebp)
	jmp	L2
L4:
	movl	8(%ebp), %eax
	cltd
	idivl	-8(%ebp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	L3
	movl	-8(%ebp), %eax
	addl	%eax, -4(%ebp)
L3:
	addl	$1, -8(%ebp)
L2:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	-8(%ebp), %eax
	jge	L4
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
LC0:
	.ascii "Deficiente\0"
LC1:
	.ascii "Perfecto\0"
LC2:
	.ascii "Abundante\0"
	.text
	.globl	_clasificar_numero
	.def	_clasificar_numero;	.scl	2;	.type	32;	.endef
_clasificar_numero:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_suma_divisores
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	L7
	movl	$LC0, %eax
	jmp	L8
L7:
	movl	-4(%ebp), %eax
	cmpl	8(%ebp), %eax
	jne	L9
	movl	$LC1, %eax
	jmp	L8
L9:
	movl	$LC2, %eax
L8:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC3:
	.ascii "El arreglo es: \0"
LC4:
	.ascii "%d \0"
LC5:
	.ascii "%d - %s\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$96, %esp
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, 92(%esp)
	jmp	L11
L12:
	call	_rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	1(%eax), %edx
	movl	92(%esp), %eax
	movl	%edx, 24(%esp,%eax,4)
	addl	$1, 92(%esp)
L11:
	cmpl	$14, 92(%esp)
	jle	L12
	movl	$LC3, (%esp)
	call	_printf
	movl	$0, 88(%esp)
	jmp	L13
L14:
	movl	88(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	addl	$1, 88(%esp)
L13:
	cmpl	$14, 88(%esp)
	jle	L14
	movl	$10, (%esp)
	call	_putchar
	movl	$0, 84(%esp)
	jmp	L15
L16:
	movl	84(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, (%esp)
	call	_clasificar_numero
	movl	%eax, %edx
	movl	84(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	addl	$1, 84(%esp)
L15:
	cmpl	$14, 84(%esp)
	jle	L16
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
