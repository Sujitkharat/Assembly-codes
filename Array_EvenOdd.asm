section .data
	msg1 dd 1,2,3,4,5,6,7,8,9,10,-1
	msg2 db "%d is even.",10,0
	msg3 db "%d is odd.",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx
lp:	mov ebx, dword[msg1 + ecx *4]
	cmp ebx, -1
	jz end
	mov esi, 2
	xor edx, edx
	mov eax, ebx
	div esi
	cmp edx, 0
	jnz odd
	pusha
	push ebx
	push msg2
	call printf
	add esp, 8
	popa
	inc ecx
	jmp lp
odd:
	pusha
	push ebx
	push msg3
	call printf
	add esp, 8
	popa
	inc ecx
	jmp lp
	
end : ret
	
