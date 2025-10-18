; x86汇编程序：使用寄存器计算两个数的和

section .data
    num1 dd 15          ; 定义第一个数
    num2 dd 25          ; 定义第二个数
    result_msg db "The sum is: ", 0
    newline db 10, 0    ; 换行符

section .bss
    result resd 1       ; 为结果预留空间

section .text
    global _start

_start:
    ; 将两个数加载到寄存器中
    mov eax, [num1]     ; 将num1的值加载到eax寄存器
    mov ebx, [num2]     ; 将num2的值加载到ebx寄存器
    
    ; 计算和并存储到ecx寄存器
    mov ecx, eax        ; 将eax的值移动到ecx
    add ecx, ebx        ; ecx = ecx + ebx，即ecx = eax + ebx
    
    ; 将结果保存到内存
    mov [result], ecx
    
    ; 退出程序
    mov eax, 1          ; sys_exit系统调用号
    xor ebx, ebx        ; 退出状态码
    int 0x80            ; 调用内核