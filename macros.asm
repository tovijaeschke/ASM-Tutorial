; Collection of Assembly macros to make programming in assembly easier
; Include it with "%include 'macros.asm'

section .data
	newline db 0xA,0x0

	; Macro to calculate string length and print to stdout
	%macro printStr 1
		;; Store previous data
		push rax
		push rbx
		push rcx
		push rdx
		push rdi
		push rsi

		;; Move first arg to rax
		mov rax, %1
		;; push rax to stack
		push rax
		;; move 0 to rbx for loop counter
		mov rbx,0
		;; counts letters
		%%printLoop:
			inc rax
			inc rbx
			mov cl,[rax]
			cmp cl,0
			jne %%printLoop
			;; sys_write
			mov rax,1
			mov rdi,1
			pop rsi
			mov rdx,rbx
			syscall

		;; pop values back to registers

		pop rsi
		pop rdi
		pop rdx
		pop rcx
		pop rbx
		pop rax

	%endmacro
	
	%macro printStrLF 1
		push rax
		mov rax,%1
		printStr rax
		printStr newline
		pop rax
	%endmacro

	%macro printInt 1
		push    rax
		push    rcx
		push    rdx
		push    rsi

		mov rax,%1
		mov     rcx, 0
 
		%%divideLoop:
			inc     rcx
			mov     rdx, 0
			mov     rsi, 10
			idiv    rsi
			add     rdx, 48
			push    rdx
			cmp     rax, 0
			jnz     %%divideLoop
	 
		%%printLoop:
			dec     rcx
			mov     rax, rsp
			printStr rax
			pop     rax
			cmp     rcx, 0
			jnz     %%printLoop
		
		pop     rsi
		pop     rdx
		pop     rcx
		pop     rax

	%endmacro

	%macro printIntLF 1
		push rax
		mov rax, %1
		printInt rax
		printStr newline
		pop rax
	%endmacro

	%macro exit 1
		mov rax,60
		mov rdi,%1
		syscall
	%endmacro

