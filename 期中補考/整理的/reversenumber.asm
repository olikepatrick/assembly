Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data

Message1 BYTE "Enter an integer: ", 0dh, 0ah, 0
Message2 BYTE "Reversed Number = ", 0
num DWORD ?
rn DWORD 1000 dup(0)
t DWORD 0

.code 
main proc

	mov edx, OFFSET Message1
	call writestring
	call readint
	mov num, eax
	mov edx, OFFSET Message2
	call writestring

	mov ebx, 10
	mov esi, 0 
	mov edx, 0 

L1:

	.if(eax==0)

		mov ecx, t
		mov esi, 0
		jmp L2
	
	.else
		div ebx
		mov rn[esi], edx
		add esi, type rn
		inc t
		mov edx, 0
		jmp L1

	.endif


L2:
	mov eax, rn[esi]
	add esi, type rn
	call writedec

	
Loop L2
	call crlf
	

	exit
	main endp
end main

