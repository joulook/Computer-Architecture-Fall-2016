include io.h
cr equ 10
lf equ 13

.model small
.stack 200h

.data 
new		db 		cr,lf
msg 	db		cr,lf,'Enter Your String : ',0
msgout 	db		cr,lf,'Your String is This : ',0
string	db		10 dup(?)

.code
main proc
	mov ax , @data
	mov ds , ax
	;--------------------------------------------------
	clrscr
	output msg
	inputs	string
	
	call invers
	
	output  new
	output	msgout
	output	string
	
	;--------------------------------------------------
	mov ax , 4c00h
	int 	21h
main 	endp

invers		proc
	;-----------------------------------------------
	mov si , offset string
	mov di , si
	xor ax , ax
move:
	cmp byte ptr[di] , 0
	jne movebx
	je  stequal

movebx:
	add di , 1
	jmp short move

stequal:
	sub di , 1
	mov al ,byte ptr[di]
	mov ah ,byte ptr[si]
	mov byte ptr[di] , ah
	mov byte ptr[si] , al
	mov mba , ah
	mov abm , bl
	add si , 1
	cmp si , di
	jne 	stequal
	
exit:
	ret
	;-----------------------------------------------
	invers 	endp
		end 	main		
		