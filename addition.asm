section .text
    global _start

; Функция для сложения двух чисел
; Вход: EAX = первое число, EBX = второе число
; Выход: EAX = результат сложения
add_func:
    add eax, ebx
    ret

_start:
    ; Загружаем числа для сложения в регистры EAX и EBX
    mov eax, 5
    mov ebx, 3

    ; Вызываем функцию сложения
    call add_func

    ; Результат теперь в EAX
    ; Выход из программы
    mov ebx, 0
    mov eax, 1
    int 0x80