; x86汇编程序：使用寄存器计算两个数的和
section .data
    num1    dd  15          ; 定义第一个数
    num2    dd  25          ; 定义第二个数
    result  dd  0           ; 存储结果

section .text
    global _start

_start:
    ; 将num1的值加载到eax寄存器
    mov eax, [num1]
    
    ; 将num2的值加载到ebx寄存器
    mov ebx, [num2]
    
    ; 将eax和ebx相加，结果存储在eax中
    add eax, ebx
    
    ; 将结果存储到result变量中
    mov [result], eax

    ; 程序退出
    mov eax, 1      ; 系统调用号 (sys_exit)
    xor ebx, ebx    ; 退出状态
    int 0x80        ; 调用内核