section .data
	array dd 9,8,7,6,5,4,3,2,1,-1
	msg db "%d",10,0
section .bss
	count resd 1
section .text
	global main
	extern printf
main:
	xor ecx, ecx
lp:	mov ebx, dword[array + ecx * 4]
	cmp ebx, -1
	jz sm
	inc ecx
	jmp lp	
sm:
	mov ebx, ecx
	dec ebx
	xor ecx, ecx 
s:	mov edx, dword[array + ecx * 4]
	mov edi, dword[array + ebx *4]
	xchg edx, edi 
	mov dword[array + ecx * 4], edx
	mov dword[array + ebx *4], edi
	inc ecx
	dec ebx
	cmp ecx, ebx
	jl s
	xor ecx, ecx
nn:	mov ebx, dword[array + ecx * 4]
	cmp ebx, -1
	jnz n
	ret
n:	pusha
	push ebx
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	jmp nn
