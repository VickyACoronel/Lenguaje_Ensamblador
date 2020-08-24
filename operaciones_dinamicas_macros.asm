    ;Victoria Coronel
    ;Lunes 22 06- 2020
    ;4 Operaciones con numeros dinamicos

%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro


section .data

	msj1 db 10,"Ingrese el primer número: "
	len1 equ $ - msj1 

	msj2 db "Ingrese el segundo número: "
	len2 equ $ - msj2

	mensaje db 10,"El resultado de la suma es: "
	len3 equ $-mensaje

    mensaje2 db "El resultado de la resta es: "
	len4 equ $-mensaje2

    mensaje3 db "El resultado de la multiplicación es: "
	len5 equ $-mensaje3

    mensaje4 db "El resultado de la división es: "
	len6 equ $-mensaje4

    mensaje5 db "El residuo de la división es: "
	len7 equ $-mensaje5

    new_line db 10,""


section .bss
	n1 resb 1
	n2 resb 1
	suma resb 1 
    resta resb 1
    multiplicacion resb 1
    division resb 1
    residuo resb 1

section .text
	global _start
_start:

; Ingrese el numero 1
	escribir msj1, len1
	leer n1, 2

; Ingrese el numero 2
	escribir msj2, len2
	leer n2, 2

;Proceso de suma:
	mov al, [n1]	;el valor de n1 es una cadena
	mov bl, [n2]	;el valor de n2 es una cadena
	sub al, '0'		;convierte cadena a numero
	sub bl, '0'		;convierte cadena a numero
	add al, bl
	add al, '0'
	mov [suma], al

; Imprime suma
	escribir mensaje, len3
	escribir suma, 1
    escribir new_line, 1

;Proceso de resta:
	mov al, [n1]
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	sub al, bl
	add al, '0'
	mov [resta], al

; Imprime resta
	escribir mensaje2, len4
	escribir resta, 1
    escribir new_line, 1

;Proceso de multiplicación:
	mov al, [n1]
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [multiplicacion], al

;Imprime multiplicacion
	escribir mensaje3, len5
	escribir multiplicacion, 1
	escribir new_line, 1

;Proceso de division:
	mov al, [n1]
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	div bl
	add al, '0'
	mov [division], al
    add ah, '0'
    mov [residuo], ah

;Imprime division
	escribir mensaje4, len6
	escribir division, 1
    escribir new_line, 1
    escribir mensaje5, len7
    escribir residuo, 1
	escribir new_line, 1

;****** salida del programa *******	

	mov eax, 1
	int 80h

