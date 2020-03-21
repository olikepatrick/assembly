
.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
str1 byte "Enter a string: ",0ah,0dh,0
str2 byte "Enter a character to find the frequency: ",0ah,0dh,0
str3 byte "Frequency of ",0
str4 byte " = ",0
astring byte 1000 dup(?)
len dword ?
total dword 0
char byte ?


find proto,
string:ptr byte,
target:byte

.code
main proc
	call clrscr

	mov edx,offset str1
	call writestring

	mov ecx,1000
	mov edx,offset astring
	call readstring
	mov len,eax
	
	mov edx,offset str2
	call writestring

	call readchar
	mov char,al
	call writechar
	call crlf


	invoke find,addr astring,char

	mov edx,offset str3
	call writestring

	mov al,char
	call writechar
	

	mov edx,offset str4
	call writestring

	mov eax,total
	call writedec

	exit
	main endp

find proc,
	string:ptr byte,
	target:byte

	mov ecx,len
	mov esi,string
	mov ebx,0

	L1:
	mov bl,[esi]
	mov al,target
	cmp al,bl

	je thesame
	jmp others

	thesame:
		add total,1
	others:
		add esi,1

	loop L1

	ret
	find endp
end main