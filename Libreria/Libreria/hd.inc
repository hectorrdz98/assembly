
; -- HD.INC -- 32 bits assembly library
;
; Autor: Hector Daniel Rodriguez Feregrino
;
; Required: 
;		1.- Irvine32.inc (and all dependencies to get it work)
;		2.- msvcrt.inc (and all dependencies to get it work)
; Tips:
;		1.- Don't redefine the variables used in this library (all start with hd_)	


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


hd_arrSum macro arr
	; This macro returns the sum of the elements of an array of DWORD TYPE
    ; Input: DWORD array of any length
    ; Output: DWORD EAX (sum of elements)
	local ciclo
	push ecx
	push esi
	mov esi,0
	mov ecx, lengthof arr
	dec ecx
	mov eax, arr[esi]
	ciclo:
		add esi, type arr
		add eax, arr[esi]
		loop ciclo
	pop esi
	pop ecx
endm


hd_arrProd macro arr
	; This macro returns the product of the elements of an array of DWORD TYPE
    ; Input: DWORD array of any length
    ; Output: DWORD EAX (product of elements)
	local ciclo
	push ecx
	push esi
	mov esi,0
	mov ecx, lengthof arr
	dec ecx
	mov eax, arr[esi]
	ciclo:
		add esi, type arr
		mul arr[esi]
		loop ciclo
	pop esi
	pop ecx
endm


hd_arrMax macro arr
	; This macro returns the max element of the elements of an array of DWORD TYPE
    ; Input: DWORD array of any length
    ; Output: DWORD EAX (max of elements)
	local ciclo, continue
	push ecx
	push esi
	mov esi, 0
	mov ecx, lengthof arr
	mov eax, 0
	ciclo:
		cmp eax, arr[esi]
		jge continue
		mov eax, arr[esi]
		continue:
		add esi, type arr
		loop ciclo
	pop esi
	pop ecx
endm


hd_arrMin macro arr
	; This macro returns the min element of the elements of an array of DWORD TYPE
    ; Input: DWORD array of any length
    ; Output: DWORD EAX (min of elements)
	local ciclo, continue
	push ecx
	push esi
	mov esi, 0
	mov ecx, lengthof arr
	dec ecx
	mov eax, arr[esi]
	add esi, type arr
	ciclo:
		cmp eax, arr[esi]
		jle continue
		mov eax, arr[esi]
		continue:
		add esi, type arr
		loop ciclo
	pop esi
	pop ecx
endm


hd_arrSortAsc macro arr
	; This macro sort from lower to greater the values of an array of DWORD TYPE
    ; Input: DWORD array of any length
    ; Output: DWORD array (sorted asc)
	local ciclo1, ciclo2, x, continue, exitM
	.data
		x equ lengthof arr
	.code
		pushad

		mov ecx, x
		mov esi,0
		ciclo1:
			push esi
			push ecx

			; mov eax, ecx
			; call WriteDec

			mov eax, arr[esi]	; Element comparing
			dec ecx				; n-1 elemnents to compare with

			cmp ecx, 0			; If there are only 1 element comparing
			jle exitM			; exit macro

			add esi, type arr	; Start at the next element

			ciclo2:
				push ecx

				; mov edx, eax
				; mov eax, ecx
				; call WriteDec
				; mov eax, edx

				cmp eax, arr[esi]	; If last element es greater than actual dont jump
				jle continue

				mov edx, eax					; Save last temp (eax) on edx
				mov eax, arr[esi]				; Move actual to last temp (eax)
				mov arr[esi], edx				; Move last (edx) to actual

				continue:
				add esi, type arr				; Add to esi another block
				; call printArr2
				; call Crlf

				pop ecx
				loop ciclo2

			pop ecx
			pop esi
			mov arr[esi], eax					; Restore temp (eax) to real array
			add esi, type arr					; Add to esi another block
			loop ciclo1

		exitM:
		popad
endm


hd_arrSortDesc macro arr
	; This macro sort from greater to lower the values of an array of DWORD TYPE
    ; Input: DWORD array of any length
    ; Output: DWORD array (sorted desc)
	local ciclo1, ciclo2, x, continue, exitM
	.data
		x equ lengthof arr
	.code
		pushad

		mov ecx, x
		mov esi,0
		ciclo1:
			push esi
			push ecx

			; mov eax, ecx
			; call WriteDec

			mov eax, arr[esi]	; Element comparing
			dec ecx				; n-1 elemnents to compare with

			cmp ecx, 0			; If there are only 1 element comparing
			jle exitM			; exit macro

			add esi, type arr	; Start at the next element

			ciclo2:
				push ecx

				; mov edx, eax
				; mov eax, ecx
				; call WriteDec
				; mov eax, edx

				cmp eax, arr[esi]	; If last element es greater than actual dont jump
				jge continue

				mov edx, eax					; Save last temp (eax) on edx
				mov eax, arr[esi]				; Move actual to last temp (eax)
				mov arr[esi], edx				; Move last (edx) to actual

				continue:
				add esi, type arr				; Add to esi another block
				; call printArr2
				; call Crlf

				pop ecx
				loop ciclo2

			pop ecx
			pop esi
			mov arr[esi], eax					; Restore temp (eax) to real array
			add esi, type arr					; Add to esi another block
			loop ciclo1

		exitM:
		popad
endm