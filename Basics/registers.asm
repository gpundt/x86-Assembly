.586										;indicates what assembly is used
.model flat, stdcall						;specifies memory model
.stack 4096									;size of stacks in bytes
includelib libcmt.lib						;two libraries we will generally need
includelib legacy_stdio_definitions.lib
ExitProcess PROTO, dwExitCode:DWORD			;PROTO sets up a function to be called with an argument using INVOKE

.data
		;variables go here



.code

	main PROC c		;main function
	;assebly istructions for main function go here
	;compute (10 + 15 * 3) / 5
	mov eax, 15			;eax holds 15
	mov ebx, 3			;ebx holds 3
	mul ebx				;15 * 3 = 45	-> eax holds 45

	mov ecx, 10			;ecx holds 10
	add eax, ecx		;45 + 10 = 55	-> eax holds 55

	mov ebx, 5			;evx holds 5
	div ebx				;55 / 5 = 11	-> eax holds 11



	INVOKE ExitProcess, 0	;calls exit process function -> exit(0)
	main endp


;ends our assembly program
end
