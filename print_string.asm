
print_string:
  mov al, [bx]
  add bx, 1    ; progress to next character
  cmp al, 0
  jne print_char
  ret

print_char:
  mov ah, 0x0e 
  int 0x10     ; print char in al
  jmp print_string

