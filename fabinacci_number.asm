.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data

str1 BYTE "Enter N to calculate the Fib(N)",0dh,0ah,0
str2 BYTE "calculate Fibonacci of Fib(N)",0ah,0dh,0
num DWORD ?

.code
main proc
	call clrscr
	mov edx, OFFSET str1
	call writestring
	call readint
	mov edx,OFFSET str2
	call writestring

	mov ecx,eax
	mov eax,1
	mov ebx,1
	call writedec
	call crlf
	sub ecx,1

	L1:
	call writedec
	call crlf
	mov num,eax
	add eax,ebx
	mov ebx,num
	loop L1

	exit
 main endp
end main