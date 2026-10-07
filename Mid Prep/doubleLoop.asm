INCLUDE Irvine32.inc

.stack 4096

.data
mult			BYTE		" x ", 0
equa			BYTE		" = ", 0
ad				BYTE		1, 2, 3
runtime			DWORD		?
count			BYTE		1

.code
main PROC
	
	mov ecx, 3
	mov esi, OFFSET ad

	outerLoop:
		mov runtime, ecx
		mov ecx, 5
		mov ebx, 0
		mov count, 1

		innerLoop:
			movzx eax, BYTE PTR [esi]
			add ebx, eax
			movzx eax, count
			call WriteDec
			mov edx, OFFSET mult
			call WriteString
			movzx eax, BYTE PTR [esi]
			call WriteDec
			mov edx, OFFSET equa
			call WriteString
			mov eax, ebx
			call WriteDec

			call Crlf
			inc count
			loop innerLoop
		
		call Crlf
		mov ecx, runtime
		add esi, TYPE ad
		loop outerLoop

	exit

main ENDP
END main
