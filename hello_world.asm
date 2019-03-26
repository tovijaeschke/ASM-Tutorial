; hello_world.asm
; Prints "Hello, world!" in 64 bit linux assembly written in intel syntax
; Compile with "nasm -f elf64 hello_world.asm && ld hello_world.o -o hello_world" 

.text:
	global _start

_start:
	mov rax, 1   ; system call for write
	mov rdi, 1   ; file handle for stdout
	mov rsi, msg ; move msg variable to rsi register for printing
	mov rdx, 14  ; length of the string
	syscall      ; call kernel

	mov rax, 60  ; system call for exit
	mov rdi, 0   ; exit code
	syscall      ; call kernel

.data:
	; initialize doubleword msg variable
	msg db 'Hello, world!',0xa
