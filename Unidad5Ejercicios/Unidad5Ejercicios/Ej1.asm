.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc

.data
    exitMsg		BYTE	0dh, 0ah, "Presiona cualquier tecla para salir...", 0
	texto		BYTE	"Este texto es de diferentes colores :)", 0dh, 0ah, 0
	color		DWORD	2h
	DefaultColor = lightGray + (black * 16)
.code

start:                         
    call main   
    call exitProgram               

main proc
	mov ecx,4
	lea edx,texto
	imprimir:
		mov eax,color
		call SetTextColor
		call WriteString
		inc color
		loop imprimir
	mov eax,DefaultColor
	call SetTextColor
    ret
main endp

exitProgram proc
    lea edx,exitMsg
    call WriteString
    call ReadChar
    exit
exitProgram endp

end start