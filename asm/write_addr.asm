; perform many writes to the given address

rst 24  ; write address -> de
push de
pop hl

ld c, 50
ld de, 0

loop:
ld (hl), e

dec e
jr nz, loop
dec d
jr nz, loop
dec c
jr nz, loop

jp (iy)
