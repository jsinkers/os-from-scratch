; a boot sector that prints a string using our function

[org 0x7c00] ; tell assembler where the code will be loaded

mov bx, HELLO_MSG  ; use BX as a parameter to our function
call print_string

mov bx, GOODBYE_MSG
call print_string

jmp $ ; hang

%include "print_string.asm"

HELLO_MSG:
    db "Hello, World!", 0
    
GOODBYE_MSG:
    db "Goodbye!", 0

; padding
times 510-($-$$) db 0
; magic number
dw 0xaa55
