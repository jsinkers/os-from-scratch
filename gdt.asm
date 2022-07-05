; GDT

gdt_start:

gdt_null: ; mandatory null descriptor
    dd 0x0 ; dd: define double word (4 bytes)
    dd 0x0

gdt_code: ; code segment descriptor, base: 0x0, limit: 0xfffff
    dw 0xffff ; limit
    dw 0x0 ; base 
    db 0x0 ; base
    db 10011010b ; 1st flags: present, code, readable
    db 11001111b ; 2nd flags
    db 0x0 ; base

gdt_data: ; data segment descriptor
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end: ; put label at end of GDT for assembler to calculate size for descriptor

gdt_descriptor: 
    dw gdt_end - gdt_start - 1 ; size of gdt
    dd gdt_start ; start address

; Constants
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
         
