INCLUDE Irvine32.inc

.stack 4096

.data
wordStr		BYTE		"KARACHI", 0
codes		DWORD		LENGTHOF wordStr - 1 DUP(?)
wMsg		BYTE		"========= wordStr =========", 0
cMsg		BYTE		"========= codes =========", 0
eSize		BYTE		"Element Size: ", 0
eCount		BYTE		"Element Count: ", 0
tSize		BYTE		"Total Size: ", 0
count		BYTE		1
cMsg2		BYTE		"Codes: ",  0
sMsg		BYTE		"Sum: ", 0

.code
main PROC
	
	mov ecx, LENGTHOF codes
	mov esi, OFFSET codes
	mov edi, OFFSET wordStr

	L1:
		mov edx, [edi]
		mov [esi], edx

		add edi, TYPE wordStr
		add esi, TYPE codes
		loop L1

	mov edx, OFFSET wMsg
	call WriteString
	call Crlf

	mov edx, OFFSET eSize
	call WriteString
	mov eax, TYPE wordStr
	call WriteDec
	call Crlf

	mov edx, OFFSET eCount
	call WriteString
	mov eax, LENGTHOF wordStr
	call WriteDec
	call Crlf
	
	mov edx, OFFSET tSize
	call WriteString
	mov eax, SIZEOF wordStr
	call WriteDec
	call Crlf
	
	call Crlf

	mov edx, OFFSET cMsg
	call WriteString
	call Crlf

	mov edx, OFFSET eSize
	call WriteString
	mov eax, TYPE codes
	call WriteDec
	call Crlf

	mov edx, OFFSET eCount
	call WriteString
	mov eax, LENGTHOF codes
	call WriteDec
	call Crlf
	
	mov edx, OFFSET tSize
	call WriteString
	mov eax, SIZEOF codes
	call WriteDec
	call Crlf
	
	call Crlf


	mov esi, OFFSET wordStr
	mov ecx, LENGTHOF wordStr - 1

	outer:
		mov ebx, ecx
		movzx ecx, count
		
		inner:
			mov al, [esi]
			call WriteChar
			add esi, TYPE wordStr
			loop inner

		inc count
		mov ecx, ebx
		mov esi, OFFSET wordStr
		call Crlf
		loop outer

		call Crlf


	mov edx, OFFSET cMsg2
	call WriteString
	
	mov esi, OFFSET codes
	mov ecx, LENGTHOF codes
	mov ebx, 0

	L2:
		mov al, [esi]
		call WriteDec
		add ebx, eax
		mov al, ' '
		call WriteChar
		add esi, TYPE codes
		loop L2

	call Crlf
	mov edx, OFFSET sMsg
	call WriteString
	mov eax, ebx
	call WriteDec

	call Crlf
	call Crlf
	
	mov esi, OFFSET wordStr
	mov ecx, LENGTHOF wordStr - 1

	L3:
		mov al, [esi]
		or al, 20h
		call WriteChar
		add esi, TYPE wordStr
		loop L3


	call Crlf
	call Crlf
	exit

main ENDP
END main
