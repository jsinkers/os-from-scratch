
# OS from Scratch

Following along with https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

## Dependencies

- `nasm` as assembler
- `qemu` as emulator

## To assemble:

```bash
nasm boot_sect_3.5.1.asm -f bin -o boot_sect_3.5.1.bin
```

## To run:

```bash
qemu-system-x86_64 boot_sect_3.5.1.bin
```
