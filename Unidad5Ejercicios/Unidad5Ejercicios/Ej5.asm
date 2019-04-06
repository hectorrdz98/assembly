.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc

.data
    exitMsg		BYTE	0dh, 0ah, 0dh, 0ah, "Presiona cualquier tecla para salir...", 0
    num		DWORD	0
.code

start:                         
    call main   
    call exitProgram               

main proc
	mov ecx,50
	ciclo:
		mov eax,ecx
		call WriteDec
		mov al,':'
		call WriteChar
		mov al,' '
		call WriteChar

		mov ebx,-300		;Lower bound
		mov eax,100			;Upper bound
		call BetterRandomRange

		call WriteInt
		call Crlf
		loop ciclo
    ret
main endp

BetterRandomRange proc uses ecx
	call Randomize
	sub	eax,ebx
	call RandomRange
	add eax,ebx
	ret
BetterRandomRange endp

exitProgram proc
    lea edx,exitMsg
    call WriteString
    call ReadChar
    exit
exitProgram endp

end start