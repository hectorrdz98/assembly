.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc

.data
    exitMsg		BYTE	0dh, 0ah, 0dh, 0ah, "Presiona cualquier tecla para salir...", 0
	char		BYTE	48h
	cont		DWORD	0
	DefaultColor = lightGray + (black * 16)
.code

start:                         
    call main   
    call exitProgram               

main proc
	mov ecx,256
	mov eax,0
	call SetTextColor
	ciclo:
		mov eax,0
		mov al,char
		call WriteChar
		inc cont
		call changeColor
		loop ciclo
	mov eax,DefaultColor
	call SetTextColor
    ret
main endp

changeColor proc
	mov edx,16
	mov eax,cont
	div dl
	cmp ah,0
	jne seguir
	call Crlf
	seguir:
	mov eax,cont
	call SetTextColor
	ret
changeColor endp	

exitProgram proc
    lea edx,exitMsg
    call WriteString
    call ReadChar
    exit
exitProgram endp

end start