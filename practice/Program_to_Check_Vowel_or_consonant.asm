.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
str1 byte "Enter an alphabet: ",0
str2 byte " is a vowel.",0ah,0dh,0
str3 byte " is a consonant.",0ah,0dh,0
astring byte "aeiouAEIOU",0ah,0dh,0
char byte ?

find proto,
	use:ptr byte,
	target:byte

.code
main proc
	call clrscr

	mov edx,offset str1
	call writestring
	
	call readchar
	mov char,al
	call writechar
	call crlf

	invoke find,addr astring,char

	.if(ebx==1)
		mov al,char
		call writechar
		mov edx,offset str2
		call writestring
	.else
		mov al,char
		call writechar
		mov edx,offset str3
		call writestring
	.endif

	exit
	main endp

find proc,
	use:ptr byte,
	target:byte

	mov eax,0
	mov ebx,0
	mov esi,use
	mov ecx,10
	
	L1:
		mov al,target
		cmp al,[esi]

		je thesame
		jmp others

	thesame:
		mov ebx,1
	others:
		add esi,1

	loop L1

	ret
	find endp
end main