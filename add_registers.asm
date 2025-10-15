; x86汇编程序：使用寄存器计算和
section .data
    result_msg db 'The sum is: ', 0
    newline db 10, 0

section .bss
    sum resb 4

section .text
    global _start

_start:
    ; 将数值加载到寄存器中
    mov eax, 10      ; 第一个数
    mov ebx, 20      ; 第二个数
    mov ecx, 30      ; 第三个数
    mov edx, 40      ; 第四个数
    
    ; 执行加法运算
    add eax, ebx     ; eax = eax + ebx (10 + 20 = 30)
    add eax, ecx     ; eax = eax + ecx (30 + 30 = 60)
    add eax, edx     ; eax = eax + edx (60 + 40 = 100)
    
    ; 将结果保存到内存
    mov [sum], eax
    
    ; 退出程序
    mov eax, 1       ; sys_exit
    xor ebx, ebx     ; exit status
    int 0x80