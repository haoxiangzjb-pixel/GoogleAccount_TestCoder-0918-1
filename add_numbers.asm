section .text
global _start

; Функция для сложения двух чисел
; Вход: eax = первое число, ebx = второе число
; Выход: eax = результат сложения
add_numbers:
    add eax, ebx
    ret

; Пример использования
_start:
    mov eax, 5      ; Загрузить первое число в eax
    mov ebx, 3      ; Загрузить второе число в ebx
    call add_numbers ; Вызвать функцию сложения

    ; Выход из программы
    mov ebx, 0      ; Код возврата
    mov eax, 1      ; Системный вызов exit
    int 0x80        ; Вызов ядра