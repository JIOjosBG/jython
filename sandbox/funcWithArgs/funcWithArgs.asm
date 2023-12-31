section .text
global _start

_start:
    ; push characters to 2 slots and push amount of bytes to third slot
    push 0x41424344
    push 0X45464748
    push 0x08
    call print
    ; clear the pushed arguments
    add esp, 12    ; Correct the stack by 4 bytes
    ; instead fo freeign the data here we could ret 12

    ; Exit the program
    mov eax, 1
    mov ebx, 0
    int 0x80

print:
    push ebp
    mov ebp, esp

    ; Prepare for system call to write the characters
    mov eax, 4
    mov ebx, 1
    lea ecx, [ebp+12] ; the second to last pushed slot
    mov edx, [ebp+8] ; the last pushed slot for arguments
    int 0x80

    mov esp, ebp
    pop ebp
    ret
