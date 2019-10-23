;
; Functions designed for Excel
; ---------------------------------

; Mouse Movement Mode: Application ignoring titlebar.
CoordMode, Mouse, Client

; Match Mode: Regular Expressions
SetTitleMatchMode, RegEx

; Ensure consistent starting directory
SetWorkingDir %A_ScriptDir%

; ---------- Includes ----------
#Include %A_ScriptDir%
#Include functions.ahk


excelSaveAs(name, location:=0, closeAfterSave:=0) {
	; This function takes a file name and saves the current workbook.

	; Set location to desktop if arg not entered
	if location = 0
	{
		location = %A_Desktop%
	}

	; Save at location\filename
	sendInput, {F12}
	WinWaitActive, Save As,, 3
	if ErrorLevel
	{
		MsgBox,, Error, Save As window never appeared, 2
		Exit
	}

	sleep % 500
	sendInput, %name%
	sendInput, !d
	sleep % 100
	sendInput, !a{BackSpace}%location%{Enter}
	sleep % 100
	sendInput, !s

	; Confirm overwrite if needed
	WinWait, ^Confirm Save As$,,2
	if Not ErrorLevel
	{
		ControlFocus,.*Yes$, ^Confirm Save As$
		sendInput, {Enter}
		sleep % 100
	}

	; Close file if requested
	if closeAfterSave = 1
	{
		WinWaitActive, %name%,, 5
		if ErrorLevel
		{
			MsgBox,, Error, Excel File did not reactivate., 1
			Exit
		}
		sendInput, !{F4}
	}

	Return
}
