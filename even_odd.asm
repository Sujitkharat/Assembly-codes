section .data
	msg1 db "Enter a number to check even or odd:",10,0
	store db "%d",0
	msg2 db "Number is even.",10,0
	msg3 db "Number is odd.",10,0
section .bss
	num resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg1
	call printf
	add esp, 4
	push num
	push store
	call scanf
	add esp, 8
	mov ecx, 2
	mov eax, dword[num]
	xor edx, edx
	div ecx
	cmp edx, 0
	jz even
	jmp odd
even:
	push msg2
	call printf
	add esp, 4
	ret
odd:
	push msg3
	call printf
	add esp, 4
	ret
