
proc rowCheck
;enter- the funtion gets the array that handle with all the win check
;exit- will check if there is any row win
	doPush ax
	mov al, [whowin]
	cmp al, [whowin+1]   ;place 0, 1
	jne ch4
ch2:
	cmp al, [whowin+2]   ;place 0, 2
	jne ch4
ch33: 
	cmp al, 0 
	jne ch3
ch4:
	mov al, [whowin+3]  
	cmp al, [whowin+4]   ;place 3, 4
	jne ch6
ch5:
	cmp al, [whowin+5]   ;place 3, 5
	jne ch6
ch34:
	cmp al, 0
	jne ch3
ch6:
	mov al, [whowin+6]
	cmp al, [whowin+7]   ;place 6, 7
	jne back
ch7: 
	cmp al, [whowin+8]   ;place 6, 8
	jne back
ch35:
	cmp al, 0    ;check that it aint a 0
	je back 
ch3:
	mov ah, [playerNow]
	mov [winPl], ah
	inc [win]
	inc [realWin]
	jmp back
back:
	doPop ax
	ret
endp rowCheck
proc cheColumn 
;enter- the funtion gets the array that handle with all the win check
;exit- will check if there is any column win
	push ax
	mov al, [whowin]
	cmp al, [whowin+3]   ;place 0, 3
	jne chc4
chc2:
	cmp al, [whowin+6]   ;place 0, 6
	jne chc4
chc33: 
	cmp al, 0
	jne chc3
chc4:
	mov al, [whowin+1]
	cmp al, [whowin+4]   ;place 1, 4
	jne chc6
chc5:
	cmp al, [whowin+7]   ;place 1, 7
	jne chc6
chc34:
	cmp al, 0
	jne chc3
chc6:
	mov al, [whowin+2]
	cmp al, [whowin+5]   ;place 2, 5
	jne back2
chc7: 
	cmp al, [whowin+8]   ;place 2, 8
	jne back2
chc36:
	cmp al, 0
	je back2 
chc3:
	mov ah, [playerNow]
	mov [winPl], ah
	inc [win]
	inc [realWin]
	jmp back2
back2:
	pop ax
	ret
endp cheColumn
proc slantCheck
;enter- the funtion gets the array that handle with all the win check
;exit- will check if there is any slant win
	push ax
	mov al, [whowin]
	cmp al, [whowin+4]   ;place 0, 4
	jne che4
che2:
	cmp al, [whowin+8]   ;place 0, 8
	jne che4
che33:
	cmp al, 0
	jne che3
che4:
	mov al, [whowin+6]
	cmp al, [whowin+4]   ;place 6, 4
	jne back3
che5:
	cmp al, [whowin+2]   ;place 6, 2
	jne back3
che34:
	cmp al, 0
	je back3
che3:
	mov ah, [playerNow]
	mov [winPl], ah
	inc [win]
	inc [realWin]
	jmp back3
back3:
	doPop ax
	ret
endp slantCheck
