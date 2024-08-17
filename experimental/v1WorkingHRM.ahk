; Home row mods script for AutoHotkey

; j and f for Shift
j::
    Send {Text}j
    KeyWait, j, t0.1
    if errorlevel = 1
    {
        Send, {Backspace}
        Send, {Shift Down}
        KeyWait, j
        Send, {Shift Up}
    }
Return

f::
    Send {Text}f
    KeyWait, f, t0.1
    if errorlevel = 1
    {
        Send, {Backspace}
        Send, {Shift Down}
        KeyWait, f
        Send, {Shift Up}
    }
Return

; d and k for Ctrl
d::
    Send {Text}d
    KeyWait, d, t0.1
    if errorlevel = 1
    {
        Send, {Backspace}
        Send, {Ctrl Down}
        KeyWait, d
        Send, {Ctrl Up}
    }
Return

k::
    Send {Text}k
    KeyWait, k, t0.1
    if errorlevel = 1
    {
        Send, {Backspace}
        Send, {Ctrl Down}
        KeyWait, k
        Send, {Ctrl Up}
    }
Return

; s and l for Alt
s::
    Send {Text}s
    KeyWait, s, t0.1
    if errorlevel = 1
    {
        Send, {Backspace}
        Send, {Alt Down}
        KeyWait, s
        Send, {Alt Up}
    }
Return

l::
    Send {Text}l
    KeyWait, l, t0.1
    if errorlevel = 1
    {
        Send, {Backspace}
        Send, {Alt Down}
        KeyWait, l
        Send, {Alt Up}
    }
Return

; a and ; for Win
a::
    Send {Text}a
    KeyWait, a, t0.1
    if errorlevel = 1
    {
        Send, {Backspace}
        Send, {LWin Down}
        KeyWait, a
        Send, {LWin Up}
    }
Return

; Handling semicolon separately
SC027::
    Send {Text};
    KeyWait, SC027, t0.1
    if errorlevel = 1
    {
        Send, {Backspace}
        Send, {LWin Down}
        KeyWait, SC027
        Send, {LWin Up}
    }
Return
