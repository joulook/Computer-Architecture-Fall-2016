include io.h
cr	equ		10
lf	equ		13

.model small
.stack 200h

.data

newline		db	cr,lf,0
outputmsg	db	cr,lf,'Input your numbers : ',0
input 		db 	10 dup(?)
input2      dw  10 dup(?)
outp		dw  10 dup(?)

output2		db	cr , lf ,'Greater Number is : ',0
decoder		db	cr , lf ,'@de_coder -> Developed by JR.Y',0

.code
	
	main proc 
		mov 	ax,@Data
		mov		ds,ax
		;--------------------------------------- telegram: @de_coder
		clrscr
		mov si,offset input2
		mov cx , 10
		
lb1:	output outputmsg
		inputs input,3
		atoi input
		mov [si] , ax
		push [si]
		add si,2
		loop lb1
		
		call max
		call dis
		
		;--------------------------------------- telegram: @de_coder
		mov ax,4c00h
		int	21h
		main 	endp
		;---------------------------------------
		max   	proc
		;---------------------------------------
		push bp
		mov  bp , sp
		mov cx , 7
		
		add bp , 4
		mov ax , [bp]
		;add bp , 2
		;mov bx , [bp]
lb3:	
		add bp , 2
		mov bx , [bp]
		
		cmp ax , bx
		jna move
		ja  above
		
above:
		jmp short en
move:	
		mov ax , bx
en:		
		loop lb3
		pop bp
		ret 10
		;--------------------------------------- developed by Pilo
		max 	endp
		;---------------------------------------
		dis		proc
		;--------------------------------------- 
		itoa outp , ax
		output newline
		output output2
		output 	outp  
		output decoder
		;--------------------------------------- https://telegram.me/de_coder
		dis	endp
				end main






