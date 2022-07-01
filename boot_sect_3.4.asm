[org 0x7c00]

mov ah, 0x0e ; scrolling teletype BIOS routine

; attempt 1
mov al, the_secret  ; move address of the_secret into register al
int 0x10

; attempt 2
mov al, [the_secret] ; move value of the_secret into register al
int 0x10

; attempt 3
mov bx, the_secret ; move address of the_secret into register bx
add bx, 0x7c00 ; add value 0x7c00 to value stored in register bx
mov al, [bx]  ; move value stored in register bx to register al
int 0x10

; attempt 4
mov al, [0x7c1e]  ; move value at address 0x7c1e to register al
int 0x10

jmp $

the_secret:
  db "X"        ; define byte: initialise memory with 1+ byte values

; padding
times 510-($-$$) db 0

; magic BIOS number
dw 0xaa55


