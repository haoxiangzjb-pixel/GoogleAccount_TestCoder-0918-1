section .text
    global _start

; Функция для сложения двух чисел
; Вход: EAX = первое число, EBX = второе число
; Выход: EAX = результат сложения
add_func:
    add eax, ebx
    ret

; Точка входа в программу
_start:
    ; Загружаем числа в EAX и EBX
    mov eax, 5
    mov ebx, 10

    ; Вызываем функцию сложения
    call add_func

    ; Результат теперь в EAX (ожидаем 15)

    ; Выход из программы
    mov ebx, 0         ; код возврата
    mov eax, 1         ; системный вызов sys_exit
    int 0x80           ; вызов ядра