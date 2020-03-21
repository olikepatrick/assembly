Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data

	Message1 	BYTE 	"Enter two positive integer: ",0dh,0ah,0
	Message2 	BYTE 	"The LCM of ",0
	Message3 	BYTE 	" and ",0
	Message4 	BYTE 	" is: ",0
	n1			dword	?
	n2			dword	?
	flag		dword	0
	number 		dword  	?

.code
main proc
	call clrscr

	call readint
	mov n1,		eax
	call readint
	mov n2,		eax
	
	mov ebx,	n1
	inc ebx
	mov eax,	n2
	sub	eax,	n1
	dec	eax
	mov ecx,	eax

L1:
	call	checkprimenumber
.if(flag == 0)
	mov eax,	ebx
	call writeint
	call crlf
.else
	
	mov flag,	0	
.endif
	inc ebx

	loop	L1


	exit
	main endp

checkprimenumber	proc

	push ebx
	push ecx
	mov number,	ebx
	mov eax,	number
	mov ecx,	ebx
	sub	ecx,	2
	mov eax,	ecx
	mov ebx,	2
	mov edx,	0

L2:
	div ebx
	mov eax,	edx
.if(edx ==	0)
	mov flag,	1
	jmp L3

.else
	mov eax,	number
	inc ebx
	mov edx,	0
.endif
	loop L2
	

L3:
	pop	ecx
	pop	ebx
	ret
	checkprimenumber endp
	end main