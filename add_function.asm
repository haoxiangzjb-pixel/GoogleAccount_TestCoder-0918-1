section .text
    global add_numbers

; Function: add_numbers
; Takes two integer parameters and returns their sum
; Parameters: 
;   - First parameter in EAX register
;   - Second parameter in EBX register
; Returns:
;   - Sum in EAX register
add_numbers:
    add eax, ebx      ; Add EBX to EAX
    ret               ; Return with result in EAX