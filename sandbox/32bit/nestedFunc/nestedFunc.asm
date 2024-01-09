global _start
section .text
_start:
    call foo
    mov eax, 1
    mov ebx, 0
    int 0x80

foo:
    ; prologue of the function 
    push ebp ; store the last base pointer to the stack so we dont messup the parent func call
    mov ebp, esp ; store the current pointer to the base pointer so we can return properly
    
    ; store Hi in stask
    sub esp, 2 ; allocate 2 bytes to the stack
    mov [esp], byte "H" ; store H to the address of esp (top of the stack)
    mov [esp+1], byte "i" ; store i to the address of esp+1 (below the top of the stack)

    ; print 2 character from the top of the stack
    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 2
    int 0x80
    
    call watafak

    ; epilogue of the function
    mov esp, ebp ; move stack pointer to base pointer (equivilent to freeing memory)
    pop ebp ; set ebp to what was stored at the start of the function 
    ret

watafak:
    push ebp
    mov ebp, esp

    sub esp, 1
    mov [esp], byte "U"

    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 1 
    int 0x80

    mov esp, ebp
    pop ebp
    ret