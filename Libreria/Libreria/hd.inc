
; -- HD.INC -- 32 bits assembly library
;
; Autor: Hector Daniel Rodriguez Feregrino
;
; Required: 
;		1.- Irvine32.inc (and all dependencies to get it work)
;		2.- msvcrt.inc (and all dependencies to get it work)
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


hd_factorial macro n:REQ
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


hd_abs macro n:REQ
	; This macro get the absolute value of "n" and return the result in EAX
    ; Input: DWORD n (number to get the absolute value)
    ; Output: DWORD EAX (absolute value)
	local continue
	push ecx
	mov eax,n
	mov ecx,-1
	cmp eax,0
	jge continue
		mul ecx
	continue:
	pop ecx
endm


hd_pow macro n:REQ, power:REQ
	; This macro returns "n" raised to the power "power"
    ; Input: DWORD n (number), DWORD power (power)
    ; Output: DWORD EAX (n raised to power)
	local ciclo, base
	.data
		base EQU	n
	.code
		push ecx
		mov eax, n
		mov ecx, power
		dec ecx
		ciclo:
			mul base
			loop ciclo
		pop ecx
endm