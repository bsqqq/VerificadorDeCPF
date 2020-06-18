; Autoria de Vinicius Moura Aragao
org 100h     
cpf db "CPF.txt",0
mov dx, offset cpf
mov al, 0h
mov ah, 3dh
int 21h 
mov bx, ax
mov cx, 0Bh
mov ah, 3fh
int 21h

;Convertendo de hexadecimal para decimal e colocando em outro lugar na memoria (0300h - 030Ah)

mov dl, [0100h]
sub dl, 30h
mov [0300h], dl 
mov dl, [0101h]
sub dl, 30h
mov [0301h], dl
mov dl, [0102h]
sub dl, 30h
mov [0302h], dl
mov dl, [0103h]
sub dl, 30h
mov [0303h], dl
mov dl, [0104h]
sub dl, 30h
mov [0304h], dl
mov dl, [0105h]
sub dl, 30h
mov [0305h], dl
mov dl, [0106h]
sub dl, 30h
mov [0306h], dl
mov dl, [0107h]
sub dl, 30h
mov [0307h], dl
mov dl, [0108h]
sub dl, 30h
mov [0308h], dl
mov dl, [0109h]
sub dl, 30h
mov [0309h], dl
mov dl, [010Ah]
sub dl, 30h
mov [030Ah], dl  
 

mov ax, 0h
mov bx, 0h
mov cx, 0h
mov dx, 0h

;Calculando o primeiro digito verificador

mov al, [0300h]
mov bl, 1h
mul bl
add cl, al 
mov al, [0301h]
mov bl, 2h
mul bl
add cl, al
mov al, [0302h]
mov bl, 3h
mul bl
add cl, al
mov al, [0303h]
mov bl, 4h
mul bl
add cl, al
mov al, [0304h]
mov bl, 5h
mul bl
add cl, al
mov al, [0305h]
mov bl, 6h
mul bl
add cl, al
mov al, [0306h]
mov bl, 7h
mul bl
add cl, al
mov al, [0307h]
mov bl, 8h
mul bl
add cl, al
mov al, [0308h]
mov bl, 9h
mul bl
add cl, al
mov al, cl
mov bl, 0bh
div bl
cmp ah, [0309h]
jz se
jnz senao
senao:
;primeiro digito incorreto (CPF invalido)
hlt
se:
;primeiro digito correto


mov [0309h], ah

mov ax, 0h
mov bx, 0h
mov cx, 0h
mov dx, 0h
 
nop
nop
nop



mov al, [0300h]
mov bl, 0h
mul bl
add cl, al 
mov al, [0301h]
mov bl, 1h
mul bl
add cl, al
mov al, [0302h]
mov bl, 2h
mul bl
add cl, al
mov al, [0303h]
mov bl, 3h
mul bl
add cl, al
mov al, [0304h]
mov bl, 4h
mul bl
add cl, al
mov al, [0305h]
mov bl, 5h
mul bl
add cl, al
mov al, [0306h]
mov bl, 6h
mul bl
add cl, al
mov al, [0307h]
mov bl, 7h
mul bl
add cl, al
mov al, [0308h]
mov bl, 8h
mul bl
add cl, al
mov al, [0309h]
mov bl, 9h
mul bl
add cl, al
mov al, cl
mov bl, 0bh
div bl     

cmp ah, [030Ah]
jz if
jnz no
no: 
mov ah, 0h
cmp ah, [030Ah]
jz sim
jnz nao

nao:
mov al, 1
	mov bh, 0
	mov bl, 3Bh
	mov cx, msg1end - offset msg1
	mov dl, 10
	mov dh, 7
	push cs
	pop es
	mov bp, offset msg1
	mov ah, 13h
	int 10h
	jmp msg1end
	msg1 db " CPF invalido! "
	msg1end:

hlt

sim:
mov al, 1
	mov bh, 0
	mov bl, 3Bh
	mov cx, msg2end - offset msg2 
	mov dl, 10
	mov dh, 7
	push cs
	pop es
	mov bp, offset msg2
	mov ah, 13h
	int 10h
	jmp msg2end
	msg2 db " CPF valido! (AH = 0Ah) " 
	msg2end:

hlt 

if:
mov al, 1
	mov bh, 0
	mov bl, 3Bh
	mov cx, msg3end - offset msg3  
	mov dl, 10
	mov dh, 7
	push cs
	pop es
	mov bp, offset msg3
	mov ah, 13h
	int 10h
	jmp msg3end
	msg3 db " CPF valido! "
	msg3end:

hlt
                       


