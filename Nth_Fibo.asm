section .data
		msg db "%dth fibo number is :%d",10,0
		msg2 db "Enter index of number you want to print from the fibo series:",10,0
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
		mov ecx, dword[num]
		
		xor eax, eax
		mov ebx, 1
lp1:		add eax, ebx
		xchg eax,ebx
		dec ecx
		cmp ecx, 2
		jnz lp1
		
		push ebx
		push dword[num]
		push msg
		call printf
		add esp,12
