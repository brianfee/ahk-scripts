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
	^#f:: SendInput, !hsf

	; ---------- Save As and Close Shortcuts ----------
	^#1::
		fileName = borrower.xlsx
		excelSaveAs(fileName)
		WinWaitActive, .*- Saved,, 5
		if ErrorLevel {
			MsgBox,, Error, Excel File did not reactivate., 1
			Exit
		}
		sendInput, !{F4}
	Return

	^#2::
		fileName = commissions.xlsx
		excelSaveAs(fileName)
		WinWaitActive, .*- Saved,, 5
		if ErrorLevel {
			MsgBox,, Error, Excel File did not reactivate., 1
			Exit
		}
		sendInput, !{F4}
	Return

	^#3::
		fileName = purchase.xlsx
		excelSaveAs(fileName)
		WinWaitActive, .*- Saved,, 5
		if ErrorLevel {
			MsgBox,, Error, Excel File did not reactivate., 1
			Exit
		}
		sendInput, !{F4}
	Return

	^#4::
		fileName = fund.xlsx
		excelSaveAs(fileName)
		WinWaitActive, .*- Saved,, 5
		if ErrorLevel {
			MsgBox,, Error, Excel File did not reactivate., 1
			Exit
		}
		sendInput, !{F4}
	Return
#IfWinActive
