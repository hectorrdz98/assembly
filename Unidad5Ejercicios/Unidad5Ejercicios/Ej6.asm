.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc

.data
    exitMsg		BYTE	0dh, 0ah, 0dh, 0ah, "Presiona cualquier tecla para salir...", 0
    string		BYTE	10 DUP(?)	; Letras A-Z:  41-5A h; 65-90 d
.code

start:                         
    call main   
    call exitProgram               

main proc
    mov ecx,20
	cicloStrs:
		call generateRStr
		call Crlf
		loop cicloStrs
    ret
main endp

generateRStr proc uses ecx
	mov esi,0
	mov ecx, 10
	ciclo:
		mov eax, 26
		call RandomRange
		add eax,65
		mov string[esi], al
             call WriteChar
		inc esi
		loop ciclo
	ret
generateRStr endp

exitProgram proc
    lea edx,exitMsg
    call WriteString
    call ReadChar
    exit
exitProgram endp

end start