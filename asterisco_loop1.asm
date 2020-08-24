    ; Victoria Coronel
    ; Lunes 08/08/2020
    ; Imprimir con LOOP un triangulo asteriscos de 9 a 1


section .data
  asterisco db "*"
  new_line db 10, ""

section .text
  global _start

_start:
          mov rcx, 8
          mov rbx, 1

  l1:
          push rcx
          push rbx


          mov ecx, ebx ; se pcomenta si el triangulo quiere invertido al de este
          ;pop ecx
          ;push ecx

  l2:

          push rcx

          ;**asterisco****
          mov eax, 4
          mov ebx, 1
          mov ecx, asterisco
          mov edx, 1
          int 80h

          pop rcx
          loop l2
          ;finalizo loop columnas
          ;**nueva linea***

          mov eax, 4
          mov ebx, 1
          mov ecx, new_line
          mov edx, 1
          int 80h

          pop rbx
          pop rcx
          inc rbx
          loop l1
          ;finalizo loop filas


salir:
          mov eax, 1
          int 80h