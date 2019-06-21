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


; ---------- Quick Calculator ----------
; Takes mathematical expressions and outputs result
quick_calculator(time=60,view=False) {
	; View dependent variables
	v := view ? "V" : ""
	splashText := view ? "Quick Calculator - Visible" : "Quick Calculator"

	SplashTextOn,,, %splashText%
	WinMove, %splashText%,,16,16
	Input, mathExpr, B T%time% %v%, {Esc}{Enter}
	SplashTextOff

	If ((ErrorLevel = "Timeout") || InStr(ErrorLevel, "EndKey:Esc")) {
		Return
	}

	Random, f
	f = %cd%\%f%.ahk

	FileAppend #NoTrayIcon`nFileDelete %f%`nFileAppend `% %mathExpr%`, %f%, %f%
	RunWait %A_AhkPath% %f%
	FileRead answer, %f%
	FileDelete % f

	if (view) {
		exprLen := StrLen(mathExpr) + 1
		SendInput, {Backspace %exprLen%}
	}

	SendInput % answer
	Return
}


