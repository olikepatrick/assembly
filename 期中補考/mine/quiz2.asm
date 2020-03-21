
.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data
str1 BYTE "Enter a string: ",0ah,0dh,0
str2 BYTE "turn into: ",0ah,0dh,0
str3 BYTE "Total: ",0ah,0dh,0
aString BYTE 100 DUP(?)
len dword ?
total dword 0

find proto,
use :ptr BYTE,
target :dword

.code
main proc
	call clrscr

	mov edx,offset str1
	call writestring

	mov ecx,100
	mov edx,offset aString
	call readstring
	mov len,eax

	invoke find,addr aString,len

	mov edx,offset str2
	call writestring

	mov edx,offset astring
	call writestring
	call crlf

	mov eax,total
	call writedec

exit
main endp

find proc,
	use: ptr BYTE,
	target: dword

	mov ecx,target
	mov esi,use
	mov eax,0
	mov ebx,0

	L1:
	mov al,[esi]
	mov bl,'\'
	cmp al,bl

	je thesame
	jmp others

	thesame:
		add total,1
		mov al," "
		mov [esi],al
	others:
		add esi,type aString

loop L1
ret
find endp
end main