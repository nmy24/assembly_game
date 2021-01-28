proc playSound;הפרוצדורה מקבלת מהתוכנית הראשית תדר מסויים ומשמיעה אותו
	; send control word to change frequency
	mov al,0b6h
	out 43h,al
	; play frequency 131Hz
	mov ax,[note]
	out 42h,al	; sending lower byte
	mov al,ah
	out 42h,al
	ret
endp playSound
proc startSound;הפרוצדורה מדליקה את הסאונד של המחשב על מנת שישמעו את התדר
	; open speaker
	in al,61h
	or al,00000011b
	out 61h,al	
	ret
endp startSound
proc stopSound;הפרוצדורה מפסיקה את הסאונד על מנת שיפסיקו לשמוע את התדר
	; close the speaker
	in al,61h
	and al,11111100b
	out 61h,al
	ret
endp stopSound
