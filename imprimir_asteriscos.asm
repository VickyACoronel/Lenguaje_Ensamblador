    ; Victoria Coronel
    ; Miercoles 22/07/2020
    ; Imprimir asteriscos

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
    asterisco db "*",10
    lenasterisco equ $ - asterisco

section .text
     global _start
_start:

    mov cx, 9

imprimir:
    dec cx
    push cx
    escribir asterisco, 1

    pop cx
    cmp cx, 0

    jnz imprimir

    mov eax, 1
    int 80h










