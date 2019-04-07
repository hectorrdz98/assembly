
; -- HDFLOAT.INC -- 32 bits assembly library
;
; Autor: Hector Daniel Rodriguez Feregrino
;
; Required: 
;		1.- masm32rt.inc (and all dependencies to get it work)
; Tips:
;		1.- Don't redefine the variables used in this library (all start with hd_)	


hd_printReal macro n:REQ
	; This macro prints a real "n"
                ; Input: REAL8 n (number to print)
                ; Output: STD:OUT
	printf("%f", n)
endm