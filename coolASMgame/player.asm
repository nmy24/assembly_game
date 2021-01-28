proc changePlyr
;enter- playerNow
;exit- change the player to have the other player to play
	cmp [playerNow], 0
	je nexturn1
	dec [playerNow]
	jmp retPath2
nexturn1:
	inc [playerNow]
retPath2:
	ret
endp changePlyr
proc randStr
;enter- none
;exit- gives a random number, 0 or 1: who starts the game
	; generate random number, cx number of times
	mov ax, [Clock] 		; read timer counter
	mov ah, [byte cs:bx] 	; read one byte from memory
	xor al, ah 			; xor memory and counter
	and al, 00000001b 		; leave result between 0-15
	inc bx
	mov [playerNow], al
	ret
endp randStr
proc setTypeBaby
;enter- none
;exit- will set the photo size, character
	call hideMouse
	call babyType
	cmp [playerNow], 0       ;puts the right pic for each playe
	je xTurn
	jne oTurn
xTurn:
	mov dx, offset fileX
	jmp retPath
oTurn:
	mov dx, offset fileO
retPath:
	ret
endp setTypeBaby
proc turnHandle
;enter- gets the index of the pressed cube from VAL index
;exit- will change the whowin array with the player sign 
	push ax
	xor ax, ax
	mov al, [index]
	cmp [playerNow],0
	je yeTurn
	jne grayTurn
yeTurn:
	mov ah, 1
	jmp check
grayTurn:
	mov ah, 2
check: 
	cmp [index], 0
	je firstS
	cmp [index], 1
	je secondS
	cmp [index], 2
	je third
	cmp [index], 3
	je fourth
	cmp [index], 4
	je fifth
	cmp [index], 5
	je sixth
	cmp [index], 6
	je seventh
	cmp [index], 7
	je eighth
	cmp [index], 8
	je ninth
firstS:
	mov [whowin], ah
	jmp endPath
secondS:
	mov [whowin+1], ah
	jmp endPath
third:
	mov [whowin+2], ah
	jmp endPath
fourth:
	mov [whowin+3], ah
	jmp endPath
fifth:
	mov [whowin+4], ah
	jmp endPath
sixth:
	mov [whowin+5], ah
	jmp endPath
seventh:
	mov [whowin+6], ah
	jmp endPath
eighth:
	mov [whowin+7], ah
	jmp endPath
ninth:
	mov [whowin+8], ah
endPath:	
	pop ax
	ret
endp turnHandle
proc whosturn
;enter- will get from the var playerNow who is the player
;exit- print a rectangle to show who plays right now
	mov [color], 0FFh
	cmp [playerNow], 0
	je firPlayer
secPlayer:
	mov [x], 253
	mov [y], 190
	call printRect
	mov [color], 2
	mov [x], 47
	mov [y], 190
	jmp prin
firPlayer:
	mov [x], 47
	mov [y], 190
	call printRect
	mov [color], 2
	mov [x], 253
	mov [y], 190
prin:
	call printRect
	ret
endp whosturn
