    ;Victoria Coronel
    ;Miercoles 17 06- 2020
    ;4 Operaciones con numeros estaticos

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

	suma resb 1 
    resta resb 1
    multiplicacion resb 1
    division resb 1
    residuo resb 1

section .text
	global _start
_start:


;Proceso de suma:
    mov al, 4
    mov bl, 2
	add ax, bx
	add ax, '0'		;trasforma de numero a cadena
	mov [suma], ax

; Imprime suma
	escribir mensaje, len3
	escribir suma, 1
    escribir new_line, 1

;Proceso de resta:
    mov al, 4
    mov bl, 2
	sub al, '0'		;trasforma de cadena a numero
	sub bl, '0'		;trasforma de cadena a numero
	sub al, bl
	add al, '0'		;trasforma de numero a cadena
	mov [resta], al

; Imprime resta
	escribir mensaje2, len4
	escribir resta, 1
    escribir new_line, 1

;Proceso de multiplicación:
    mov al, 4
    mov bl, 2
	mul bl
	add al, '0'		;trasforma de numero a cadena
	mov [multiplicacion], al

;Imprime multiplicacion
	escribir mensaje3, len5
	escribir multiplicacion, 1
	escribir new_line, 1

;Proceso de division:

    mov ax, 4
    mov bl, 2
    div bl
    add al, '0'				;trasforma de numero a cadena
    mov [division], al
    add ah, '0'				;trasforma de numero a cadena
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

