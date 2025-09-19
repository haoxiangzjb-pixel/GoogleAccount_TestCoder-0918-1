; Hello World in x86 Assembly (32-bit Linux)
; Filename: wGRtSDEpTn.asm

section .data
    hello db 'Hello', 0xA, 0  ; String to print with newline and null terminator

section .text
    global _start

_start:
    ; Write system call
    mov eax, 4        ; sys_write system call number
    mov ebx, 1        ; stdout file descriptor
    mov ecx, hello    ; pointer to string
    mov edx, 6        ; length of string
    int 0x80          ; invoke system call

    ; Exit system call
    mov eax, 1        ; sys_exit system call number
    mov ebx, 0        ; exit status
    int 0x80          ; invoke system call