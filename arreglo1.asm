    ; Victoria Coronel
    ; Miercoles 12/08/2020
    ; arreglo

%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

section .data
	arreglo db 3,2,0,7,5
	len_arreglo equ $-arreglo
	new_line db 10, ''

section .bss
	numero resb 1

section .text
	global _start
_start:
	mov esi, arreglo 		;esi = fijar eltamano del arreglo, posicionar el arreglo en memoria
	mov edi, 0				;edi = contener el indice del arreglo

imprimir:
	mov al, [esi]
	add al, '0'
	mov [numero], al

	add esi,1
	add edi,1

	escribir numero, 1

	cmp edi, len_arreglo	;cmp 3, 4 => active carry
							;cmp 4, 3 => desactive carry y zero
							;cmp 3, 3 => desactive carry y zero se activa
	jb imprimir				;se ejecuta cuando la bandera de carry esta activada

salir:
	mov eax, 1
	int 0x80


