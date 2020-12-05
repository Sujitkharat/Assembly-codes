section .data
		msg db "%d",10,0
		a dd 0
		b dd 1
		msg2 db "Enter how many numbers you want to print from this series: ",10,0
		msg3 db "%d",0
section .bss
		num resd 1
section .text
		global main
		extern printf,scanf
main:	
		push msg2
		call printf
		add esp,4
		
		push num
		push msg3
		call scanf
		add esp,8
		
		push dword[a]
		push msg
		call printf
		add esp,8
		push dword[b]
		push msg
		call printf
		add esp,8
lp1:		mov eax, dword[a]
		mov ebx, dword[b]
		add eax, ebx
		mov dword[a], ebx
		mov dword[b], eax
		push dword[b]
		push msg
		call printf
		add esp,8
		dec dword[num]
		cmp dword[num],2
		jnz lp1

