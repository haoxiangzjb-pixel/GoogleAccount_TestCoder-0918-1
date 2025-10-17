; x86汇编程序：使用寄存器计算两个数的和
section .data
    num1    dd  100         ; 第一个数
    num2    dd  200         ; 第二个数
    result  dd  0           ; 存储结果

section .text
    global _start

_start:
    ; 将两个数加载到寄存器中
    mov eax, [num1]         ; 将num1的值加载到EAX寄存器
    mov ebx, [num2]         ; 将num2的值加载到EBX寄存器
    
    ; 计算和
    add eax, ebx            ; EAX = EAX + EBX
    
    ; 将结果存储到内存中
    mov [result], eax       ; 将EAX中的结果存储到result变量中
    
    ; 程序退出
    mov eax, 1              ; 系统调用号 (sys_exit)
    xor ebx, ebx            ; 退出状态
    int 0x80                ; 调用内核