section .data
	array dd 2,3,4,5,7,-1
	msg db "Second maximum is : %d",10,0
section .bss
	max resd 1
	smax resd 1
section .text
	global main
	extern printf
main:
	mov ebx, dword[array]
	mov dword[max], ebx
	mov ecx, 1 
lp:	mov ebx, dword[array+ ecx *4]
	cmp ebx, -1
	jnz ff
	jmp sec
ff:
	cmp dword[max], ebx
	jnb t
	mov dword[max],ebx
t:	inc ecx
	jmp lp
		
sec:	mov esi, dword[max]
	mov ebx, dword[array]
	mov dword[smax], ebx
	mov ecx, 1 
lp1:	mov ebx, dword[array+ ecx *4]
	cmp ebx, -1
	jnz fse
	jmp print
fse:
	cmp esi, ebx
	jz t2
	cmp dword[smax], ebx
	jnb t2
	mov dword[smax],ebx
t2:	inc ecx
	jmp lp1
		
print:push dword[smax]
	push msg
	call printf
	add esp,8
	
