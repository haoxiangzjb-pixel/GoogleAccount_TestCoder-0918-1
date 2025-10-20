; x86汇编程序 - 使用寄存器计算和
section .data
    ; 数据段（如果需要定义常量或变量）

section .text
    global _start

_start:
    ; 将要相加的值加载到寄存器中
    mov eax, 10      ; 将第一个数加载到EAX寄存器
    mov ebx, 20      ; 将第二个数加载到EBX寄存器
    mov ecx, 30      ; 将第三个数加载到ECX寄存器
    
    ; 计算和：EAX = EAX + EBX + ECX
    add eax, ebx     ; EAX = EAX + EBX (10 + 20 = 30)
    add eax, ecx     ; EAX = EAX + ECX (30 + 30 = 60)
    
    ; 结果现在存储在EAX寄存器中 (EAX = 60)
    
    ; 退出程序
    ; 在Linux中，系统调用退出
    mov ebx, 0       ; 退出状态
    mov eax, 1       ; 系统调用号 (sys_exit)
    int 0x80         ; 调用内核