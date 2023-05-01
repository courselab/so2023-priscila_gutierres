
/* A function-which prints pointed by str using BIOS' int 0x10 service. 

   This function clobbers eax, ebx, ecx and esi.
*/


int __attribute__((fastcall, naked))  puts(const char* s)
{
__asm__ volatile
("\
	mov   $0x0e, %%ah           \n\
	mov   $0x0, %%si            \n\
loop%=:	          		    \n\
	mov   (%%bx, %%si), %%al    \n\
	xor   $0x0, %%al	    \n\
	je    end%=                 \n\
	int   $0x10	            \n\
	add   $0x1, %%si	    \n\
	jmp   loop%=	            \n\
end%=:                              \n\
        mov   %%si, %%ax            \n\
        ret                         \n\
"
:				      /* No ouptut parameters. */
: "b" (s)	                      /* Var. s put in bx, referenced as str.*/
: "ax", "cx", "si"       	      /* Clobbred registers (bx is input).   */
 );
}


/* Notes.

   Function 'int puts(const char *s)' of standard C and POSIX specifications
   returns the number of printed characters. 
*/