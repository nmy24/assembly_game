proc showMouse
;enter- none
;exit- show the mouse
	mov ax,0h
	int 33h
	mov ax,1h
	int 33h
	ret
endp showMouse
proc getInpMouse
;enter- mouse status 
;exit- when the mouse was clicked
	doPush ax, si, bx
	xor bx, bx
getLoc:; will get the location
mouseLP:
	mov ax,3h
	int 33h
	and bx,01h	; check left mouse click
	jz mouseLP
	shr cx,1	; adjust cx to range 0-319 to feet screen
	sub dx,1	; move one pixel so the pixel will not be hidden; by the mouse
	mov [x], cx
	mov [y], dx
goNext:
	mov ax,3h
	int 33h
	and bx,01h	; check left mouse click
	cmp bx, 00000000b     ;if stop the click
	jne goNext
sound:
	mov [note], 3445h
	call startSound
	call playSound
	inc bx
	cmp bx, 10
	jne sound
	call stopSound
	doPop bx, si, ax
	ret
endp getInpMouse
proc hideMouse
;enter- none
;exit- hide the mouse
	mov ax,2h
	int 33h
	ret
endp hideMouse