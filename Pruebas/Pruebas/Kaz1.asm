.486

includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib

include C:\Irvine\Irvine32.inc
include C:\Users\1ZW05LA_RS4\Documents\Code\2019\Assembly\Pruebas\Pruebas\Hectorin.txt

.data
	
.code

start:    
	mov ecx,10
	ciclo:
		PrintX
		call Crlf
		loop ciclo
       hlt
	ret
end start