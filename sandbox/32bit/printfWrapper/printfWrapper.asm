global newPrint
extern printf

section .data
msg db "Testing %d", 0x0a, 0x00

section .text
newPrint:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    ; Prepare arguments for printf in reverse order
    push eax        ; argument for %d, passed from C
    push msg        ; Address of the format string
    call printf
    add esp, 8      ; Clean up the stack (4 bytes * number of arguments)

    ; Exit
    mov eax, 0
    leave           ; This will do 'mov esp, ebp' and 'pop ebp'
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
