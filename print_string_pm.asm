[bits 32]
; constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; prints a null-terminated string pointed to by edx
print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY ; set edx to start of video memory

print_string_pm_loop:
    mov al, [ebx] ; store character at EBX in AL
    mov ah, WHITE_ON_BLACK ; store attributes in AH

    cmp al, 0 ; check if at end of string
    je print_string_pm_done   ; jump to done

    mov [edx], ax ; store char and attributes at current character cell
    
    add ebx, 1 ; increment ebx to next char in string
    add edx, 2 ; move to next character cell in video memory

    jmp print_string_pm_loop ; loop around to print the next char

print_string_pm_done:
    popa
    ret 

