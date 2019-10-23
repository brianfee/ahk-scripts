;
; Basic Keybindings for Excel
; ---------------------------------

; Mouse Movement Mode: Application ignoring titlebar.
CoordMode, Mouse, Client

; Match Mode: Regular Expressions
SetTitleMatchMode, RegEx

; Ensure consistent starting directory
SetWorkingDir %A_ScriptDir%

; ---------- Includes ----------
#Include %A_ScriptDir%
#Include functions_excel.ahk



#IfWinActive ahk_class XLMAIN
	; ---------- Add Filter on highlighted cells ----------
	^#f:: SendInput, !hs1f

	; ---------- Save As and Close Shortcuts ----------
	^#1::
		excelSaveAs("borrower.xlsx",, 1)
	Return

	^#2::
		excelSaveAs("commissions.xlsx",, 1)
	Return

	^#3::
		excelSaveAs("purchase.xlsx",, 1)
	Return

	^#4::
		excelSaveAs("fund.xlsx",, 1)
	Return
#IfWinActive
