; Hello World program for x86 Linux
; Assemble with: nasm -f elf32 fKr1iJ2uKy.asm -o fKr1iJ2uKy.o
; Link with: ld -m elf_i386 fKr1iJ2uKy.o -o fKr1iJ2uKy

section .data
    hello_msg db 'Hello', 0xA  ; 0xA is the newline character
    msg_len   equ $ - hello_msg

section .text
    global _start

_start:
    ; write system call
    mov eax, 4        ; system call number for sys_write
    mov ebx, 1        ; file descriptor 1 is stdout
    mov ecx, hello_msg ; address of the string to output
    mov edx, msg_len  ; number of bytes to output
    int 0x80          ; call the kernel

    ; exit system call
    mov eax, 1        ; system call number for sys_exit
    mov ebx, 0        ; exit status
    int 0x80          ; call the kernel