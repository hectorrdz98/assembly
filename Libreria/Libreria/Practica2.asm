.486

include C:\masm32\include\masm32rt.inc

include C:\Users\1ZW05LA_RS4\Documents\Code\2019\Assembly\Libreria\Libreria\hd.inc

.data
	num dword 1
.code

start:
	call example1
	printf("\n")
	call example2
	printf("\n")
	call salir
	ret

example1 proc
	pushad
	; Example 1: Get the factorial of one number
	mov ecx,5
	ciclo:
		push ecx
		print "El factorial de "
		printf("%d", num)
		print " es: "

		hd_factorial num
		printf("%d\n", eax)

		inc num
		pop ecx
		loop ciclo
	popad
	ret
example1 endp

example2 proc
	pushad
	; Example 1: Get the factorial of one number
	mov ebx,4
	print "El valor absoluto de "
	printf("%d", ebx)
	print " es: "

	hd_abs ebx
	printf("%d\n", eax)

	mov ebx,-4
	print "El valor absoluto de "
	printf("%d", ebx)
	print " es: "

	hd_abs ebx
	printf("%d\n", eax)
	
	popad
	ret
example2 endp

salir proc
	printf("\nPresiona una tecla para salir...")
	getkey
	exit
	ret
salir endp

end start