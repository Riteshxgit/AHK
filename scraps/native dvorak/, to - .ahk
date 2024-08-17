#NoEnv
SendMode Input
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
#MaxHotkeysPerInterval 1000

; Function to check if any non-shift modifier key is pressed
IsNonShiftModifierPressed() {
    return GetKeyState("Ctrl", "P") || GetKeyState("Alt", "P") || GetKeyState("LWin", "P") || GetKeyState("RWin", "P")
}

; Function to handle key presses
HandleKey(key) {
    if GetKeyState("Ctrl", "P") || GetKeyState("Alt", "P") || GetKeyState("LWin", "P") || GetKeyState("RWin", "P") {
        return  ; Do nothing if non-shift modifier is pressed
    }

    if GetKeyState("LShift", "P") || GetKeyState("RShift", "P") {
        ; Shift key is pressed
        if key = "SC033"  ; Scan code for comma (,)
            Send, " ; Remap comma when Shift is pressed
        else if key = "SC00C"  ; Scan code for hyphen (-)
            Send, _
    } else {
        ; No shift is pressed
        if key = "SC033"  ; Scan code for comma (,)
            Send, ,
        else if key = "SC00C"  ; Scan code for hyphen (-)
            Send, -
    }
}

; Hotkeys defined at the top level using scan codes
SC033::HandleKey("SC033")
SC00C::HandleKey("SC00C")
