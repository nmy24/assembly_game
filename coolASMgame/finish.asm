proc finishIMG
;enter: realWin, tells who is the winner if there is one
;exit- plays an IMG
	call imgType
	cmp [realWin], 0
	je ret__
	cmp [winPl], 0
	je plyrO
	mov dx, offset fileEnds
	call hideMouse
	call imgPrint
	call showMouse
	jmp fi
plyrO:
	mov dx, offset fileEndf
	call hideMouse
	call imgPrint
	call showMouse
	jmp fi
ret__:
	call imgType
	mov dx, offset fileNol
	call hideMouse
	call imgPrint
	call showMouse
fi:
	ret
endp finishIMG
proc scoreHandle
;enter- gets var winPl, players scors
;exit- change the scores if needed
	cmp [realWin], 0
	je next_
	cmp [winPl], 0
	je babyWin
	cmp [winPl], 1
	je babyWin2
babyWin:
	inc [babyScore]
	jmp next_
babyWin2:
	inc [baby2Score]
next_:
	ret
endp scoreHandle
proc resetVars
;enter- gets realWin, whowin array, win, counter
;exit- reset values
	mov [realWin], 0
	mov [whowin+1], 0
	mov [whowin+2], 0
	mov [whowin+3], 0
	mov [whowin+4], 0
	mov [whowin+5], 0
	mov [whowin+6], 0
	mov [whowin+7], 0
	mov [whowin+8], 0
	mov [win], 0
	mov [counter], 0
	ret
endp resetVars
proc anotherGame
;enter- none
;exit- will check if the plater wants to play another game
	doPush ax, bx, cx, dx
	call getInpMouse
	mov bh,0h
	mov cx,[x]
	mov dx,[y]
	mov ah,0Dh
	int 10h ; return al the pixel value read, will compare it to the games matrix color
	cmp al, 9Fh
	je still
	mov [stillPlay], 0
	jmp still_
still:
	mov [stillPlay], 1
still_:
	doPop dx, cx, bx, ax
	ret
endp anotherGame