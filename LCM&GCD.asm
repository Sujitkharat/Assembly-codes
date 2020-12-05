section .data
	msg1 db "Enter first number",10,0
	msg2 db "Enter second number",10,0
	store db "%d",0
	result db "LCM is : %d and GCD is : %d",10,0
section .bss
	num1 resd 1
	num2 resd 1
	lcm resd 1
	gcd resd 1
	min resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg1
	call printf
	add esp,4
	
	push num1
	push store
	call scanf
	add esp, 8
	
	push msg2
	call printf
	add esp,4
	
	push num2
	push store
	call scanf
	add esp, 8
	mov eax, dword[num1]
	mov ebx, dword[num2]
	cmp eax, ebx
	jg n
	mov dword[min], eax
	jmp pr
n:	mov dword[min], ebx
pr:	mov ecx, dword[min]
	mov esi,1
ni:	mov eax, dword[num1]
	xor edx,edx
	div esi
	cmp edx,0
	jz some
	inc esi
	cmp esi,ecx
	jnz ni
	jmp seelcm
some:
	mov eax, dword[num2]
	xor edx,edx
	div esi
	cmp edx,0
	jz update
	inc esi
	cmp esi,ecx
	jnz ni
	jmp seelcm
update:
	mov dword[gcd], esi
	inc esi
	jmp ni
seelcm:
	mov eax, dword[num1]
	mov ebx, dword[num2]
	mul ebx
	mov esi,dword[gcd]
	div esi
	mov dword[lcm], eax
	
	push dword[gcd]
	push dword[lcm]
	push result
	call printf
	add esp, 12
	ret
