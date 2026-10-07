INCLUDE Irvine32.inc

.stack 4096

.data
reading		SBYTE		4 DUP(?)
offsett		SBYTE		-5, 3, -2, 7
adjust		SBYTE		4 DUP(?)
final		SBYTE		?
rMsg		BYTE		"Enter reading: ", 0	
aMsg		BYTE		"Adjusted Readings: ", 0
dMsg		BYTE		"R (Decimal): ", 0
hMsg		BYTE		"R (Hexadecimal): ", 0
lwMsg		BYTE		"Low WORD of R: ", 0
lbMsg		BYTE		"Low BYTE of R: ", 0

.code
main PROC
	
	mov ecx, 4
	mov esi, OFFSET reading
	mov edi, 0

	rLoop:
		mov edx, OFFSET rMsg
		call WriteString
		call ReadInt
		mov [esi], al
		add esi, TYPE reading
		loop rLoop

	mov ecx, 4
	mov esi, OFFSET adjust

	call Crlf
	mov edx, OFFSET aMsg
	call WriteString
	
	aLoop:
		movsx eax, BYTE PTR offsett[edi]
		movsx ebx, BYTE PTR reading[edi]

		add eax, ebx
		call WriteInt
		mov [esi], al

		mov al, ' '
		call WriteChar

		add edi, TYPE reading
		add esi, TYPE adjust
		loop aLoop

	call Crlf

	movsx eax, adjust[1]
	movsx ebx, adjust[2]
	sub eax, ebx
	push eax

	movsx eax, adjust[0]
	neg eax
	movsx ebx, adjust[3]
	add eax, ebx

	mov ebx, eax
	pop eax
	add eax, ebx

	call Crlf
	mov edx, OFFSET dMsg
	call WriteString
	call WriteInt

	call Crlf
	mov edx, OFFSET hMsg
	call WriteString
	call WriteHex

	call Crlf
	call Crlf
	mov edx, OFFSET lwMsg
	call WriteString
	
	mov ebx, eax
	movsx eax, ax
	call WriteHex

	call Crlf
	mov edx, OFFSET lbMsg
	call WriteString
	movsx eax, al
	call WriteInt

	call Crlf
	call Crlf

	exit

main ENDP
END main
