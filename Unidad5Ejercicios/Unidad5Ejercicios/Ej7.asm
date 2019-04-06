.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc

.data
	char		BYTE	48h
	rows		BYTE	25
	cols		BYTE	80
.code

start:                         
    call main   
    call exitProgram               

main proc
	mov ecx,100
	ciclo:
		call newPos

		mov al,char
		call WriteChar
		loop ciclo
    ret
main endp

newPos proc
	call Randomize

	mov eax,0
	mov al,rows
	call RandomRange
	mov dh,al

	mov eax,0
	mov al,cols
	call RandomRange
	mov dl,al

	call Gotoxy
	ret
newPos endp

exitProgram proc
    call ReadChar
    exit
exitProgram endp

end start