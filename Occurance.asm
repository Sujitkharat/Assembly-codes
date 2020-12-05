section .data
		Mynumber dd 1,2,2,3,2,-1
		find dd 129
		msg1 db "found %d times:",10,0
		msg2 db "Enter number to find occurances in the array:",10,0
		msg3 db "%d",0
section .bss
		num resd 1
section .text

		global main
		extern printf,puts,scanf
main:	
		push msg2
		call puts
		add esp, 4
		push num
		push msg3
		call scanf
		add esp,8
		
		xor edi, edi
		xor ecx, ecx						
lp1:		mov ebx, dword[Mynumber + ecx * 4]
		cmp ebx, -1
		jnz check
		jmp end
check:									
		cmp ebx, dword[num]
		jnz t2
		inc edi
t2:		inc ecx
		jmp lp1
end:		push edi
		push msg1
		call printf
		add esp,8
