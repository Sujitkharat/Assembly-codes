section .data
	array dd 5,7,2,9,1,17,0,26,39,13,12,127,101,99,-1
	msg db "%d",10,0
section .text
	global main
	extern printf
main:
	xor ecx, ecx
c1:	mov ebx, dword[array + ecx * 4]
	cmp ebx, -1
	jnz calc
	jmp print
calc:
	mov edx, ecx
t1:	inc edx
	mov edi, dword[array + edx * 4]
	cmp edi, -1
	jz itr
	cmp edi, ebx
	jb swap
	jmp t1
swap:
	xchg edi, ebx
	mov dword[array + edx * 4], edi
	mov dword[array + ecx * 4], ebx
	jmp t1
itr:
	inc ecx
	jmp c1
print:
	xor ecx, ecx
p1:	mov ebx, dword[array + ecx * 4]
	cmp ebx, -1
	jnz print1
	ret
print1:
	pusha
	push ebx
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	jmp p1

