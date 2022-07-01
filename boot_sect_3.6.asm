mov ah, 0x0e   ; scrolling teletype BIOS routine

mov bp, 0x8000 ; set base of stack above where BIOS loads boot sector so as not to overwrite it
mov sp, bp     ; set top of the stack to base of stack pointer

push 'A'       ; push characters onto the stack as 16-bit values - most significant byte will be 0x00
push 'B'
push 'C'

mov al, [0x7ffa] ; to prove stack grows down from bp fetch char at 0x8000 - 0x6
int 0x10        ; print al

pop bx         ; pop 16-bits into bx
mov al, bl     ; move bl (low byte of bx register) into al (for the char)
int 0x10       ; print al

pop bx         ; repeat
mov al, bl
int 0x10

mov al, [0x7ffe] ; to prove stack grows down from bp fetch char at 0x8000 - 0x2
int 0x10        ; print al

jmp $ ; jump forever

times 510-($-$$) db 0 ; pad with 0s
dw 0xaa55 ; magic number
