
.586										;indicates what assembly is used
.model flat, stdcall						;specifies memory model
.stack 4096									;size of stacks in bytes
includelib libcmt.lib						;two libraries we will generally need
includelib legacy_stdio_definitions.lib
ExitProcess PROTO, dwExitCode:DWORD			;PROTO sets up a function to be called with an argument using INVOKE
extern printf:NEAR
extern scanf:NEAR

.data
											;variables go here	
	;VARIABLES FOR PRINTF
	string BYTE "Enter a number:   ", 0

	;VARIABLES FOR SCANF
	input BYTE 20 DUP(0)									;String 20 characters long, filling it in with zeros, stores user string
	inputFormat BYTE "%s",0									;format for our scanf, ends with terminator

	;VARIABLES FOR PRINTF(SCANF)
	outputFormat BYTE "Reversed number: %s", 0Ah, 0


	;VARIABLES FOR REVERSED NUMBER
	reversed BYTE 20 DUP(0)

	var DWORD 12345678h


.code

	main PROC c								;main function
											;assebly istructions for main function go here
		
		push offset string					;"Enter a Number:    "
		call printf							;printf("Enter a Number:    ")
		add esp, 4

											;******attempt to scanf("%d", input)******
		push offset input					;%s				offset because cant store string on stack
		push offset inputFormat				;"%s"			offset because cant store string on stack
		call scanf							;scanf("%s", input)
		add esp, 8							;cleanup stack


											;REVERSING STRING    12345678 -> 78563412
		mov AH, [input+6]
		mov AL, [input+7]
		mov BYTE PTR [reversed], AH
		mov BYTE PTR [reversed+1], AL

		mov AH, [input+4]
		mov AL, [input+5]
		mov BYTE PTR [reversed+2], AH
		mov BYTE PTR [reversed+3], AL

		mov AH, [input+2]
		mov AL, [input+3]
		mov BYTE PTR [reversed+4], AH
		mov BYTE PTR [reversed+5], AL

		mov AH, [input]
		mov AL, [input+1]
		mov BYTE PTR [reversed+6], AH
		mov BYTE PTR [reversed+7], AL




											;******attempt to printf("Reversed Number: %s\n", reversed)******
		push offset reversed				;%s
		push offset outputFormat			;"Reversed Number: %s"
		call printf							;printf("Reversed number: %s", reversed)
		add esp, 8							;cleanup stack


		mov eax, offset var
		mov ebx, [eax]
		mov ebx, 11h
		mov var, ebx
		mov eax, var

		INVOKE ExitProcess, 0				;calls exit process function -> exit(0)
	main endp


;ends our assembly program
end
