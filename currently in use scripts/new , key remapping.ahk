#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Function to handle tap or hold for the , key using scan code SC033
SC033::
    KeyWait, SC033, T0.01
    if (ErrorLevel) ; If held down
    {
        ; Enable remapping
        Hotkey, *q, SendTilde, On
        Hotkey, *w, SendDot, On
        Hotkey, *e, SendComma, On
        Hotkey, *r, SendAmpersand, On
        Hotkey, *t, SendCaret, On
        Hotkey, *a, SendAt, On
        Hotkey, *s, SendPercent, On
        Hotkey, *d, SendLeftParen, On
        Hotkey, *f, SendLeftBracket, On
        Hotkey, *g, SendPipe, On
        Hotkey, *z, SendHash, On
        Hotkey, *x, SendBacktick, On
        Hotkey, *c, SendRightBrace, On
        Hotkey, *v, SendRightBracket, On
        Hotkey, *b, SendColon, On
        ; Wait for the SC033 (,) key to be released
        KeyWait, SC033
        ; Disable remapping
        Hotkey, *q, SendTilde, Off
        Hotkey, *w, SendDot, Off
        Hotkey, *e, SendComma, Off
        Hotkey, *r, SendAmpersand, Off
        Hotkey, *t, SendCaret, Off
        Hotkey, *a, SendAt, Off
        Hotkey, *s, SendPercent, Off
        Hotkey, *d, SendLeftParen, Off
        Hotkey, *f, SendLeftBracket, Off
        Hotkey, *g, SendPipe, Off
        Hotkey, *z, SendHash, Off
        Hotkey, *x, SendBacktick, Off
        Hotkey, *c, SendRightBrace, Off
        Hotkey, *v, SendRightBracket, Off
        Hotkey, *b, SendColon, Off
    }
    else
    {
        Send `,
    }
Return

; Remap functions only if the comma key is held
SendTilde:
    if (GetKeyState("SC033", "P"))
    {
        Send, ~
    }
Return

SendDot:
    if (GetKeyState("SC033", "P"))
    {
        Send, .
    }
Return

SendComma:
    if (GetKeyState("SC033", "P"))
    {
        Send, `,
    }
Return

SendAmpersand:
    if (GetKeyState("SC033", "P"))
    {
        Send, {&}
    }
Return

SendCaret:
    if (GetKeyState("SC033", "P"))
    {
        Send, {^}
    }
Return

SendAt:
    if (GetKeyState("SC033", "P"))
    {
        Send, {@}
    }
Return

SendPercent:
    if (GetKeyState("SC033", "P"))
    {
        Send, {`%}
    }
Return

SendLeftParen:
    if (GetKeyState("SC033", "P"))
    {
        Send, {{}
    }
Return

SendLeftBracket:
    if (GetKeyState("SC033", "P"))
    {
        Send, {[}
    }
Return

SendPipe:
    if (GetKeyState("SC033", "P"))
    {
        Send, {|}
    }
Return

SendHash:
    if (GetKeyState("SC033", "P"))
    {
        Send, {#}
    }
Return

SendBacktick:
    if (GetKeyState("SC033", "P"))
    {
        Send, {``}
    }
Return

SendRightBrace:
    if (GetKeyState("SC033", "P"))
    {
        Send, {}}
    }
Return

SendRightBracket:
    if (GetKeyState("SC033", "P"))
    {
        Send, {]}
    }
Return

SendColon:
    if (GetKeyState("SC033", "P"))
    {
        Send, {:}
    }
Return
