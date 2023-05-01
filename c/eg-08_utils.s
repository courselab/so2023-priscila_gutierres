	.file	"eg-08_utils.c"
	.code16gcc
	.text
	.globl	puts
	.type	puts, @function
puts:
.LFB0:
	.cfi_startproc
	movl	%ecx, %edx
	movl	%edx, %ebx
#APP
# 10 "eg-08_utils.c" 1
		mov   $0x0e, %ah           
	mov   $0x0, %si            
loop7:	          		    
	mov   (%bx, %si), %al    
	xor   $0x0, %al	    
	je    end7                 
	int   $0x10	            
	add   $0x1, %si	    
	jmp   loop7	            
end7:                              
        mov   %si, %ax            
        ret                         

# 0 "" 2
#NO_APP
	nop
	ud2
	.cfi_endproc
.LFE0:
	.size	puts, .-puts
	.ident	"GCC: (GNU) 12.2.1 20221121 (Red Hat 12.2.1-4)"
	.section	.note.GNU-stack,"",@progbits
