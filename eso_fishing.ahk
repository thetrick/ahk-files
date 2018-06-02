#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 60
 
F4::
ExitApp
 
F10::
Reload
Sleep 2000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return

F3::
Suspend,Toggle
 
; Hotkey to start/stop
F2::
Loop, 25 {
    thecolor = 0xFF00FF
    TopLx = 900
    TopLy = 500
    BotRx = 1200
    BotRy = 700
 
    Send, e
   
    Search:
    PixelSearch, Px, Py, %TopLx%, %TopLy%, %BotRx%, %BotRy%, %thecolor%, 75, fast RGB
    if (ErrorLevel == 0) {
        Send, e
    }
    else {
        Sleep, 300
        Goto, Search
    }
 
    Sleep, 2000
}
