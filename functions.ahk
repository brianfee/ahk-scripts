;
; A library of basic functions and labels
; ------------------------------------------------------------

; Mouse Movement Mode: Application ignoring titlebar.
CoordMode, Mouse, Client

; Match Mode: RegEx
SetTitleMatchMode, RegEx

; Ensure consistent starting directory
SetWorkingDir %A_ScriptDir%


; ---------- Includes ----------
#Include %A_ScriptDir%



; ---------- Calculate today +/- specified number of days ----------
subtract_days(diff:=0) {
	date := A_Now
	date += (0 - diff), days
	FormatTime result, %date%, MM-dd-yyyy
	return result
}

add_days(diff:=0) {
	date := A_Now
	date += diff, days
	FormatTime result, %date%, MM-dd-yyyy
	return result
}
