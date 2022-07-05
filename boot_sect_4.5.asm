; boot sector that enters 32 bit protected mode
[org 0x7c00]

mov bp, 0x9000 ; set the base pointer for the stack
mov sp, bp     ; set the stack pointer as the base pointer

mov bx, MSG_REAL_MODE
call print_string

call switch_to_pm ; never return from here

jmp $

%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"

[bits 32]

; where we arrive after switching to and initialising protected mode
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm  ; use 32-bit print routine

    jmp $ ; hang

; Global variables

MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROT_MODE db "Successfully landed in 32-bit protected mode", 0

; bootsector padding and magic number
times 510-($-$$) db 0
dw 0xaa55
