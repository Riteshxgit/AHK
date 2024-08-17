; Home row mods script for AutoHotkey

; Flags to track key states
global j_flag := 0
global f_flag := 0
global d_flag := 0
global k_flag := 0
global s_flag := 0
global l_flag := 0
global a_flag := 0
global semicolon_flag := 0

; Helper function to send keys based on flags
SendKeys() {
    global
    if (j_flag || f_flag)
        Send, {Shift Down}
    if (d_flag || k_flag)
        Send, {Ctrl Down}
    if (s_flag || l_flag)
        Send, {Alt Down}
    if (a_flag || semicolon_flag)
        Send, {LWin Down}
}

ResetKeys() {
    global
    if (j_flag || f_flag)
        Send, {Shift Up}
    if (d_flag || k_flag)
        Send, {Ctrl Up}
    if (s_flag || l_flag)
        Send, {Alt Up}
    if (a_flag || semicolon_flag)
        Send, {LWin Up}
}

; j and f for Shift
j::
    Send {Text}j
    KeyWait, j, t0.1
    if (errorlevel = 1) {
        j_flag := 1
        Send, {Backspace}
        SendKeys()
        KeyWait, j
        j_flag := 0
        ResetKeys()
    }
Return

f::
    Send {Text}f
    KeyWait, f, t0.1
    if (errorlevel = 1) {
        f_flag := 1
        Send, {Backspace}
        SendKeys()
        KeyWait, f
        f_flag := 0
        ResetKeys()
    }
Return

; d and k for Ctrl
d::
    Send {Text}d
    KeyWait, d, t0.1
    if (errorlevel = 1) {
        d_flag := 1
        Send, {Backspace}
        SendKeys()
        KeyWait, d
        d_flag := 0
        ResetKeys()
    }
Return

k::
    Send {Text}k
    KeyWait, k, t0.1
    if (errorlevel = 1) {
        k_flag := 1
        Send, {Backspace}
        SendKeys()
        KeyWait, k
        k_flag := 0
        ResetKeys()
    }
Return

; s and l for Alt
s::
    Send {Text}s
    KeyWait, s, t0.1
    if (errorlevel = 1) {
        s_flag := 1
        Send, {Backspace}
        SendKeys()
        KeyWait, s
        s_flag := 0
        ResetKeys()
    }
Return

l::
    Send {Text}l
    KeyWait, l, t0.1
    if (errorlevel = 1) {
        l_flag := 1
        Send, {Backspace}
        SendKeys()
        KeyWait, l
        l_flag := 0
        ResetKeys()
    }
Return

; a and ; for Win
a::
    Send {Text}a
    KeyWait, a, t0.1
    if (errorlevel = 1) {
        a_flag := 1
        Send, {Backspace}
        SendKeys()
        KeyWait, a
        a_flag := 0
        ResetKeys()
    }
Return

; Handling semicolon separately
SC027::
    Send {Text};
    KeyWait, SC027, t0.1
    if (errorlevel = 1) {
        semicolon_flag := 1
        Send, {Backspace}
        SendKeys()
        KeyWait, SC027
        semicolon_flag := 0
        ResetKeys()
    }
Return
