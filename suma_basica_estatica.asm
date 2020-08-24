    ; Victoria Coronel
    ; Miercoles 10/06/2020
    ; Realizar una suma de 2 numeros estaticos (6+2)

section .data
    resultado db "El resultado es:" , 10 
    leng equ $ - resultado
    linea db " " , 10 
    leng_linea equ $ - linea

section .bss
    suma resb 1    ; 
    
section .text
     global _start
_start:
    mov eax, 6    ;guarda primer valor  en eax
    mov ebx, 2    ;guarda segundo valor en eax
    add eax, ebx  ;eax = eax + ebx
    add eax, '0'  ;tranformar de numero a cadena  

    mov [ suma ], eax   ;guarda el valor e eax en la posicion de suma

 	;****** imprime mensaje *******
    mov eax, 4  
    mov ebx, 1  
    mov ecx, resultado 
    mov edx, leng 
    int 80h 
 	;****** imprime suma *******s
    mov eax, 4  
    mov ebx, 1  
    mov ecx, suma 
    mov edx, 1  
    int 80h 
     	;****** imprime linea *******s
    mov eax, 4  
    mov ebx, 1  
    mov ecx, linea 
    mov edx, leng_linea 
    int 80h 
 	;****** salida del programa *******s
    mov eax, 1  
    int 80h 