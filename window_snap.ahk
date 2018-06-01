;;
;; Snap window to Monitor Location, Supports Multiple Monitors
;;    
;;  Partly from https://autohotkey.com/board/topic/28087-move-an-window-to-edge-of-screen-func/
;;  Partly from https://gist.github.com/AWMooreCO/1ef708055a11862ca9dc
;;

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.


;#region Snap Window To Monitor location
GetMonitorIndexFromWindow(windowHandle) {
    ; Starts with 1.
    monitorIndex := 1

    VarSetCapacity(monitorInfo, 40)
    NumPut(40, monitorInfo)

    if (monitorHandle := DllCall("MonitorFromWindow", "uint", windowHandle, "uint", 0x2))
        && DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo) {
        monitorLeft   := NumGet(monitorInfo,  4, "Int")
        monitorTop    := NumGet(monitorInfo,  8, "Int")
        monitorRight  := NumGet(monitorInfo, 12, "Int")
        monitorBottom := NumGet(monitorInfo, 16, "Int")
        workLeft      := NumGet(monitorInfo, 20, "Int")
        workTop       := NumGet(monitorInfo, 24, "Int")
        workRight     := NumGet(monitorInfo, 28, "Int")
        workBottom    := NumGet(monitorInfo, 32, "Int")
        isPrimary     := NumGet(monitorInfo, 36, "Int") & 1

        SysGet, monitorCount, MonitorCount

        Loop, %monitorCount% {
            SysGet, tempMon, Monitor, %A_Index%

            ; Compare location to determine the monitor index.
            if ((monitorLeft = tempMonLeft) and (monitorTop = tempMonTop)
                and (monitorRight = tempMonRight) and (monitorBottom = tempMonBottom)) {
                monitorIndex := A_Index
                break
            }
        }
    }

    return %monitorIndex%
}

MoveWin(MoveToPosition)
{
	padding := 7
	WinGet activeWin, ID, A
    activeMon := GetMonitorIndexFromWindow(activeWin)
    SysGet, m, MonitorWorkArea, %activeMon%
    WinGetPos, px, py, w, h, A  ; "A" to get the active window's pos.
    ;MsgBox, px:`t%px%`npy:`t%py%`nw:`t%w%`nh:`t%h%`nMonitor:`t#%activeMon%`nLeft:`t%mLeft% (%mLeft% work)`nTop:`t%mTop% (%mTop% work)`nRight:`t%mRight% (%mRight% work)`nBottom:`t%mBottom% (%mBottom% work)

    if (MoveToPosition = "L") {
        x := mLeft - padding
        y := py
    } else if (MoveToPosition = "R") {
        x := mRight - w + padding
        y := py
    } else if (MoveToPosition = "U") {
        x := px
        y := mTop
    } else if (MoveToPosition = "D") {
        x := px
        y := mBottom - h + padding
    } else if (MoveToPosition = "LB") {
        x := mLeft - padding
        y := mBottom - h + padding
    } else if (MoveToPosition = "MB") {
        x := ((mRight-mLeft) / 2) - (w / 2) + mLeft
        y := mBottom - h + padding
    } else if (MoveToPosition = "RB") {
        x := mRight - w + padding
        y := mBottom - h + padding
    } else if (MoveToPosition = "LM") {
        x := mLeft - padding
        y := ((mBottom-mTop) / 2) - (h / 2) + mTop
    } else if (MoveToPosition = "MM") {
        x := ((mRight-mLeft) / 2) - (w / 2) + mLeft
        y := ((mBottom-mTop) / 2) - (h / 2) + mTop
    } else if (MoveToPosition = "RM") {
        x := mRight - w + padding
        y := ((mBottom-mTop) / 2) - (h / 2) + mTop
    } else if (MoveToPosition = "LT") {
        x := mLeft - padding
        y := mTop
    } else if (MoveToPosition = "MT") {
        x := ((mRight-mLeft) / 2) - (w / 2) + mLeft
        y := mTop
    } else if (MoveToPosition = "RT") {
        x := mRight - w + padding
        y := mTop
    }

    WinMove, A,, %x%, %y%
}
#!Left::MoveWin("L")
#!Right::MoveWin("R")
#!Up::MoveWin("U")
#!Down::MoveWin("D")
#Numpad1::MoveWin("LB")
#Numpad2::MoveWin("MB")
#Numpad3::MoveWin("RB")
#Numpad4::MoveWin("LM")
#Numpad5::MoveWin("MM")
#Numpad6::MoveWin("RM")
#Numpad7::MoveWin("LT")
#Numpad8::MoveWin("MT")
#Numpad9::MoveWin("RT")
;#endregion Snap Window To Monitor location



MonitorInfo()
{
	SysGet, MouseButtonCount, 43
	SysGet, VirtualScreenWidth, 78
	SysGet, VirtualScreenHeight, 79

	; Example #2: This is a working script that displays info about each monitor:
	SysGet, MonitorCount, MonitorCount
	SysGet, MonitorPrimary, MonitorPrimary
	MsgBox, Monitor Count:`t%MonitorCount%`nPrimary Monitor:`t%MonitorPrimary%
	Loop, %MonitorCount%
	{
		SysGet, MonitorName, MonitorName, %A_Index%
		SysGet, Monitor, Monitor, %A_Index%
		SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
		MsgBox, Monitor:`t#%A_Index%`nName:`t%MonitorName%`nLeft:`t%MonitorLeft% (%MonitorWorkAreaLeft% work)`nTop:`t%MonitorTop% (%MonitorWorkAreaTop% work)`nRight:`t%MonitorRight% (%MonitorWorkAreaRight% work)`nBottom:`t%MonitorBottom% (%MonitorWorkAreaBottom% work)
	}
}