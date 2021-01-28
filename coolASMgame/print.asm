proc printPix;הפרוצדורה מדפיסה פיקל עפ xy וצבע שמקבלת מהתוכנית הכללית
	doPush ax, bx, cx, dx
	mov bh,0h
	mov cx,[x]
	mov dx,[y]
	mov al,[color]
	mov ah,0ch
	int 10h
	doPop dx, cx, bx, ax
	ret
endp 
proc printLine;הפרוצדורה מדפיסה שורה שלמה עי כך שהיא קוראת לפרוצדורת הדפס הפיקל 15 פעמים ומקדמת את הx
    push cx
	mov cx,20
print:
    call printPix
	inc [x]
	loop print
	sub [x], 20
	pop cx
    ret
endp printLine
proc printRect;הפרוצדורה מדפיסה מלבן שלם עי כך שביא קוראת להדפסת שורה 20 פעמים וכל פעם תקדם את הy ליצירת שורה חדשה
     push cx
	 mov cx,15
line:	 
	 call printLine
	 inc [y]
	 loop line
	 pop cx
	 ret
endp printRect