.586										;indicates what assembly is used
.model flat, stdcall						;specifies memory model
.stack 4096									;size of stacks in bytes
includelib libcmt.lib						;two libraries we will generally need
includelib legacy_stdio_definitions.lib
ExitProcess PROTO, dwExitCode:DWORD			;PROTO sets up a function to be called with an argument using INVOKE
extern printf:NEAR

.data
		;variables go here
		a DWORD 10
		b DWORD 20
		format BYTE "eax points to value: %d", 0Ah, 0

.code

	main PROC c								;main function
											;assebly istructions for main function go here

	mov ecx, a								;puts a into ecx register (ecx = 10)
	mov edx, b								;puts b into edx register (edx = 20)
	mov eax, offset a						;puts address of a into eax register (eax = &a)
	mov ebx, offset b						;puts address of b into ebx register (ebx = &b)

	add edx, ecx							;edx = edx + ecx (edx = 30)

	add edx, [eax]							;edx = edx + value in eax (edx = 40)
	mov eax, edx							;puts 40 into eax register (eax = 40)

	push eax								;puts eax onto the stack
	push offset format						;puts &format onto the stack
	call printf								;calls printf with variables in reverse order
	add esp, 8								;cleanup stack
	
	INVOKE ExitProcess, 0					;calls exit process function -> exit(0)
	main endp


;ends our assembly program
end
