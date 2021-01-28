include macross.asm
IDEAL
MODEL small
STACK 100h
DATASEG
	realWin		db 0   ;will help check if there is a real winner or no ones wins
	stillPlay	db 1   ; will help check if the player is still playing
	babyScore	db 0    ;the first char score
	baby2Score	db 0    ;the second char score
	divisorTable db 10,1,0   ; max value of score 
	note 	 	dw 0	; 1193180/131-> (hex)      for sound
	Clock 		equ es:6Ch                 ;for the random
	whowin		db 0, 0, 0, 0, 0, 0, 0, 0, 0;the arrey will be reponsible for help checking for a win
	x 			dw 0                 ;x point of the screen
	y 			dw 0                 ;y point of the screen
	fileEnd		db 'end2.bmp',0      ;end game photo offset
	filesta		db 'start.bmp',0     ;start game photo offset
	filename    db 'gameOn.bmp',0    ; game photo offset
	fileX       db 'baby.bmp',0      ; baby1 photo offset
	fileO		db 'baby2.bmp',0     ; baby2 photo offset
	fileInst	db 'inst.bmp',0      ;instructions photo offset
	fileNol		db 'no3.bmp',0       ;if no one is winning
	fileEndf	db 'endB1.bmp',0     ;end game, win if baby 1
	fileEnds	db 'endB2.bmp',0     ;end game, win if baby 2
	filehandle 	dw ?                 ;      ; 
	picHigh 	dw 0                       ;the high of the IMG
	leftGap 	dw 0                       ;left distant for the IMG
	topGap 		dw 0                       ; top distant for the IMG
	picWidth 	dw 0                       ; width of the IMG
	Header      db 54 dup (0)              ;
	Palette     db 256*4 dup (0)           ;BMP palette
	ScrLine     db 320 dup (0)             ;helps coppy every line of a bmp file to the sreen
	ErrorMsg  	db 'Error', 13, 10,'$'     ;in case of a photo does not come to the screen
	color 		db 0                       ;gets a color later in the code
	playerNow	db 0                       ;who is the playrt now
	counter		db 0                       ;count the game run time
	index		db 0                       ;index of the pressed cube
	win 		db 0                       ;if the value is 0 than there is no winner, else there is
	winPl		db 0                       ; the winner index of the array
	
CODESEG
include "mo.asm";mouse handle
include "picFf.asm"
include "score.asm"
include "finish.asm"
include "print.asm"
include "cubs.asm"
include "player.asm"
include "winCheck.asm"
include "sound.asm"
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	; Graphic mode
	mov ax, 13h 
	int 10h
sta:
	call imgType
	mov dx, offset filesta   ;start
	call imgPrint            ;print start IMG
	call showMouse           ;shows the mouse
startPos:
	call getInpMouse         ;get a click from the user
	mov bh,0h
	mov cx,[x]
	mov dx,[y]
	mov ah,0Dh
	int 10h ; return al the pixel value read, will compare it to the games matrix color
	cmp al, 0E5h;start 
	je next3
	cmp al, 9;instructions
	je inst
	jne startPos
next3:
	jmp startGM
inst:
	call hideMouse                    ;hide the mouse
	call imgType                      ;set the type of IMG for a big fic
	mov dx, offset fileInst           ;mov dx the memoy sell of start IMG
	call imgPrint                     ;print the start IMG 
	call showMouse                    ;show the mouse
	call getInpMouse                  ;get a click from the user
	call hideMouse                    ;hide the mouse
	jmp sta                           ;
startGM:
	call resetVars                    ;reset all VARs needed for a new game
	call imgType
	call hideMouse
	mov dx, offset filename
	call imgPrint                    ;print the main game pic
	call showMouse
	
startGame:
	call printScore2                 ;print score of daddy shark
	call printScore1                 ;print score of mommy shark
	call whosturn                    ;print a cube near any CHAR to help realizing who plays right now
	call getInpMouse                 ;get the click from the player
	call isAColor; if a matrix was clicked
	call rowCheck                    ;check every row to see if someone wins
	call cheColumn                   ;check every column to see if someone wins
	call slantCheck                  ;check every slant to see if someone wins
	cmp [win], 0                     ;if someone won
	jne winner
	call changePlyr                  ;change the current player
	inc [counter]                    ;the game counter
	cmp [counter], 9                 ;if the game was ended
	jne startGame
winner:
	call finishIMG
	call scoreHandle
	call anotherGame
	cmp [stillPlay], 1
	je startGM
	;loop startGame; main loop
	
	;text mode
	mov ah, 0
	mov al, 2
	int 10h

exit:
	mov ax, 4c00h
	int 21h
END start