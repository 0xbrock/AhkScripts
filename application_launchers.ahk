

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

GroupAdd BrowserWindow, ahk_exe chrome.exe
GroupAdd BrowserWindow, ahk_exe firefox.exe

;#region Launch Applications 
^!n::
If WinExist("Untitled - Notepad")
	WinActivate
else
	Run Notepad
return

; Ctrl + Win + s
^#s::
If WinExist("ahk_exe slack.exe")
	WinActivate
else
	Run slack.exe
return

; Ctrl + Win + c
^#c::
If WinExist("ahk_exe code.exe")
	WinActivate
else
	Run code.exe
return

; Ctrl + Win + e
^#e::
If WinExist("ahk_exe ONENOTE.EXE")
	WinActivate
else
	Run ONENOTE.EXE
return

; Ctrl + Alt + s
^!s::
If WinExist("ahk_exe SndVol.exe")
	WinActivate
else
	Run SndVol.exe
return

!+s::
If WinExist("ahk_class #32770") and WinExist("ahk_exe rundll32.exe")
{
	WinActivate
	return
}
else 
{
	Run, mmsys.cpl
	WinWait, Sound
	SoundPlay, *-1
	return
}

; Change Sound output
#+a::
Run, mmsys.cpl
WinWait,Sound
ControlSend,SysListView321,{Down}
ControlGet, isEnabled, Enabled,,&Set Default
if(!isEnabled)
{
	ControlSend,SysListView321,{Down 1}
}
ControlClick,&Set Default
ControlClick,OK
WinWaitClose
SoundPlay, *-1
return

#If !WinActive("ahk_class SunAwtFrame") && !WinActive(,"- Android Studio")
	; Ctrl+Alt+m  New Email
	^!m::Run "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE" /c ipm.note
#If

; Ctrl+Alt+Shift+c  New Appointment -> Add People
^!+c::
Run "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE" /c ipm.appointment
WinWaitActive,Untitled - Appointment,
Send !h,!u
return

; Ctrl+Alt+c  New Appointment
^!c::Run "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE" /c ipm.appointment
;#endregion Launch Applications 


;#region Application Shortcuts
#If WinActive("ahk_exe SourceTree.exe")
	^m::
	Send !A
	Send {Up}{Up}{Up}{Up}{Up}{Right}{Enter}
	TrayTip , SourceTree Merge, Starting merge..., 4 ;show for 4 seconds
	return
#If

#If !WinActive("ahk_group BrowserWindow")
	; Alt+Left, Alt+Right
	!Left::Send {Home}
	!Right::Send {End}
#If

; Browser Prev/Next Tab
#If WinActive("ahk_group BrowserWindow") 
	F1::Send ^+{TAB}
	F2::Send ^{TAB}
#If

; Ctrl+Alt+l  Jump to Skype search box
^!l::
WinActivate, ahk_class CommunicatorMainWindowClass
ControlFocus RICHEDIT60W2
Return

;#region Visual Studio Shortcuts
; Visual Studio Quick Resolve, Ctrl+.
; Visual Studio Navigate To, Ctrl+P
#If WinActive("ahk_exe devenv.exe")
	!SPACE::Send, ^.
	^p::Send, ^{,}
#If
;#endregion Visual Studio Shortcuts

; Pause Pandora
+!b::
DetectHiddenWindows, on
WinActivate, Pandora
Sleep, 200
Send, {Space}
return
;#endregion Application Shortcuts
