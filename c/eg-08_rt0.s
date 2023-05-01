	.file	"eg-08_rt0.c"
	.code16gcc
	.text
	.globl	_start
	.type	_start, @function
_start:
.LFB0:
	.cfi_startproc
#APP
# 14 "eg-08_rt0.c" 1
	             mov  $__END_STACK__ , %sp  
             call main                  
halt:                                   
             hlt                        
             jmp halt                   

# 0 "" 2
#NO_APP
	nop
	ud2
	.cfi_endproc
.LFE0:
	.size	_start, .-_start
	.ident	"GCC: (GNU) 12.2.1 20221121 (Red Hat 12.2.1-4)"
	.section	.note.GNU-stack,"",@progbits
