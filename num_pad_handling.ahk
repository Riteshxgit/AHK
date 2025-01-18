;--------------------------------  .   ---------------------------------------------

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%


; Function to handle both . and , being held down together
~SC034 & ~SC033:: ; The ~ (tilde) allows both keys to be used for their original purpose as well
    ; Enable remapping
    Hotkey, *g, Send0, On
    Hotkey, *x, Send1, On
    Hotkey, *c, Send2, On
    Hotkey, *v, Send3, On
    Hotkey, *s, Send4, On
    Hotkey, *d, Send5, On
    Hotkey, *f, Send6, On
    Hotkey, *w, Send7, On
    Hotkey, *e, Send8, On
    Hotkey, *r, Send9, On
    Hotkey, *a, Send_Comma, On
    Hotkey, *z, Send_period, On


    ; Wait for either SC034 or SC033 to be released
    KeyWait, SC034
    KeyWait, SC033
    ; Disable remapping
    Hotkey, *g, Send0, Off
    Hotkey, *x, Send1, Off
    Hotkey, *c, Send2, Off
    Hotkey, *v, Send3, Off
    Hotkey, *s, Send4, Off
    Hotkey, *d, Send5, Off
    Hotkey, *f, Send6, Off
    Hotkey, *w, Send7, Off
    Hotkey, *e, Send8, Off
    Hotkey, *r, Send9, Off
    Hotkey, *a, Send_Comma, Off 
    Hotkey, *z, Send_period, Off
    Return

; Remap functions only if both . and , are held
Send_Comma:
Send, {,}
Return

Send_period:
Send, {.}
Return

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
