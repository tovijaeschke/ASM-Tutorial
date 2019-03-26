; calc_str_len.asm
; Prints calculates the length of the string "Hello, world!" and prints to stdout
; Compile with "nasm -f elf64 calc_str_len.asm && ld calc_str_len.o -o calc_str_len" 

.text:
	global _start

_start:
	mov rax, msg      ; move msg to rax register
	call strlen       ; call strlen subroutine

	mov rax, 1        ; system call for write
	mov rdi, 1        ; file handle for stdout
	syscall           ; call kernel

	mov rax, 60       ; system call for exit
	mov rdi, 0        ; exit code
	syscall           ; call kernel


strlen:
	push rax          ; push rax to stack
	mov rbx, rax      ; move rax value (msg variable) to rbx register

calc_str_len:
	cmp byte [rax], 0 ; check if the pointer of rax equals 0 (string delimeter)
	jz exit_loop      ; jump to "exit_loop" if zero flag has been set
	inc rax           ; increment rax (position along string)
	jmp calc_str_len  ; jump to start of loop

exit_loop:
	sub rax, rbx      ; subtract rbx from rax to equal to length of bytes between them
	mov rdx, rax      ; rax will now equal the length of the string
	pop rsi           ; pop top value on stack to rsi for printing
	ret

.data:
	; initialize doubleword msg variable
	msg db 'Hello, world!',0xa,0x0
