proc printNumber
;enter - Number in al.
;exit - Prints number digit by digit.
    doPush ax,bx,dx
    mov bx,offset divisorTable
nextDigit:
    xor ah,ah         
    div [byte ptr bx]   ;	al = Quotient, ah = Remainder.
    add al,'0'
    call printCharacter  	;	Display The Quotient.
    mov al,ah          	
	add bx,1  	;	Next Divisor.
	doPush ax,bx
	mov ah, 3h
	xor bh,bh
	int 10h
	mov ah, 2	;	For Cursor Setting.	
	inc dl ;	Moves Cursor One Place To The Right For Printing The Whole Score Value.
	int 10h
doPop bx,ax
    cmp [byte ptr bx],0 ;	Have All Divisors Been Differentone?
    jne nextDigit
doPop dx, bx,ax
    ret
endp printNumber
;	Enter - Character in al.
;	Exit - Prints the character.
proc printCharacter
doPush ax,bx,cx	
	xor bh,bh
	mov bl, 0fh
	mov cx,1
	mov	ah,9	;	Prints Score's Character On Screen. 
	int	10h	
	doPop cx,bx,ax
	ret
endp printCharacter
;	Enter - Receives score. 
;	Exit - Prints the score.
proc printScore1
	doPush ax, bx, dx
	xor bh,bh
	mov dh,10h	;	Set Cursor Column.
	mov dl,37	;	Set Cursor Row.
	mov ah, 2	
	int 10h
	mov al, [babyScore]	;	Move Score To al For Printing It.
	call printNumber
	doPop dx,bx,ax
	ret
endp printScore1 


;	Enter - Receives score. 
;	Exit - Prints the score.
proc printScore2
	doPush ax, bx, dx
	xor bh,bh
	mov dh,10h	;	Set Cursor Column.
	mov dl,6	;	Set Cursor Row.
	mov ah, 2	
	int 10h
	mov al, [baby2Score]	;	Move Score To al For Printing It.
	call printNumber
	doPop dx,bx,ax
	ret
endp printScore2 