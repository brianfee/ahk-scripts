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
	SendInput % date_diff()
	return



