    ; Victoria Coronel
    ; Miercoles 22/07/2020
    ; Imprimir asteriscos en cuadrado

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

    mov cx, 9           ;guarda el numero base (para filas y columnas) en cx
    
    mov ax , cx         ;guardo el valor base en ax
    mov bx , cx         ;guaro el valor base en bx
 
    jmp fila            ;salta a imprimir fila

fila:                   ;etiqueta para imprimir fila
    push ax             ;apila el valor en ax
    push bx             ;apila el valor en bx
    escribir asterisco , 1  ;imprime asterisco
    pop bx              ;desapila bx
    pop ax              ;desapila ax

    dec ax              ;decrementa ax

    cmp ax , 0          ;compara hasta que sea 0
    jz columna          ;si es 0 salta a columna

    jmp fila            ;si no regresa a fila

columna:                ;etiqueta para imprimir columna
    dec bx              ;decremeta bx
    push bx             ;apila bx
    escribir espacio , 1   ;imprime un espacio o enter
    pop bx              ;desapila bx
    mov ax , 9          ;ax toma valor base

    cmp bx , 0          ;compaha con 0
    jz salir            ;si es 0 salta a salir

    jmp fila            ;si no salta a fila

salir:                  ;fin del programa
    mov eax , 1  
    int 80h 