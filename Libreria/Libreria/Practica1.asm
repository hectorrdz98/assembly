.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc
include C:\Users\1ZW05LA_RS4\Documents\Code\2019\Assembly\Libreria\Libreria\hd.inc



.data
	msg1 db "El factorial de ",0
	msg2 db " es: ",0
	num dword 1
.code

start:
	
	call example1

	hd_exitProgram
	ret

example1 proc
	pushad
	; Example 1: Get the factorial of one number
	mov ecx,5
	ciclo:
		lea edx, msg1
		call WriteString
		mov eax, num
		call WriteDec
		lea edx, msg2
		call WriteString

		hd_fact num
		call WriteDec
		call Crlf

		inc num
		loop ciclo
	popad
	ret
example1 endp




end start