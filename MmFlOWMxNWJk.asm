section .text
    global _start

_start:
    ; 将两个数字加载到寄存器中
    mov eax, 10      ; 第一个数字存入EAX寄存器
    mov ebx, 20      ; 第二个数字存入EBX寄存器
    
    ; 计算两数之和
    add eax, ebx     ; EAX = EAX + EBX
    
    ; 将结果保存到内存位置（可选，这里演示如何存储）
    mov [result], eax
    
    ; 退出程序
    mov eax, 1       ; sys_exit系统调用号
    int 0x80         ; 调用内核

section .data
    result dd 0      ; 定义一个双字（32位）变量存储结果