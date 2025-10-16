section .data
    hello db 'Hello', 0Ah    ; Define the string 'Hello' followed by a newline character
    hello_len equ $ - hello  ; Calculate the length of the string

section .text
    global _start

_start:
    ; Write system call
    mov eax, 4          ; sys_write system call number
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello      ; buffer containing the string
    mov edx, hello_len  ; length of the string
    int 0x80            ; invoke system call

    ; Exit system call
    mov eax, 1          ; sys_exit system call number
    mov ebx, 0          ; exit status
    int 0x80            ; invoke system call