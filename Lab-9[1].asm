.model small
.stack 100h
.data
prompt1 db 'enter first single-digit number: $'
prompt2 db 0dh, 0ah, 'enter second single-digit number: $'
equal_msg db 0dh, 0ah, 'the numbers are equal.$'
not_equal_msg db 0dh, 0ah, 'the numbers are not equal.$'

.code
main proc
mov ax, @data
mov ds, ax

lea dx, prompt1
mov ah, 09h
int 21h
mov ah, 01h
int 21h
sub al, '0'
mov bl, al

lea dx, prompt2
mov ah, 09h
int 21h
mov ah, 01h
int 21h
sub al, '0'

cmp bl, al
je equal

lea dx, not_equal_msg
mov ah, 09h
int 21h
jmp exit

equal:
lea dx, equal_msg
mov ah, 09h
int 21h

exit:
mov ah, 4ch
int 21h

main endp

end main