    ;Victoria Coronel
    ;Lunes 15- 06- 2020
    ;Multiplicacion de valores estaticos

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

    mensaje db "El resultado es:", 10
    leng equ $ - mensaje

    linea db " " , 10 
    leng_linea equ $ - linea

section .bss
    multiplicacion resb 1    
    
section .text
    global _start

_start:

    ; ******** Proceso de multiplicacion ***********

    mov al, 3
    mov bl, 2
    ;sub al, '0'     ;trasforma de cadena a numero
    ;sub bl, '0'     ;trasforma de cadena a numero
    mul bl
    add al, '0'     ;trasforma de numero a cadena
    mov [multiplicacion], al

    ; ******** Imprime resultado **********
    escribir mensaje, leng
    escribir multiplicacion, 1

    ; ******** Imprime nueva linea **********
    escribir linea, leng_linea

    ;****** salida del programa *******s
    mov eax, 1  
    int 80h 