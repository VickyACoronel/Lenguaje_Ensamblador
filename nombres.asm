    ; Victoria Coronel
	; Lunes 
	08/06/2020
	; IMPRIMIR nombre, apellido, materia, genero

%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	nombre db "Nombre: Victoria", 10
	t_nombre equ $-nombre
	apellido db "Apellido: Cononel",10
	t_apellido equ $-apellido
	materia db "Materia: Lenguaje Ensamblador",10
	t_materia equ $-materia
	genero db "Genero: Femenino",10
	t_genero equ $-genero

section .bss
	numero resb 2
section .text
	global _start
	_start:

	escribir nombre, t_nombre

	escribir apellido, t_apellido

	escribir materia, t_materia

	escribir genero, t_genero

	mov eax, 1
	int 80h