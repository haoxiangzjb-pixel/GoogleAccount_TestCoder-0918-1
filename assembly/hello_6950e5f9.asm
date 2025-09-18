section .data
    hello db 'Hello', 0xA, 0

section .text
    global _start

_start:
    ; write system call
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, hello      ; buffer
    mov rdx, 6          ; count (5 chars + newline)
    syscall

    ; exit system call
    mov rax, 60         ; sys_exit
    mov rdi, 0          ; status
    syscall