global _start
section .text
_start:
    push 0x000a4142
    mov eax, 4
    mov ebx, 1
    add ecx, esp
    inc byte [ecx]
    ; mov ecx, esp
    mov edx,4
    int 0x80

    mov eax,1
    mov ebx, 0
    int 0x80
