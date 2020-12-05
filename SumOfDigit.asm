section .data
	msg1 db "Enter a number to add digits:",10,0
	store db "%d",0
	msg2 db "Addition of digits is : %d .",10,0
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
	mov eax, dword[num]
	xor ecx, ecx
	mov ebx, 10
lp1:	xor edx, edx	
	cmp eax, 0
	jz print	
	div ebx
	add ecx, edx
	jmp lp1
print:
	push ecx
	push msg2
	call printf
	add esp, 8
