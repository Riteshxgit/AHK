#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Function to handle tap or hold for the . key using scan code SC034
SC034::
    KeyWait, SC034, T0.1
    if (ErrorLevel) ; If held down
    {
        ; Enable remapping
        Hotkey, *e, SendUpArrow, On
        Hotkey, *s, SendLeftArrow, On
        Hotkey, *d, SendDownArrow, On
        Hotkey, *f, SendRightArrow, On
        Hotkey, *r, Send_apos, On
        Hotkey, *t, SendFwrdSlash, On

        Hotkey, *j, SendEnter, On
        Hotkey, *k, SendBackspace, On
        Hotkey, *m, SendCtrlBackspace, On
        Hotkey, *n, Senddel, On


        ; Wait for the SC034 (.) key to be released
        KeyWait, SC034
        ; Disable remapping
        Hotkey, *e, SendUpArrow, Off
        Hotkey, *s, SendLeftArrow, Off
        Hotkey, *d, SendDownArrow, Off
        Hotkey, *f, SendRightArrow, Off
        Hotkey, *r, Send_apos, Off
        Hotkey, *t, SendFwrdSlash, Off

        Hotkey, *j, SendEnter, Off
        Hotkey, *k, SendBackspace, Off
        Hotkey, *m, SendCtrlBackspace, Off
        Hotkey, *n, Senddel, Off

    }
    else
    {
        Send .
    }
Return

; Remap functions only if the . key is held
SendUpArrow:
    if (GetKeyState("SC034", "P"))
    {
        Send, {Up}
    }
Return

SendLeftArrow:
    if (GetKeyState("SC034", "P"))
    {
        Send, {Left}
    }
Return

SendDownArrow:
    if (GetKeyState("SC034", "P"))
    {
        Send, {Down}
    }
Return

SendRightArrow:
    if (GetKeyState("SC034", "P"))
    {
        Send, {Right}
    }
Return

Send_apos:
    if (GetKeyState("SC034", "P"))
    {
        Send, {'}
    }
Return

SendBackspace:
    if (GetKeyState("SC034", "P"))
    {
        Send, {Backspace}
    }
Return

SendEnter:
    if (GetKeyState("SC034", "P"))
    {
        Send, {Enter}
    }
Return

SendCtrlBackspace:
    if (GetKeyState("SC034", "P"))
    {
        Send, ^{Backspace}
    }
Return

SendFwrdSlash:
    if (GetKeyState("SC034", "P"))
    {
        Send, {`/}
    }
Return

Senddel:
    if (GetKeyState("SC034", "P"))
    {
        Send, {Delete}
    }
Return


