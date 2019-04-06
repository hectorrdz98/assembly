.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc

.data
    exitMsg		BYTE	0dh, 0ah, 0dh, 0ah, "Presiona cualquier tecla para salir...", 0
	rows		BYTE	?
	cols		BYTE	?
	msg1		BYTE	"Num1: ", 0
	msg2		BYTE	"Num2: ", 0
	msg3		BYTE	"Suma: ", 0
	n1			DWORD	?
	n2			DWORD	?
.code

start:                         
    call main   
    call exitProgram               

main proc
	call getCmdDim
	call getMiddle
	call getNums
	call suma
    ret
main endp

getCmdDim proc
	call GetMaxXY
	mov rows,al
	mov cols,dl
	ret
getCmdDim endp

getMiddle proc
	mov edx,4
	mov eax,0
	mov al,rows
	div dl
	mov rows,al
	mov edx,2
	mov eax,0
	mov al,cols
	div dl
	mov cols,al
	ret
getMiddle endp
getNums proc
	; Center cursor
	mov dh,rows	
	mov dl,cols
	call Gotoxy
	; End center

	lea edx,msg1
	call WriteString
	call ReadInt
	mov n1,eax
	
	; Center cursor
	mov dh,rows	
	mov dl,cols
	add dh,1
	call Gotoxy
	; End center

	lea edx,msg2
	call WriteString
	call ReadInt
	mov n2,eax
	ret
getNums endp

suma proc
	mov eax,n1
	add eax,n2

	; Center cursor
	mov dh,rows	
	mov dl,cols
	add dh,3
	call Gotoxy
	; End center

	lea edx,msg3
	call WriteString
	call WriteInt
suma endp

exitProgram proc
    lea edx,exitMsg
    call WriteString
    call ReadChar
    exit
exitProgram endp

end start