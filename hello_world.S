        .code16                # Set 16-bit code

        .global begin          # Linker needs the entry point

begin:	                        # Entry point (and no $$)

        mov   $0xe, %ah        # BIOS tty mode

        mov   $0x0, %bx        # Using linker's org flag

loop:
        mov   msg(%bx), %al    # Offset to the message
        xor   $0x0, %al        # Loop while char is not 0x0
        je    halt             # Jump to halt
        int   $0x10            # Call bios
        inc %bx        # Point to the next character
        jmp   loop             # Repeat until we find a 0x0

halt:
        hlt                    # Halt
        jmp   halt             # Safeguard

msg:                           # NULL terminated string

        .ascii    "Hello World"

        .fill 510 - (. - begin), 1, 0       # Pad with zeros
        .word 0xaa55                        # Boot signature

#modificacoes:
# na linha 13, cmp foi substituido por xor e na linha 16, add foi substituido por um incremento simples e 
#string foi substituido por ascii.

