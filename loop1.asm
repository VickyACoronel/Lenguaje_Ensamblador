    ; Victoria Coronel
    ; Miercoles 29/07/2020
    ; usar loop para imprimir 'hola' n veces, con su contador

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
  saludo db 10,'Hola-> '
  len_saludo equ $-saludo
  linea db " " , 10 
  leng_linea equ $ - linea

section .bss
    contador resb 1

section .text
  global _start

_start:
  mov cx, 9

for:
  push rcx
  add rcx, '0' 			;convertir a numero
  mov [contador],rcx 	;guarda

  escribir saludo, len_saludo
  escribir contador, 1

  pop rcx
  loop for ;por cada ciclo de cx, los ciclos se ejecutan hasta cx = 0

    escribir linea, leng_linea


salir:
  mov eax, 1
  int 80h