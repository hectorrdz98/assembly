
; -- HD.INC -- 32 bits assembly library
;
; Autor: Hector Daniel Rodriguez Feregrino
;
; Required: 
;		1.- Irvine32.inc (and all dependencies to get it work)
; Tips:
;		1.- Don't redefine the variables used in this library (all start with hd_)	


hd_exitProgram macro
	; This macro print in console the message "Presiona cualquier tecla para salir"
    ; Input: None
    ; Output: None
	local exitMsg
	.data
		exitMsg		BYTE	0dh, 0ah, "Presiona cualquier tecla para salir...", 0
	.code
		push edx
		lea edx, exitMsg
		call WriteString
		call ReadChar
		pop edx
endm


hd_fact macro n:REQ
	; This macro get the factorial of "n" and return the result in EAX
    ; Input: DWORD n (number to get the factorial)
    ; Output: DWORD EAX (factorial)
	local ciclo
	push ecx
	mov eax, 1
	mov ecx, num
	ciclo:
		mul ecx
		loop ciclo
	pop ecx
endm