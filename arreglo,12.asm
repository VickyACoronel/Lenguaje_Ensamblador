segment .data
	arreglo db 3,2,6,7,5
	len_arreglo equ $-arreglo
	new_line db 10,''
	
segment .bss
	numero resb 1
	

segment .text
	global _start
	
_start:
	mov esi , arreglo	;esi = fijar el tamaño del arreglo, posicionar el arreglo en memoria
	mov edi, 0			;edi = contener el indice del arreglo
	
imprimir:
	mov al, [esi]
	add al, '0'
	mov [numero], al
	
	add esi, 1
	add edi, 1
	
	mov eax, 4
	mov ebx, 1
	mov ecx, numero
	mov edx, 1
	int 0x80
	
	cmp edi, len_arreglo ; cmp 3,4 -> activa cuando el primer operando es menor
							;cmp 4,3 -> desactiva carry y zero
							;cmp 3 ,3 ->desactiva carry y zero se activa
	jmp imprimir		;se ejecuta cunado la bandera de carry esta activa
	
salir: 
	mov eax, 1
	int 0x80
