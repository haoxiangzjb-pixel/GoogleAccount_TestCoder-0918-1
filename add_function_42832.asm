section .text
    global add_numbers

; Function to add two integers
; Parameters:
;   edi - first number
;   esi - second number
; Returns:
;   eax - sum of the two numbers

add_numbers:
    mov eax, edi    ; Move first number to eax
    add eax, esi    ; Add second number to eax
    ret             ; Return with result in eax