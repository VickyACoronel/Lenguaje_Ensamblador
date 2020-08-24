    ; Victoria Coronel
	; Miercoles 10/06/2020
	; LEE e IMPRIME el numero que ingresa por teclado

section .data
	mensaje db 'Ingrese un numero', 10
	len_mensaje equ $-mensaje
	mensaje_presentacion db 'El numero ingresado es',10
	len_mensaje_presentacion equ $-mensaje_presentacion

section .bss
	numero resb 5

section .text
	global _start
_start:
		;*********  imprime mensaje  **********
		mov eax, 4
		mov ebx, 1
		mov ecx, mensaje
		mov edx, len_mensaje
		int 80h
		;********* lectura e numero ********
		mov eax, 3			;define el tipo de operacion
		mov ebx, 2			;estandar de entrada
		mov ecx, numero		;lo que captura en el teclado
		mov edx, 5			;numero de caracteres
		int 80h				;interrupcion de gnu linux
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
		;****** salida del programa *********
		mov eax, 1
		int 80h
