eg-08.s : %.s : %.c stdio.h 
	gcc -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none  --freestanding -S $< -o $@

eg-08_utils.s  : %.s : %.c 
	gcc -m16 -O0 -I. -Wall -fno-pic  -fcf-protection=none --freestanding -S $< -o $@

eg-08_rt0.s  : %.s : %.c 
	gcc -m16 -O0 -I. -Wall -fno-pic  -fcf-protection=none -S $< -o $@

eg-08.o eg-08_utils.o  eg-08_rt0.o : %.o : %.s
	as --32 $*.s -o $@

ifeq (,$(ALT))

eg-08.bin: %.bin :  %.o %_utils.o %.ld | %_rt0.o
	ld -melf_i386 -T $*.ld --orphan-handling=discard  $< -o $@
else

eg-08.bin: %.bin :  %.o %_utils.o %.ld | %_rt0.o
	gcc -m16 -nostdlib -ffreestanding -T eg-08.ld eg-08.o -o eg-08
endif

