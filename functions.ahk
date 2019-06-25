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
date_diff(time=5,diff:=0) {
	exitKeys = 
	(
		0123456789
		{Numpad0}
		{Numpad1}
		{Numpad2}
		{Numpad3}
		{Numpad4}
		{Numpad5}
		{Numpad6}
		{Numpad7}
		{Numpad8}
		{Numpad9}
	)

	SplashTextOn,,, DateDiff
	WinMove, DateDiff,,16,16
	Input, diff, B T%time%, {Esc}%exitKeys%
	SplashTextOff

	date := A_Now

	If ((ErrorLevel = "Timeout") || InStr(ErrorLevel, "EndKey:Esc")) {
		Return
	}

	If (InStr(ErrorLevel, "EndKey:")) {
		diff := diff . SubStr(ErrorLevel, 8)
		diff := RegExReplace(diff, "Numpad","")
	}


	addsub := SubStr(diff, 1, 1)

	If ((addsub = "+") || (addsub = "-")) {
		diff := SubStr(diff, 2)
	}

	If (addsub = "-") {
		date += (0 - diff), days
	} Else {
		date += diff, days
	}

	FormatTime result, %date%, MM-dd-yyyy
	Return result
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


