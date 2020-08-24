    ; Victoria Coronel
    ; Miercoles 05/08/2020
    ; Tablar multiplicar 1 al 9 usar call - ret

%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	msj1 db "Tablas de Multiplicar",10
	len1 equ $-msj1
	msj2 db " * "
	len2 equ $-msj2
	msj3 db " = "
	len3 equ $-msj3
	msj4 db " | "
	len4 equ $-msj4
	espacio db 10
	len_esp equ $-espacio

section .bss
	numero rest 2
	num1 rest 2
	num2 rest 2
	aux rest 2

section .text
	global _start
_start:
	;imprimir msj1, len1
	;call imprimirmsj

	imprimirmsj:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1

	mov al, 1
	mov [aux], al
	mov ecx, 0

	;ret 

principal:
	cmp ecx,9
	jz j2
	inc ecx
	push rcx
	mov [numero], ecx
	jmp j1
	;call j1
	ret
j1:
	mov al, [numero]
	mov [num1], al
	mov cl, [aux]
	mul cl

	mov [numero], al
	mov ah, [num1]
	add ax, '00'
	add cx, '00'
	mov [num1], ah
	mov [num2], cl

	imprimir num1, 1
	imprimir msj2, len2
	imprimir num2, 1
	imprimir msj3, len3
	mov eax, 48
	add [numero], eax 

	imprimir numero, 2
	imprimir msj4, len4
	pop rcx
	;jmp principal
	call principal
	;ret 

j2: 
	imprimir espacio, len_esp
	mov ebx, [aux]
	inc ebx
	mov [aux], ebx
	mov ecx, 0
	cmp ebx,10
	jb principal

salir:
	mov eax, 1
	mov ebx, 0
	int 80h