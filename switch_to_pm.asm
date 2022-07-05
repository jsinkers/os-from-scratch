[bits 16]
; switch to protected mode
switch_to_pm:
    cli ; switch off interrupts until protected mode interrupt vector setup
    lgdt [gdt_descriptor] ; load global descriptor table

    mov eax, cr0 ; set 1st bit of control register cr0 to switch to protected mode
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:init_pm ; make a far jump (to a new segment) to 32-bit code
        ; forces CPU to flush cache of pre-fetched/real-mode decoded instructions

[bits 32]
; initialise registers and stack 
init_pm:
    mov ax, DATA_SEG ; point segment registers to data selector defined in GDT
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000 ; update stack position to be at top of free space
    mov esp, ebp

    call BEGIN_PM
