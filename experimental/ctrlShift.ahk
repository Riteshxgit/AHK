#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%



; Define a global variable to track the current layer state
; 0 = Normal Layer, 1 = Number Layer, 2 = Mouse Control Layer
layer_state := 0
Modulo(t){
    if(t == 0) 
        return 1
    else if(t == 1)
        return 2 
    else 
        return 0
}
; Redefine the ' key to toggle between layers
$':: 
    layer_state := Modulo(layer_state) ; Cycle through 0, 1, 2

    ; Deactivate all layers first
    Hotkey, *a, SendCtrla, Off
    Hotkey, *s, SendCtrls, Off
    Hotkey, *z, SendCtrlz, Off
    Hotkey, *x, SendCtrlx, Off
    Hotkey, *c, SendCtrlc, Off
    Hotkey, *v, SendCtrlv, Off
    Hotkey, *b, SendCtrlb, Off
    Hotkey, *n, SendCtrln, Off
    Hotkey, *k, SendCtrlk, Off
    Hotkey, *l, SendCtrll, Off
    Hotkey, *t, SendCtrlt, Off
    Hotkey, *y, SendCtrly, Off
    Hotkey, *a, SendCtrlShifta, Off
    Hotkey, *s, SendCtrlShifts, Off
    Hotkey, *z, SendCtrlShiftz, Off
    Hotkey, *x, SendCtrlShiftx, Off
    Hotkey, *c, SendCtrlShiftc, Off
    Hotkey, *v, SendCtrlShiftv, Off
    Hotkey, *b, SendCtrlShiftb, Off
    Hotkey, *n, SendCtrlShiftn, Off
    Hotkey, *k, SendCtrlShiftk, Off
    Hotkey, *l, SendCtrlShiftl, Off
    Hotkey, *t, SendCtrlShiftt, Off
    Hotkey, *y, SendCtrlShifty, Off

    if (layer_state = 1) {
        ; Activate number layer
        Hotkey, *a, SendCtrla, On
        Hotkey, *s, SendCtrls, On
        Hotkey, *z, SendCtrlz, On
        Hotkey, *x, SendCtrlx, On
        Hotkey, *c, SendCtrlc, On
        Hotkey, *v, SendCtrlv, On
        Hotkey, *b, SendCtrlb, On
        Hotkey, *n, SendCtrln, On
        Hotkey, *k, SendCtrlk, On
        Hotkey, *l, SendCtrll, On
        Hotkey, *t, SendCtrlt, On
        Hotkey, *y, SendCtrly, On
    } else if (layer_state = 2) {
        ; Activate mouse control layer
        Hotkey, *a, SendCtrlShifta, On
        Hotkey, *s, SendCtrlShifts, On
        Hotkey, *z, SendCtrlShiftz, On
        Hotkey, *x, SendCtrlShiftx, On
        Hotkey, *c, SendCtrlShiftc, On
        Hotkey, *v, SendCtrlShiftv, On
        Hotkey, *b, SendCtrlShiftb, On
        Hotkey, *n, SendCtrlShiftn, On
        Hotkey, *k, SendCtrlShiftk, On
        Hotkey, *l, SendCtrlShiftl, On
        Hotkey, *t, SendCtrlShiftt, On
        Hotkey, *y, SendCtrlShifty, On
    }
Return

; Remap ctrl
SendCtrla:
Send, ^a
Return

SendCtrls:
Send, ^s
Return

SendCtrlz:
Send, ^z
Return

SendCtrlx:
Send, ^x
Return

SendCtrlc:
Send, ^c
Return

SendCtrlv:
Send, ^v
Return

SendCtrlb:
Send, ^b
Return

SendCtrln:
Send, ^n
Return

SendCtrlk:
Send, ^k
Return

SendCtrll:
Send, ^l
Return

SendCtrlt:
Send, ^t
Return

SendCtrly:
Send, ^y
Return

; Remap ctrl+shift

SendCtrlShifta:
Send, ^+a
Return

SendCtrlShifts:
Send, ^+s
Return

SendCtrlShiftz:
Send, ^+z
Return

SendCtrlShiftx:
Send, ^+x
Return

SendCtrlShiftc:
Send, ^+c
Return

SendCtrlShiftv:
Send, ^+v
Return

SendCtrlShiftb:
Send, ^+b
Return

SendCtrlShiftn:
Send, ^+n
Return

SendCtrlShiftk:
Send, ^+k
Return

SendCtrlShiftl:
Send, ^+l
Return

SendCtrlShiftt:
Send, ^+t
Return

SendCtrlShifty:
Send, ^+y
Return
