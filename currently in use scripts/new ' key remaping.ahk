#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Function to handle tap or hold for the ' key
$'::
If A_PriorKey = "'"
{
    Send '
    Return
}
KeyWait, ', T0.01
If ErrorLevel ; Held
{
    ; Create a context-sensitive hotkey for remapping
        Hotkey, *q, Send6, On
        Hotkey, *w, Send7, On
        Hotkey, *e, Send8, On
        Hotkey, *r, Send9, On
        Hotkey, *t, Send0, On
        Hotkey, *a, Send1, On
        Hotkey, *s, Send2, On
        Hotkey, *d, Send3, On
        Hotkey, *f, Send4, On
        Hotkey, *g, Send5, On
    KeyWait, '
    ; Disable the hotkeys once ' is released
        Hotkey, *q, Send6, Off
        Hotkey, *w, Send7, Off
        Hotkey, *e, Send8, Off
        Hotkey, *r, Send9, Off
        Hotkey, *t, Send0, Off
        Hotkey, *a, Send1, Off
        Hotkey, *s, Send2, Off
        Hotkey, *d, Send3, Off
        Hotkey, *f, Send4, Off
        Hotkey, *g, Send5, Off
}
Else
{
    Send '
}
Return

; Remap functions
Send6:
Send, 6
Return

Send7:
Send, 7
Return

Send8:
Send, 8
Return

Send9:
Send, 9
Return

Send0:
Send, 0
Return

Send1:
Send, 1
Return

Send2:
Send, 2
Return

Send3:
Send, 3
Return

Send4:
Send, 4
Return

Send5:
Send, 5
Return