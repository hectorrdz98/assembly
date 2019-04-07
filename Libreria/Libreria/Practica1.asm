.486

include C:\Irvine\Irvine32.inc

includelib C:\masm32\lib\msvcrt.lib

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Users\1ZW05LA_RS4\Documents\Code\2019\Assembly\Libreria\Libreria\hd.inc



.data
	exitMsg db 0dh, 0ah, "Presiona cualquier tecla para salir...", 0

	msg1 db "El factorial de ",0
	msg2 db " es: ",0
	num dword 1

	msg3 db "El valor absoluto de ",0

	msg4 db " elevado a ",0

	msg5 db "Array: ",0
	arr1 dword 1,2,3,1,2,3
	arr2 dword ($-arr1)/4 dup(?)

	msg6 db "Suma: ",0
	msg7 db "Producto: ",0
	msg8 db "Maximo: ",0
	msg9 db "Minimo: ",0

	msg10 db "Array de menor a mayor: ",0
	msg11 db "Array de mayor a menor: ",0
.code

start:

	call example1
	call Crlf

	call example2
	call Crlf

	call example3
	call Crlf

	call printArr
	call Crlf

	call example4
	call Crlf

	call example5
	call Crlf

	call example6
	call Crlf

	call example7
	call Crlf

	call Crlf
	call fillArr2
	hd_arrSortAsc arr2
	call example8
	call printArr2

	call fillArr2
	hd_arrSortDesc arr2
	call example9
	call printArr2
	call Crlf


	call Crlf
	call exitProgram
	ret

exitProgram proc
	lea edx, exitMsg
    call WriteString
    call ReadChar
    exit
	ret
exitProgram endp

example1 proc
	pushad
	mov ecx,5
	ciclo:
		lea edx, msg1
		call WriteString
		mov eax, num
		call WriteDec
		lea edx, msg2
		call WriteString

		hd_factorial num
		call WriteDec
		call Crlf

		inc num
		loop ciclo
	popad
	ret
example1 endp


example2 proc
	pushad
	mov ebx,4
	lea edx, msg3
	call WriteString
	mov eax, ebx
	call WriteInt
	lea edx, msg2
	call WriteString

	hd_abs ebx
	call WriteInt
	call Crlf

	mov ebx,-4
	lea edx, msg3
	call WriteString
	mov eax, ebx
	call WriteInt
	lea edx, msg2
	call WriteString

	hd_abs ebx
	call WriteInt
	call Crlf
	
	popad
	ret
example2 endp


example3 proc
	pushad
	mov num,1
	mov ebx,3
	mov ecx,5
	ciclo:
		mov eax, num
		call WriteDec
		lea edx, msg4
		call WriteString
		mov eax, ebx
		call WriteDec
		lea edx, msg2
		call WriteString

		hd_pow num, ebx

		call WriteDec
		call Crlf

		inc num
		loop ciclo
	popad
	ret
example3 endp

printArr proc
	pushad
	mov ecx, lengthof arr1 
	mov esi, 0
	lea edx, msg5
	call WriteString
	ciclo:
		mov eax, arr1[esi]
		call WriteDec
		mov al, ' '
		call WriteChar
		add esi, type arr1
		loop ciclo
	call Crlf
	popad
	ret
printArr endp

printArr2 proc
	pushad
	mov ecx, lengthof arr2
	mov esi, 0
	ciclo:
		mov eax, arr2[esi]
		call WriteDec
		mov al, ' '
		call WriteChar
		add esi, type arr2
		loop ciclo
	call Crlf
	popad
	ret
printArr2 endp

example4 proc
	pushad

	lea edx, msg6
	call WriteString

	hd_arrSum arr1
	call WriteDec

	popad
	ret
example4 endp

example5 proc
	pushad

	lea edx, msg7
	call WriteString

	hd_arrProd arr1
	call WriteDec

	popad
	ret
example5 endp

example6 proc
	pushad

	lea edx, msg8
	call WriteString

	hd_arrMax arr1
	call WriteDec

	popad
	ret
example6 endp

example7 proc
	pushad

	lea edx, msg9
	call WriteString

	hd_arrMin arr1
	call WriteDec

	popad
	ret
example7 endp

fillArr2 proc
	pushad
	mov ecx, lengthof arr1
	mov esi, 0
	ciclo:
		mov eax, arr1[esi]
		mov arr2[esi], eax
		add esi, type arr1
		loop ciclo
	popad
	ret
fillArr2 endp

example8 proc
	pushad
	lea edx, msg10
	call WriteString
	popad
	ret
example8 endp

example9 proc
	pushad
	lea edx, msg11
	call WriteString
	popad
	ret
example9 endp

end start