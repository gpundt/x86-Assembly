.586										;indicates what assembly is used
.model flat, stdcall						;specifies memory model
.stack 4096									;size of stacks in bytes
includelib libcmt.lib						;two libraries we will generally need
includelib legacy_stdio_definitions.lib
ExitProcess PROTO, dwExitCode:DWORD			;PROTO sets up a function to be called with an argument using INVOKE
extern printf:NEAR

.data
		;variables go here
		format BYTE "str2 = %s", 0Ah, 0
		startFormat BYTE "Original String = %s", 0Ah, 0
		endFormat BYTE "Copied String = %s", 0Ah, 0
		str1 BYTE "ABCDEF"
		str2 BYTE "XYZ123"

.code

	main PROC c								;main function
											;assebly istructions for main function go here
	
	push offset str2						;prints original string (string = "XYZ123")
	push offset startFormat
	call printf
	add esp, 8


	;copy str1 onto str2
	mov AH, [str1]							;moves A into AH register
	mov BYTE PTR [str2], AH					;replaces str2's "X" with A  -> str2 = "AYZ123"
	push offset str2
	push offset format
	call printf
	add esp, 8
	

	mov AH, [str1+1]
	mov BYTE PTR [str2+1], AH				;replaces str2's "Y" with B   -> str2 = "ABZ123"
	push offset str2
	push offset format
	call printf
	add esp, 8
	

	mov AH, [str1+2]
	mov BYTE PTR [str2+2], AH				;replaces str2's "Z" with C   -> str2 = "ABC123"
	push offset str2
	push offset format
	call printf
	add esp, 8

	mov AH, [str1+3]
	mov BYTE PTR [str2+3], AH				;replaces str2's "1" with D   -> str2 = "ABCD23"
	push offset str2
	push offset format
	call printf
	add esp, 8

	mov AH, [str1+4]
	mov BYTE PTR [str2+4], AH				;replaces str2's "2" with E   -> str2 = "ABCDE3"
	push offset str2
	push offset format
	call printf
	add esp, 8

	mov AH, [str1+5]
	mov BYTE PTR [str2+5], AH				;replaces str2's "3" with F   -> str2 = "ABCDEF"
	push offset str2
	push offset format
	call printf
	add esp, 8

	push offset str2						;printing copied string  (string = "ABCDEF")
	push offset endFormat
	call printf
	add esp, 8

	mov AH, str2							;moves str2 into AH register


	INVOKE ExitProcess, 0					;calls exit process function -> exit(0)
	main endp


;ends our assembly program
end
