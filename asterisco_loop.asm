    ; Victoria Coronel
    ; Lunes 08/08/2020
    ; Imprimir con LOOP un triangulo asteriscos de 1 a 9

section .data
	asterisco db '*'
	nueva_linea db 10,''
section .text
	global _start

_start:
	mov ecx, 8
	mov ebx, 1 

l1:
	push rcx
	push rbx
	
	;********************* nueva lineas **********************
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, 1
	int 80h
	
	pop rcx
	push rcx
l2:
	push rcx
	;********************* asterisco **********************
	mov eax, 4
	mov ebx, 1
	mov ecx, asterisco
	mov edx, 1
	int 80h
	pop rcx
	loop l2  ;  salto a l2, dec cx,  
	;********************* finaliza loop de las columnas *********
	pop rbx
	pop rcx
	inc rbx
	loop l1
	;********************* finaliza loop de las fila *********

	mov eax, 1
	int 80h
