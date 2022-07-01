[org 0x7c00] ; tell assembler where the code will be loaded

mov dx, 0x1fb6  ; store the value to print in dx
call print_hex
jmp $

print_hex:
    ; manipulate chars at HEX_OUT to reflect DX
    mov bx, HEX_OUT ; put HEX_OUT address in bx
    ;call print_string

    add bx, 5 ; move to last character 
    jmp convert_hex_char

    convert_hex_char:
        ;call print_string
        mov ax, 0x000f ; mask for last 4-bits
        and al, dl ; bitwise and of dx with ax
        cmp al, 10 ; is it < 10
        jl digit ; adjust to digit
        jmp char ; adjust to char
    return_here:
        shr dx, 4 ; right-shift dx by 4 bits
        sub bx, 1 ; decrement bx (move one character to the left)
        cmp byte [bx], 'x' ; are we at the 'x' character?
        jne convert_hex_char
        mov bx, HEX_OUT ; print the string pointed to by bx
        call print_string
        ret

char: 
    mov byte [bx], 'a'
    sub ax, 10
    add [bx], ax
    jmp return_here

digit:
    add [bx], ax
    jmp return_here

%include "print_string.asm"

; global variables
HEX_OUT: 
    db "0x0000", 0

; padding
times 510-($-$$) db 0
; magic number
dw 0xaa55
