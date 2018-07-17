;;
;; Script to improve TaskView use from the mouse
;;

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

; Windows to exclude from: "Show Task View, Wheel/Middle click on desktop"
GroupAdd NotTaskViewGroup, ahk_exe blender.ahk_exe
GroupAdd TaskViewWindow, ahk_class MultitaskingViewFrame
GroupAdd TaskViewWindow, ahk_class Windows.UI.Core.CoreWindow

;#region Task View Shortcuts
; Show Task View, Wheel/Middle click on desktop
#IfWinNotActive ahk_group NotTaskViewGroup
	MButton::Send {LWin down}{Tab down}{Tab up}{Lwin up}
#IfWinNotActive

#IfWinActive ahk_group TaskViewWindow
	WheelDown::Send ^#{Right}
	WheelUp::Send ^#{Left}
	MButton & WheelDown::Send {WheelDown}
	MButton & WheelUp::Send {WheelUp}
#IfWinActive

; Move to the desktop right of the current desktop, Wheel right click 
XButton1 & WheelDown::Send ^#{Right}
MButton & WheelDown::Send ^#{Right}
WheelRight::Send ^#{Right}

; Move to the desktop left of the current desktop, Wheel left click 
XButton1 & WheelUp::Send ^#{Left}
MButton & WheelUp::Send ^#{Left}
WheelLeft::Send ^#{Left}
;#endregion Task View Shortcuts