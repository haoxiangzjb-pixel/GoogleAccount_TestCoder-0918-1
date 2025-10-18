section .text
    global _start

_start:
    ; 将两个数字加载到寄存器中进行加法运算
    mov eax, 10      ; 将数字10加载到EAX寄存器
    mov ebx, 20      ; 将数字20加载到EBX寄存器
    add eax, ebx     ; EAX = EAX + EBX，结果存储在EAX中
    
    ; 退出程序
    mov ebx, 0       ; 退出状态码
    mov eax, 1       ; 系统调用号 (sys_exit)
    int 0x80         ; 调用内核