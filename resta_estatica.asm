	;Victoria Coronel
	;Lunes 15- 06- 2020
	;Resta de valores estaticos

%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro


section .data

	mensaje db "El resutlado es: "
	len equ $-mensaje

	new_line db 10,""

section .bss
	resta resb 1

section .text
	global _start
_start:


;Proceso de resta:
	mov al, 4
	mov bl, 2
	sub al, '0'		;trasforma de cadena a numero
	sub bl, '0'		;trasforma de cadena a numero
	sub al, bl
	add al, '0'		;trasforma de numero a cadena
	mov [resta], al

; Imprime resta
	escribir mensaje, len
	escribir resta, 1
	escribir new_line, 1

    ;****** salida del programa *******s
    mov eax, 1  
    int 80h 