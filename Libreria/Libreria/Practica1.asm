.486

include C:\Irvine\Irvine32.inc

includelib C:\masm32\lib\msvcrt.lib

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Users\1ZW05LA_RS4\Documents\Code\2019\Assembly\Libreria\Libreria\hd.inc



.data
	msg1 db "El factorial de ",0
	msg2 db " es: ",0
	num dword 1

	msg3 db "El valor absoluto de ",0

	msg4 db " elevado a ",0

	msg5 db "Array: ",0
	arr1 dword 3,6,8,2

	msg6 db "Suma: ",0
	msg7 db "Producto: ",0
	msg8 db "Maximo: ",0
	msg9 db "Minimo: ",0
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

	call Crlf
	call WaitMsg

	ret

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

example4 proc
	pushad

	lea edx, msg6
	call WriteString

	hd_arrMax arr1
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

end start