
.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


str_nextWord proto,
	pstring: PTR BYTE,
	delimiter: BYTE

.data
	str1 BYTE "Johnson,Calvin,goes,to sleep,by,tonight",0

.code
main PROC
	call clrscr

	mov edx,offset str1
	call writestring
	call crlf

	mov esi,offset str1

	L1:
	invoke str_nextWord,esi,","

	jnz exit_prog
	mov esi,eax
	call writestring
	call crlf
	jmp L1

	exit_prog:
	exit
main ENDP

str_nextWord proc,
	pstring: PTR BYTE,
	delimiter: BYTE

	push esi
	mov al,delimiter
	mov esi,pstring
	cld

	L1:
		lodsb
		cmp al,0
		je L3
		cmp al,delimiter
		jne L1

	L2:
		mov BYTE PTR [esi-1],0
		mov eax,esi
		jmp exit_proc

	L3:
		or al,1

	exit_proc:
		pop esi

	ret
str_nextWord ENDP

END main