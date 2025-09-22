section .text
    global add_numbers

; Function to add two integers
; Parameters:
;   eax - first number
;   ebx - second number
; Returns:
;   eax - sum of the two numbers

add_numbers:
    add eax, ebx    ; Add the two numbers
    ret             ; Return with result in eax