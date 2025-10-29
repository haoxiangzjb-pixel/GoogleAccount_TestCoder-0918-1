; x86汇编程序：使用寄存器计算和
; 计算寄存器EAX, EBX, ECX, EDX的和，并将结果存储到ESI中

section .data
    result_msg db 'Sum of registers: ', 0
    newline db 10, 0

section .bss
    ; 未初始化数据段

section .text
    global _start

_start:
    ; 初始化寄存器
    mov eax, 10      ; 第一个数
    mov ebx, 20      ; 第二个数
    mov ecx, 30      ; 第三个数
    mov edx, 40      ; 第四个数

    ; 计算和
    add eax, ebx     ; EAX = EAX + EBX = 10 + 20 = 30
    add eax, ecx     ; EAX = EAX + ECX = 30 + 30 = 60
    add eax, edx     ; EAX = EAX + EDX = 60 + 40 = 100

    ; 将结果保存到ESI寄存器
    mov esi, eax     ; ESI = EAX = 100

    ; 退出程序
    mov eax, 1       ; sys_exit系统调用号
    mov ebx, 0       ; 退出状态
    int 0x80         ; 调用内核