.586										;indicates what assembly is used
.model flat, stdcall						;specifies memory model
.stack 4096									;size of stacks in bytes
includelib libcmt.lib						;two libraries we will generally need
includelib legacy_stdio_definitions.lib
ExitProcess PROTO, dwExitCode:DWORD			;PROTO sets up a function to be called with an argument using INVOKE

.data
	;variables go here
	var1 DWORD 10				;creates a variable 4 bytes in size, named var1, with value 10
	var2 DWORD 30				;creates a variable 4 bytes in size, named var2, with value 30
	var3 DWORD ?				;creates a variable 4 bytes in size, named var3, with value ?
	msg BYTE "ABCDEF", 0Ah, 0	;creates a string named msg

.code
	main PROC c		;main function
	;assebly istructions for main function go here
	mov eax, var1				;moves var1 into register eax
	mov ebx, var2				;moves var2 into refister ebx
	add eax, ebx				;adds ebx to eax -> eax = 40
	mov var3, eax				;moves eax value into var3
	mov eax, msg


	


	INVOKE ExitProcess, 0		;calls exit process function -> exit(0)
	main endp


;ends our assembly program
end
