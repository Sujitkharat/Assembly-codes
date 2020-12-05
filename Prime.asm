section .data
	msg1 db "Enter a number to check its prime or not:",10,0
	store db "%d",0
	msg2 db "%d is a prime number.",10,0
	msg3 db "%d is not a prime number.",10,0
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
	mov edi, dword[num]
	dec edi
	cmp dword[num], 2
	jz prime
	mov ecx, 2
lp1:	mov eax, dword[num]
	xor edx, edx
	div ecx
	cmp edx, 0
	jz notprime
	cmp ecx, edi
	jz prime
	inc ecx
	jmp lp1

notprime:
	push dword[num]
	push msg3
	call printf
	add esp, 8
	ret
prime:
	push dword[num]
	push msg2
	call printf
	add esp, 8
	ret
	
