section .data
	msg1 db "Enter a number to find its factorial:",10,0
	store db "%d",0
	msg2 db "factorial is : %d",10,0
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
	mov ecx, dword[num]
	mov eax, 1
lp1:	mul ecx
	cmp ecx, 1
	jz print
	dec ecx
	jmp lp1
print:
	push eax
	push msg2
	call printf
	add esp, 8
