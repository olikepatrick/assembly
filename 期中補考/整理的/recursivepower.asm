Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data

Message1 BYTE "Enter base number: ", 0dh ,0ah, 0
Message2 BYTE "Enter power number(positive number)", 0dh, 0ah, 0
Message3 BYTE "^", 0
Message4 BYTE " = ", 0 
base DWORD ?
pow DWORD ?


.code
main proc

	mov edx, OFFSET Message1
	call writestring
	call readint
	mov base, eax
	mov edx, OFFSET Message2
	call writestring
	call readint
	mov pow, eax
	mov eax, base
	call writedec
	mov edx, OFFSET Message3
	call writestring
	mov eax, pow
	call writedec
	mov edx, OFFSET Message4
	call writestring


	mov ebx, pow 
	mov eax, base
	
L1:
	.if(ebx==1)
		jmp L2
	.else
		mul base	
		dec ebx
	.endif
Loop L1

L2:
	call writedec
	call crlf

	main endp
end main