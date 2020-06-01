	; PRIMER EJERCICIO EN NASM 01/06/2020
	; presentar un mensaje
	
section .data
	mensaje DB "Mi primera vez con NASM" 	;constante mensaje de un byte en memoria
	longitud EQU $-mensaje  				;longitud que calcula en # de caracteres de mensaje

;section .bss  ;para inicializar variables

section .text
	global _start
_start:

	;********** IMPRIMIR MENSAJE **************
	mov eax, 4  			;tipo de subrutina, operacion => escritura, salida
	mov eax, 1				;tipo de estndar, por teclado
	mov ecx, mensaje 		;en el registro ecx se almacena mensaje
	mov edx, longitud		
	int 80h

	; salida
	mov eax, 1
	mov ebx, 0
	int 80h

; se abre la ubicación del archivo en la terminal
; nasm -f elf64 -o nombrearchivo.o nombrearchivo.asm
; ld -n elf_i386 -s -o nombrearchivo nombrearchivo.o
; ld -o nombrearchivo nombrearchivo.o
; ./nombrearchivo
