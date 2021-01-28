proc printBabyCh
;enter- none
;exit- will print the baby in the cube
	call turnHandle
	call imgPrint
	call showMouse
	ret
endp printBabyCh
proc firColor
;enter- none
;exit- will print in the cube the character
	mov [index], 0
	call setTypeBaby
	mov [leftGap], 114
	mov [topGap], 320 * 36
	call printBabyCh
	ret
endp firColor
proc secColor
;enter- none
;exit- will print in the cube the character
	mov [index], 1
	call setTypeBaby
	mov [leftGap], 160
	mov [topGap], 320 * 36
	call printBabyCh
	ret
endp secColor
proc thirdColor
;enter- none
;exit- will print in the cube the character
	mov [index], 2
	call setTypeBaby
	mov [leftGap], 207
	mov [topGap], 320 * 36
	call printBabyCh
	ret
endp thirdColor
proc fourthColor
;enter- none
;exit- will print in the cube the character
	mov [index], 3
	call setTypeBaby
	mov [leftGap], 114
	mov [topGap], 320 * 77
	call printBabyCh
	ret
endp fourthColor
proc fifthColor
;enter- none
;exit- will print in the cube the character
	mov [index], 4
	call setTypeBaby
	mov [leftGap], 160
	mov [topGap], 320 * 77
	call printBabyCh
	ret
endp fifthColor
proc sixColor
;enter- none
;exit- will print in the cube the character
	mov [index], 5
	call setTypeBaby
	mov [leftGap], 207
	mov [topGap], 320 * 77
	call printBabyCh
	ret
endp sixColor
proc sevenColor
;enter- none
;exit- will print in the cube the character
	mov [index], 6
	call setTypeBaby
	mov [leftGap], 114
	mov [topGap], 320 * 118
	call printBabyCh
	ret
endp sevenColor
proc eightColor
;enter- none
;exit- will print in the cube the character
	mov [index], 7
	call setTypeBaby
	mov [leftGap], 160
	mov [topGap], 320 * 118
	call printBabyCh
	ret
endp eightColor
proc nineColor
;enter- none
;exit- will print in the cube the character
	mov [index], 8
	call setTypeBaby
	mov [leftGap], 207
	mov [topGap], 320 * 118
	call printBabyCh
	ret
endp nineColor
proc isAColor
;enter- gets the mouse status while he was clicked
;exit- prints an image if the click was on one of the matrix color
	xor bh, bh
	mov cx,[x]
	mov dx,[y]
	mov ah,0Dh
	int 10h ; return al the pixel value read, will compare it to the games matrix color
	cmp al, 9Fh
	je first
	cmp al, 67h
	je second
	cmp al, 5Fh
	je three
	cmp al, 0FBh
	je four
	cmp al, 3Fh
	je five
	cmp al, 77h
	je six
	cmp al, 0ABh
	je seven
	cmp al, 0F2h
	je eight
	cmp al, 0E2h
	je nine
	dec [counter]
	call changePlyr
	jmp next
first:
	call firColor
	jmp next
second:
	call secColor
	jmp next
three:
	call thirdColor
	jmp next
four:
	call fourthColor
	jmp next
five:
	call fifthColor
	jmp next
six:
	call sixColor
	jmp next
seven:
	call sevenColor
	jmp next
eight:
	call eightColor
	jmp next
nine:
	call nineColor
next:
	ret
endp isAColor