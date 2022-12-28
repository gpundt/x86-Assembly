.586										;indicates what assembly is used
.model flat, stdcall						;specifies memory model
.stack 4096									;size of stacks in bytes
includelib libcmt.lib						;two libraries we will generally need
includelib legacy_stdio_definitions.lib
ExitProcess PROTO, dwExitCode:DWORD			;PROTO sets up a function to be called with an argument using INVOKE
extern printf:NEAR

.data
		;variables go here
		format BYTE "Result: %d", 0Ah, 0

.code

	main PROC c								;main function
											;assebly istructions for main function go here
											;compute 10 + 6 * 12 - (4 + 15) using stack operations
	
	push 10 + 6*12 - (4+15)					;puts 10 + 6*12 - (4+15) onto the stack -> esp = 63
	push offset format						;puts string format onto stack
	call printf								;calls printf("result: %d\n", (10 + 6 * 12 - (4 + 15)))
	add esp, 8								;cleanup stack

											;answer should be 63
	INVOKE ExitProcess, 0					;calls exit process function -> exit(0)
	main endp


;ends our assembly program
end
