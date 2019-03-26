; fizzbuzz.asm
; Prints numbers 1 to 100, however if the number is a multiple of 3 it will print Fizz,
; and if the number is a multiple of 5 it will print Buzz. If the number is a multiple
; of both, it will print FizzBuzz
; Compile with "nasm -f elf64 fizzbuzz.asm && ld fizzbuzz.o -o fizzbuzz" 

%include 'macros.asm'

.text:
	global _start

_start:
	mov rcx,0 ; counter
	mov rsi,0 ; fizz check
	mov rdi,0 ; buzz check

loop:
	inc rcx

check_fizz:
	mov rdx,0
	mov rax,rcx
	mov rbx, 3
	div rbx
	mov rsi,rdx
	cmp rsi,0
	jne check_buzz
	printStr f

check_buzz:
	mov rdx,0
	mov rax,rcx
	mov rbx, 5
	div rbx
	mov rdi,rdx
	cmp rdi,0
	jne check_int
	printStr b

check_int:
	cmp rsi,0
	je cont
	cmp rdi,0
	je cont
	printInt rcx

cont:
	printStr n 
	cmp rcx,99
	jle loop
	exit 0

.data:
	; initialize doubleword msg variable
	f db 'Fizz',0x0
	b db 'Buzz',0x0
	n db 0xA,0x0
