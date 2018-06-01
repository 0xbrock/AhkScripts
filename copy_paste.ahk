;;
;; Copy/Paste enhancements
;;	Ctrl+V Paste to console
;;	Win+C copies
;;	Win+V paste clipboard text only
;;	

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

GroupAdd ConsoleWindow, ahk_class ConsoleWindowClass
GroupAdd ConsoleWindow, ahk_class mintty

;#region Copy and Paste Shortcuts
!p::
ClipSaved := ClipboardAll
Clipboard =
Send ^c
ClipWait 1
Send {raw}<p>
Send %clipboard% ; ^v
Send {raw}</p>
;MsgBox clipboard now has the following contents:%clipboard%
Clipboard := ClipSaved
ClipSaved =
Return

; Use Ctrl+V to paste into a console window
#If WinActive("ahk_group ConsoleWindow")
	^v::SendInput {Raw}%clipboard%
#If

#c::Send ^c

; Windows + V to paste plain text.
#v::
ClipSaved := ClipboardAll
Clipboard = %Clipboard%
SendInput, ^v
Sleep, 250
Clipboard := ClipSaved
return
;#endregion Copy and Paste Shortcuts