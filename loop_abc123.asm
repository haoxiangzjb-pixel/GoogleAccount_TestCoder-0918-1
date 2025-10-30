section .text
    global _start

_start:
    mov ecx, 10          ; contador del bucle

bucle:
    ; Aquí va el cuerpo del bucle
    ; Por ejemplo, decrementar el contador
    dec ecx

    ; Comprobar si el contador es mayor que 0
    cmp ecx, 0
    jg bucle             ; salta a 'bucle' si ecx > 0

    ; Terminar el programa
    mov eax, 1           ; sys_exit
    int 0x80