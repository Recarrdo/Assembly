%include "io.inc"
section .data
    a dw 0
    b dw 0
section .bss

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_DEC 2, [a]
    GET_DEC 2, [b]
    mov eax, [a]
    mov edx, [b]
    add eax, edx
    PRINT_DEC 2, eax
    
    imul eax, edx
    PRINT_DEC 2, eax
    ret
