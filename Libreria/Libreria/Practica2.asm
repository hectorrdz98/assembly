.486

include C:\masm32\include\masm32rt.inc

.data

.code

start:

	call salir
	ret

salir proc
	printf("\nPresiona una tecla para salir...")
	getkey
	exit
	ret
salir endp

end start