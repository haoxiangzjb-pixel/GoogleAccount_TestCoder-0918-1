section .text
    global add_numbers

; Function to add two numbers
; Receives two integers in EDI and ESI registers
; Returns the sum in EAX register
add_numbers:
    mov eax, edi    ; Move first number to EAX
    add eax, esi    ; Add second number to EAX
    ret             ; Return with sum in EAX