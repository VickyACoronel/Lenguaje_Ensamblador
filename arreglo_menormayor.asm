    ; Victoria Coronel
    ; Miercoles 19/08/2020
    ; Presenta el numero Menor del arreglo
    
section .data
	msj1 db 'ingrese 6 numeros y presione enter:',0XA
	len1 equ $-msj1
	arreglo db 0,0,0,0,0,0 ;declara el arreglo
	len_arreglo equ $-arreglo
	msj_resultado db 'El numero  menor es:',0XA
	len_resultado equ $-msj_resultado

	msj_m_mayor db 10,'El numero  mayor es:',0XA
	len_m_mayor equ $-msj_m_mayor

	m_iguales db 10,'hay iguales',10
	len_m_iguales equ $-m_iguales


; arreglo

section .bss
	dato resb 2
	mayor resb 2
	menor resb 2

section .text
	global _start
	_start:

	;se define el arreglo en dos registros indices
	mov esi, arreglo
	mov edi, 0 ;inicia contador

	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h

leer:
	mov eax, 3
	mov ebx, 0
	mov ecx, dato
	mov edx, 2
	int 80h

	mov al, [dato]
	sub al, '0'	;se convierte a decimal

	mov [esi],al ;guardo en el arreglo

	add edi,1  ;incremento contador
	add esi,1

	cmp edi,len_arreglo	;comparo tamano del arreglo con el contador

	jb leer

	mov ecx, 0	
	mov bl, 9;se registra el menor numero

	

comparacion:
	mov al, [esi]
	cmp bl, al
	jb contador
	mov bl, al

contador:
	inc ecx	;incrementa en 1
	cmp ecx, len_arreglo
	jb comparacion;cuando hay carry activado
imprimir1:
	add bl, '0'
	mov [dato], bl

	mov eax, 4
	mov ebx, 1
	mov ecx, msj_m_mayor
	mov edx, len_m_mayor
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, dato
	mov edx, 1
	int 80h
	
	mov ecx, 0	
	mov dl, 1;se registra el menor numero
comparacion2:
	mov al, [esi]
	cmp al, dl
	jg contador2
	mov dl, al


contador2:
	inc ecx	;incrementa en 1
	cmp ecx, len_arreglo
	jb comparacion2;cuando hay carry activado



imprimir:


	add dl, '0'
	mov [dato], dl



	mov eax, 4
	mov ebx, 1
	mov ecx, msj_resultado
	mov edx, len_resultado
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, dato
	mov edx, 1
	int 80h


salir:
	mov eax, 1
	int 80h