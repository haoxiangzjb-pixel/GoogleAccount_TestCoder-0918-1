section .data
    result_msg db 'Sum of registers: ', 0
    newline db 10, 0

section .bss
    result resb 4

section .text
    global _start

_start:
    ; Initialize some values in registers
    mov eax, 10      ; First number
    mov ebx, 20      ; Second number
    mov ecx, 30      ; Third number
    mov edx, 40      ; Fourth number

    ; Calculate sum of all registers
    mov esi, eax     ; Copy eax to esi
    add esi, ebx     ; Add ebx to esi
    add esi, ecx     ; Add ecx to esi
    add esi, edx     ; Add edx to esi

    ; Store result in memory
    mov [result], esi

    ; Print result message
    mov eax, 4       ; sys_write system call
    mov ebx, 1       ; stdout
    mov ecx, result_msg
    mov edx, 16      ; length of message
    int 0x80         ; call kernel

    ; Convert result to string and print (simplified approach)
    mov eax, [result]
    add eax, '0'     ; Convert to ASCII (for single digit)
    mov [result], al

    ; Print the result
    mov eax, 4       ; sys_write system call
    mov ebx, 1       ; stdout
    mov ecx, result
    mov edx, 1       ; length of character
    int 0x80         ; call kernel

    ; Print newline
    mov eax, 4       ; sys_write system call
    mov ebx, 1       ; stdout
    mov ecx, newline
    mov edx, 1       ; length of newline
    int 0x80         ; call kernel

    ; Exit program
    mov eax, 1       ; sys_exit system call
    mov ebx, 0       ; exit status
    int 0x80         ; call kernel