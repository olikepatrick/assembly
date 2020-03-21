Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data

Message1 BYTE "Enter a postive integer: ",0dh,0ah,0
Message2 BYTE "Sum=",0
num DWORD ?
sum DWORD 0


.code
main proc
	mov edx, OFFSET Message1
	call writestring
	call readint
	mov ebx, eax
	
L1:
	.if(ebx==0)
		jmp L2
	.else
		dec ebx
		add eax, ebx
		mov sum, eax
	.endif
loop L1

	
L2:
	mov edx, OFFSET Message2
	call writestring
	mov eax, sum
	call writedec
	call crlf

	main endp
end main
