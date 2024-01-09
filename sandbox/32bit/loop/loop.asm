global _start

section .start
_start:
    ; number multiplication 5*7
    mov ebx, 0
    mov ecx, 5
    mov edx, 7
loop:
    add ebx, ecx
    dec edx
    cmp edx, 0
    jg loop
    mov eax, 1  ; exit sys call returns the value at ebx
    int 0x80 