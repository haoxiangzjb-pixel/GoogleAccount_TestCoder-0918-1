section .data
    ; 定义一些初始值
    num1 dd 10      ; 第一个数字
    num2 dd 20      ; 第二个数字
    num3 dd 30      ; 第三个数字
    result_msg db "The sum is: ", 0
    newline db 10, 0

section .bss
    result resd 1   ; 用于存储结果

section .text
    global _start

_start:
    ; 使用寄存器进行计算
    mov eax, [num1]     ; 将num1加载到eax寄存器
    add eax, [num2]     ; 将num2加到eax寄存器
    add eax, [num3]     ; 将num3加到eax寄存器
    mov [result], eax   ; 将结果存储到result变量中

    ; 退出程序
    mov eax, 1          ; 系统调用号 (sys_exit)
    xor ebx, ebx        ; 退出状态
    int 0x80            ; 调用内核