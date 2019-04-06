.486

include C:\Irvine\Irvine32.inc
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

	result  REAL8 0.0
.code

start:
	
	call example1
	call Crlf
	call example2
	call CRlf
	call example3
	
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
	; Example 1: Get the factorial of one number
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
	; Example 1: Get the factorial of one number
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

end start