;
; Basic keybindings for Windows -- Created by Brian Fee
;------------------------------------------------------------

; Mouse Movement Mode: Application ignoring titlebar.
CoordMode, Mouse, Client

; Match Mode: RegEx
SetTitleMatchMode, RegEx

; Ensure consistent starting directory
SetWorkingDir %A_ScriptDir%

; Notification that script has started / restarted
SplashTextOn,,, Keybindings Active
Sleep, 1000
SplashTextOff


; ---------- Script Management Keybindings ----------
~#esc:: Reload
~#`:: Pause
~#+esc:: 
	SplashTextOn,,, Closing Keybindings Script
	Sleep, 100
	ExitApp
	Return



; ---------- Includes ----------
#Include %A_ScriptDir%
#Include functions.ahk



; ---------- Caps Lock Mods ----------
Capslock:: Esc
LShift & RShift:: Capslock
RShift & LShift:: Capslock



; ---------- Text Replacements ----------
::!psa::Please see attached.



; ---------- Flags ----------
date_keys := False
launch_keys := False



; ---------- Application Keybindings ----------
#+q:: WinClose, A
#f:: WinMaximize, A
#t:: WinRestore, A

; Movement
#+h:: SendInput, #{Left}
#+j:: SendInput, #{Down}
#+k:: SendInput, #{Up}
#+l:: SendInput, #{Right}



; ---------- Launcher Keybindings ----------
#Enter:: Run, C:\apps\cmder\cmder.exe /start "%USERPROFILE%"
+#Enter:: Run, firefox.exe --private-window
+#=:: Run, calc.exe

; Launcher Menu: Win + o -> additional keybindings 
#o::
	launch_keys := !launch_keys
	sleep, 1000
	launch_keys := False
	return

#IF (launch_keys)
	
	c::
		Run, chrome.exe
		launch_keys := False
		Return

	+c::
		Run, chrome.exe --incognito
		launch_keys := False
		Return

	f::
		Run, firefox.exe
		launch_keys := False
		Return
	
	+f::
		Run, firefox.exe --private-window
		launch_keys := False
		Return
	
#IF



; ---------- Misc Keybindings ----------

#=:: quick_calculator()
^#=:: quick_calculator(,True)

; Date Menu: Win + d -> number of days difference
#d::
	date_keys := !date_keys
	sleep, 1000
	date_keys := False
	return


#IF (date_keys)

; ----- Subtract days -----
	d:: 
	0::
	Numpad0::
		SendInput % subtract_days()
		date_keys := False
		Return

	1::
	Numpad1::
		SendInput % subtract_days(1)
		date_keys := False
		Return

	2::
	Numpad2::
		SendInput % subtract_days(2)
		date_keys := False
		Return

	3::
	Numpad3::
		SendInput % subtract_days(3)
		date_keys := False
		Return

	4::
	Numpad4::
		SendInput % subtract_days(4)
		date_keys := False
		Return

	5::
	Numpad5::
		SendInput % subtract_days(5)
		date_keys := False
		Return

	6::
	Numpad6::
		SendInput % subtract_days(6)
		date_keys := False
		Return

	7::
	Numpad7::
		SendInput % subtract_days(7)
		date_keys := False
		Return

	8::
	Numpad8::
		SendInput % subtract_days(8)
		date_keys := False
		Return

	9::
	Numpad9::
		SendInput % subtract_days(9)
		date_keys := False
		Return


	; ----- Add days -----
	#0::
	#Numpad0::
		Send % add_days()
		date_keys := False
		Return

	#1::
	#Numpad1::
		SendInput % add_days(1)
		date_keys := False
		Return

	#2::
	#Numpad2::
		SendInput % add_days(2)
		date_keys := False
		Return

	#3::
	#Numpad3::
		SendInput % add_days(3)
		date_keys := False
		Return

	#4::
	#Numpad4::
		SendInput % add_days(4)
		date_keys := False
		Return

	#5::
	#Numpad5::
		SendInput % add_days(5)
		date_keys := False
		Return

	#6::
	#Numpad6::
		SendInput % add_days(6)
		date_keys := False
		Return

	#7::
	#Numpad7::
		SendInput % add_days(7)
		date_keys := False
		Return

	+8::
	NumpadUp::
		SendInput % add_days(8)
		date_keys := False
		Return

	+9::
	NumpadPgUp::
		SendInput % add_days(9)
		date_keys := False
		Return


#IF



