    ; Victoria Coronel
    ; Miercoles 29/07/2020
    ; usar loop para imprimir un triangulo invertido e asteriscos *

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
    asterisco db "*",10  ;guarda asterisco en variable
    espacio db '' , 10   ; guarda espacio en variable

section .text
     global _start
_start:

    mov rcx, 9           ;guarda el numero base (para filas y columnas) en cx
    
    mov rax , 9         ;guardo el valor base en ax
 
    jmp fila            ;salta a imprimir fila

fila:                   ;etiqueta para imprimir fila 
    push rax             ;apila el valor en ax
    push rcx
    escribir asterisco , 1  ;imprime asterisco
    pop rcx              ;desapila ax
    pop rax

    loop fila            ;si no regresa a fila
    jmp columna

columna:                ;etiqueta para imprimir columna
    dec rax
    push rax
    escribir espacio , 1   ;imprime un espacio o enter
    pop rax              ;desapila bx
    mov rcx , rax          ;ax toma valor base

    cmp rax , 0          ;compaha con 0
    jz salir            ;si es 0 salta a salir

    loop fila

salir:                  ;fin del programa
    mov eax , 1  
    int 80h 