global main, _start

section .bss
buffer: resb 128
res: resb 10
increase: resb 10

section .data
fmt: db '%d', 0
equal: db '=', 0
mul: db '*', 0
end: db 10, 0

section .text
    extern printf
    extern scanf
    extern exit

multi: 
    push rbp
    mov rbp, rsp
    xor rax, rax ; rax = 0
    xor rbx, rbx ; rbx = 0
    inc rax ; rax++
    inc rbx ; rbx++

_loop:
    mov rcx, 9 ; rcx = 9
    cmp rbx, rcx ; rbx > rcx(9) ?
        jg _end ; if rbx > rcx : jump end
    mov rax, rbx ; rax = rbx
    mov rdi, [buffer] ; rdi = buffer(input)
    mul rdi ; rax = rax * rdi(input)
    mov[increase], rbx ; memorize rbx
    mov[res], rax ; memorize rax
    call print_line ; (input * increase = res)
    
    inc rbx ; rbx++
    jmp _loop

_end:
    leave
    ret
    
print_line:
    push rbp
    mov rbp, rsp
    mov rsi, [buffer]
    mov rdi, fmt
    mov rax, 0
    call printf ; 
    mov rdi, mul
    mov rax, 0
    call printf ; 
    mov rsi, [increase]
    mov rdi, fmt
    mov rax, 0
    call printf
    mov rdi, equal
    mov rax, 0
    call printf ; 
    mov rsi, [res]
    mov rdi, fmt
    mov rax, 0
    call printf ;
    mov rdi, end
    mov rax, 0
    call printf ; 
    leave
    ret
    
main:
_start:
    push rbp
    mov rsi, buffer
    mov rdi, fmt
    mov rax, 0
    call scanf
    call multi
    call exit
    pop rbp
    ret
    
