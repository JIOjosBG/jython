global _start

section .data
    msg db "Hello world!", 0x0a ; 0x0a is new line
    len equ $ - msg

section .start
_start:
    mov eax, 4  ; sys_write (eax determines sys call)
    mov ebx, 1  ; stdout file descriptor
    mov ecx, msg; data
    mov edx, len; len of data
    int 0x80    ; execute data stored in the registers

    mov eax, 1  ; exit sys call
    mov ebx, 0  ; exit with 0
    int 0x80 