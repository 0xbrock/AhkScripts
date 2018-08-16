;;
;;	The kitchen sink autohotkey script
;;

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#Include %A_ScriptDir%

GroupAdd BrowserWindow, ahk_exe chrome.exe
GroupAdd BrowserWindow, ahk_exe firefox.exe
GroupAdd ConsoleWindow, ahk_class ConsoleWindowClass
GroupAdd ConsoleWindow, ahk_class mintty


#Include, *i WinGetPosEx.ahk
#Include, *i remappings.ahk
#Include, *i application_launchers.ahk
#Include, *i taskview_mouse.ahk
#Include, *i copy_paste.ahk
#Include, *i alt_window_drag.ahk
#Include, *i window_snap.ahk
#Include, *i text_sub.ahk

#Include, *i ahkscripts\WinGetPosEx.ahk
#Include, *i ahkscripts\remappings.ahk
#Include, *i ahkscripts\application_launchers.ahk
#Include, *i ahkscripts\taskview_mouse.ahk
#Include, *i ahkscripts\copy_paste.ahk
#Include, *i ahkscripts\alt_window_drag.ahk
#Include, *i ahkscripts\window_snap.ahk
#Include, *i ahkscripts\text_sub.ahk
