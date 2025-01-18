#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Define a flag to indicate when the dead remapper key is held down
DeadKey_Held := false

; Define a flag to indicate if a remap key is already sent
Remap_Sent := false

; When ' is pressed
'::
    DeadKey_Held := true
    Remap_Sent := false
    SetTimer, CheckKeys, 10
return

; When ' is released
' Up::
    DeadKey_Held := false
    Remap_Sent := false
    SetTimer, CheckKeys, Off
    ; Ensure normal key functionality for ' when the dead key is not held
    Send, '
return

CheckKeys:
{
    ; Check each key and send appropriate remapped key if the dead key is held
    if (DeadKey_Held) {
        if (GetKeyState("a", "P")) {
            if (!Remap_Sent) {
                Send, q
                Remap_Sent := true
            }
        }
        else if (GetKeyState("s", "P")) {
            if (!Remap_Sent) {
                Send, w
                Remap_Sent := true
            }
        }
        else if (GetKeyState("d", "P")) {
            if (!Remap_Sent) {
                Send, e
                Remap_Sent := true
            }
        }
        else if (GetKeyState("f", "P")) {
            if (!Remap_Sent) {
                Send, r
                Remap_Sent := true
            }
        }
        ; Add more key checks as needed
    }
    else {
        Remap_Sent := false
    }
    return
}

; Ensure normal key functionality for a, s, d, and f when the dead key is not held
a::
    if (!DeadKey_Held)
        Send, a
    else
        Send, q
return

s::
    if (!DeadKey_Held)
        Send, s
    else
        Send, w
return

d::
    if (!DeadKey_Held)
        Send, d
    else
        Send, e
return

f::
    if (!DeadKey_Held)
        Send, f
    else
        Send, r
return
