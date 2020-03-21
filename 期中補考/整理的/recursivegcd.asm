Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data
str1 BYTE "Enter two positive integers:",0ah,0dh,0
str2 BYTE "G.C.D of ",0
str3 BYTE " and ",0
str4 BYTE " is ",0
str5 BYTE ".",0ah,0dh,0
n1 DWORD ?
n2 DWORD ?


.code
main PROC
	 call clrscr
	 mov edx,OFFSET str1
	 call writestring
	 call readint
	 mov n1,eax
	 call readint
	 mov n2,eax
	 

	 mov edx,OFFSET str2
	 call writestring
	 mov eax,n1
	 call writedec
	 mov edx,OFFSET str3
	 call writestring
	 mov eax,n2
	 call writedec
	 mov edx,OFFSET str4
	 call writestring

	 mov eax,n1
	 mov ebx,n2
	 mov edx,0
 L1:
	.if(ebx!=0)
		cdq
	 	div ebx
		xchg edx,ebx
	 	mov eax,edx
	.endif
 loop L1

	call writedec
 	mov edx,OFFSET str5
	call writestring


 
	main ENDP
END main