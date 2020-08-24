    ; Victoria Coronel
    ; Miercoles 22/07/2020
    ; Imprimir con LOOP asteriscos en cuadrado

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

    mov rcx, 9           ;guarda el numero base (para filas y columnas)
    mov rax , 9         ;guardo el valor base en ax
 
    jmp fila            ;salta a imprimir fila

fila:                   ;etiqueta para imprimir fila
 
    push rax             ;apila el valor en ax
    push rcx

    escribir asterisco , 1  ;imprime asterisco
    pop rcx              ;desapila bx
    pop rax              ;desapila ax

    loop fila
    jmp columna

columna:                ;etiqueta para imprimir columna
    dec rax              ;decremeta bx
    push rax             ;apila bx
    escribir espacio , 1   ;imprime un espacio o enter
    pop rax              ;desapila bx
    mov rcx , 9          ;ax toma valor base

    cmp rax , 0          ;compaha con 0
    jz salir            ;si es 0 salta a salir

    jmp fila            ;si no salta a fila

salir:                  ;fin del programa
    mov eax , 1  
    int 80h 