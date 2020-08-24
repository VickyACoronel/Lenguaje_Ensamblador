    ; Victoria Coronel
	; Miercoles 10/06/2020
	; IMPRIME el numero que se define en el codigo

section .data
	mensaje db 'Ingrese un numero', 10
	len_mensaje equ $-mensaje
	mensaje_presentacion db 'El numero es',10
	len_mensaje_presentacion equ $-mensaje_presentacion

section .bss
	numero resb 5

section .text
	global _start
_start:
		;********* asignacion de un numero en variable *********
		mov ebx, 7
		add ebx, '0'  ; transforma de numero a cadena
		mov [numero], ebx
		;********* imprime mensaje presentacion **********
		mov eax, 4
		mov ebx, 1
		mov ecx, mensaje_presentacion
		mov edx, len_mensaje_presentacion
		int 80h
		;********* imprime numero **********
		mov eax, 4
		mov ebx, 1
		mov ecx, numero
		mov edx, 5
		int 80h
		;****** salida del programa *******s
		mov eax, 1
		int 80h
