;;
;; Misc shortcut updates
;;

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

; Make PrintScreen Key display the context menu button, Ctrl+PrintScreen executes PrintScreen
$^PrintScreen::PrintScreen
$!PrintScreen::PrintScreen
$PrintScreen::AppsKey

; Right click and wheel up/down for Browser forward/back
RButton & WheelDown::Send {Browser_Back}	 ; Left Arrow, Browser Back Button
RButton & WheelUp::Send {Browser_Forward}  ; Right Arrow, Browser Forward Button
RButton::RButton

; Make window always on top
#SPACE:: Winset, Alwaysontop, , A

; Custom lock PC and sleep monitors after 1 second
#l::
Sleep, 1000
DllCall("LockWorkStation")
Sleep, 1000
SendMessage,0x112,0xF170,2,,Program Manager
; 0x112 is WM_SYSCOMMAND, 0xF170 is SC_MONITORPOWER.
; Note for the above: Use -1 in place of 2 to turn the monitor on.
; Use 1 in place of 2 to activate the monitor's low-power mode.
return

#+F1::Volume_Mute
#+F2::Volume_Down
#+F3::Volume_Up
#+F4::Media_Play_Pause
#+F5::Media_Prev
#+F6::Media_Next

; Disable Calculator Button
Launch_Mail::return
Launch_Media::return
Launch_App1::return
Launch_App2::return

; Use accent as backspace.  ` => Ctrl+`, ~ => Shift+`
;$+`::send {~}
;$^`::send ``
;$`::Backspace
