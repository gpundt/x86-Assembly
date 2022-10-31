
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



	INVOKE ExitProcess, 0	;calls exit process function -> exit(0)
	main endp


;ends our assembly program
end
