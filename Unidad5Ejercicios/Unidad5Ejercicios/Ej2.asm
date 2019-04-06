.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc

.data
    exitMsg		BYTE	0dh, 0ah, "Presiona cualquier tecla para salir...", 0
.code

start:                         
    call main   
    call exitProgram               

main proc
	
    ret
main endp

exitProgram proc
    lea edx,exitMsg
    call WriteString
    call ReadChar
    exit
exitProgram endp

end start