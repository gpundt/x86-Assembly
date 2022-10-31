.586
.model flat, stdcall
.stack 4096
includelib libcmt.lib
includelib legacy_stdio_definitions.lib
ExitProcess PROTO, dwExitCode:DWORD

.data
		;variables go here
		value DWORD 10			;equivalent to -> DWORD value = 10
		msg BYTE "ABC", 0Ah		;equivalent to -> char *msg = "ABC\n"


.code

	main PROC c
	;assebly istructions for main function go here
	
	;compute (10 + 15 * 3)/5


	INVOKE ExitProcess, 0	;calls exit process function -> exit(0)
	main endp


;ends our assembly program
end