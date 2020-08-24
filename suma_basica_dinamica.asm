    ; Victoria Coronel
    ; Miercoles 10/06/2020
    ; Realizar una suma de 2 numeros ingresados por teclado

%macro escribir 2
    mov eax , 4  
    mov ebx , 1  
    mov ecx , %1 
    mov edx , %2 
    int 80h 
%endmacro

%macro leer 2
    mov eax , 3  
    mov ebx , 2  
    mov ecx , %1 
    mov edx , %2 
    int 80h 
%endmacro

section .data
    msj1 db "Ingrese el primer número:",10
    leng1 equ $ - msj1

    msj2 db "Ingrese el segundo número:",10
    leng2 equ $ - msj2

    resultado db "El resultado es:",10
    leng equ $ - resultado

    linea db " " , 10 
    leng_linea equ $ - linea

section .bss
    n1 resb 2
    n2 resb 2
    suma resb 1    
    
section .text
     global _start
_start:

    ; ******** Ingreso el primer numero ***********
    escribir msj1, leng1
    leer n1, 2 

    ; ******** Ingreso el Segundo numero ***********
    escribir msj2, leng2
    leer n2, 2 

    ; ******** Proceso de suma ***********
    mov ax, [ n1 ] 
    mov bx, [ n2 ] 
    sub ax, '0'    ;trasforma de cadena a numero
    sub bx, '0'    ;trasforma de cadena a numero
    add ax, bx     ; ax = ax + bx
    add ax, '0'    ;trasforma de numero a cadena

    mov [suma], ax

    ; ******** Imprime resultado **********
    escribir resultado, leng
    escribir suma, 1 

    ; ******** Imprime nueva linea **********
    escribir linea, leng_linea

    ;****** salida del programa *******s
    mov eax, 1  
    int 80h 