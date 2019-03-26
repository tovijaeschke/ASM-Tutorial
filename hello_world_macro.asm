; hello_world_macro.asm
; Prints "Hello, world!" using Assembly macros
; Compile with "nasm -f elf64 hello_world_macro.asm && ld hello_world_macro.o -o hello_world_macro" 

%include 'macros.asm'

.text:
	global _start

_start:
	printStr msg
	exit 0

.data:
	; initialize doubleword msg variable
	msg db 'Hello, world!',0x0
