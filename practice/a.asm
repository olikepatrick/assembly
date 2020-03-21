
.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
str1 BYTE "Last Week of class and so preparation ",0
str2 BYTE "Before final exam.",0

find proto,
use :ptr BYTE,
target :ptr BYTE

.code
main proc
	call clrscr

	invoke find,addr str2,addr str1
	mov edx,offset str2
	call writestring
	call crlf

	exit
	main endp

find proc,
	use :ptr BYTE,
	target :ptr BYTE

	invoke str_length,target
	add target,eax
	;call writeint

	invoke str_length,use
	mov ecx,eax

	inc ecx
	mov esi,use
	mov edi,target

	cld
	rep movsb
	ret

	find endp
end main