; x86汇编程序：使用寄存器计算两数之和
section .data
    num1 dd 10          ; 定义第一个数
    num2 dd 20          ; 定义第二个数
    result dd 0         ; 存储结果

section .text
    global _start

_start:
    ; 将num1加载到eax寄存器
    mov eax, [num1]
    
    ; 将num2加载到ebx寄存器
    mov ebx, [num2]
    
    ; 计算eax + ebx，结果保存在eax中
    add eax, ebx
    
    ; 将结果保存到result变量
    mov [result], eax

    ; 退出程序
    mov eax, 1          ; sys_exit系统调用号
    xor ebx, ebx        ; 退出状态
    int 0x80            ; 调用内核