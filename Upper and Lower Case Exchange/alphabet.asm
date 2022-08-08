include io.h
cr equ 10
lf equ 13

.model small
.stack 200h

.data

new 	db 		cr , lf ,0
msg 	db 		cr , lf , 'Enter Your String : ',0
msgres  db 		cr , lf , 'The Result is : ',0

string 	db 		10 dup(?)
temp 	db		0
temp1 	db		cr , lf , 'Enter Your ng : ',0

.code
main 	proc
	mov ax , @data
	mov ds , ax
	;----------------------------------
	clrscr
	output msg
	inputs string , 7
	
	call alphabet
	
	output new
	output msgres
	output string
	;----------------------------------
	mov ax , 4c00h
	int 21h
main  endp

alphabet proc 
	;---------------------------------
	mov si , offset string
	
	
move:
    cmp byte ptr[si] , 0
	je exit
	mov al , byte ptr[si]
	test al , 20h
	jz upper
	jnz lower
upper:
	or	al , 00100000b
	mov byte ptr[si] , al
	mov temp , al 
	inc si
	jmp short move
lower:
	and al , 11011111b
	mov byte ptr[si] , al
	inc si
	jmp short move
exit:	
	ret
	;---------------------------------
alphabet endp
	end main