;----------------------------caps--------------------------------------------------


CapsLock::
   KeyWait, CapsLock                      ; wait for Capslock to be released
   KeyWait, CapsLock, D T0.09             ; and pressed again within 0.2 seconds
   if ErrorLevel
      return
   else if (A_PriorKey = "CapsLock")
      SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
   return
*CapsLock:: return                        ; This forces capslock into a modifying key.

#If, GetKeyState("CapsLock", "P") ;Your CapsLock hotkeys go below
;a::         Highlight.case.lower()
;s::         Highlight.case.upper()
;d::         Highlight.case.sentence()
;f::         Highlight.case.title()


;---------------------------------Remaping goes here-------------------------------;

; Remap y to $
y::Send, $
; Remap u to >
u::Send, >
; Remap i to =
i::Send, =
; Remap o to \
o::Send, `\
; Remap p to !
p::Send, {!}
; Remap h to <
h::Send, <
; Remap j to (
j::Send, (
; Remap k to +
k::Send, {+}
; Remap l to *
l::Send, *
; Remap n to _
n::Send, {_}
; Remap m to )
m::Send, )
; Remap , to -
,::
Send, -
return

return
; Remap [ to ?
[::
Send, ?
return

; Remap ; to -
`;::
Send, {-}
return

;-----
; Remap . to !
;.::
;Send, {!}



;----------------------------------------------------------------------------------;




#If

class Highlight {

   Copy() {
      AutoTrim Off
      c := ClipboardAll
      Clipboard := ""             ; Must start off blank for detection to work.
      Send, ^c
      ClipWait 0.5
      if ErrorLevel
         return
      t := Clipboard
      Clipboard := c
      VarSetCapacity(c, 0)
      return t
   }

   Paste(t) {
      c := ClipboardAll
      Clipboard := t
      Send, ^v
      Sleep 50                    ; Don't change clipboard while it is pasted! (Sleep > 0)
      Clipboard := c
      VarSetCapacity(c, 0)        ; Free memory
      AutoTrim On
   }

   class Case {

      Lower(data := "") {
         text := (data == "") ? Highlight.copy() : data
         StringLower, lower, text
         return (data == "") ? Highlight.paste(lower) : lower
      }

      Upper(data := "") {
         text := (data == "") ? Highlight.copy() : data
         StringUpper, upper, text
         return (data == "") ? Highlight.paste(upper) : upper
      }

      Title(data := "") {
         text := (data == "") ? Highlight.copy() : data
         StringUpper, title, text, T
         return (data == "") ? Highlight.paste(title) : title
      }

      Sentence(data := "") {
         text := (data == "") ? Highlight.copy() : data
         X := "I,LOL"
         S := ""
         T := RegExReplace(text, "[\.\!\?]\s+|\R+|\t+", "$0þ")
         Loop Parse, T, þ
         {
            StringLower L, A_LoopField
            I := Chr(Asc(A_LoopField))
            StringUpper I, I
            S .= I SubStr(L,2)
         }
         Loop Parse, X, `,
            S := RegExReplace(S, "i)\b" A_LoopField "\b", A_LoopField)
         return (data == "") ? Highlight.paste(S) : S
      }
   }
}




;------------------------------------------------------------------------------;

;--------------------------------  .   ---------------------------------------------

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Function to handle tap or hold for the . key using scan code SC034
SC034::
    KeyWait, SC034, T0.01
    if (ErrorLevel) ; If held down
    {
        ; Enable remapping
        Hotkey, *e, SendUpArrow, On
        Hotkey, *s, SendLeftArrow, On
        Hotkey, *d, SendDownArrow, On
        Hotkey, *f, SendRightArrow, On
        Hotkey, *r, Send_apos, On
        Hotkey, *t, SendFwrdSlash, On

        Hotkey, *k, SendEnter, On
        Hotkey, *j, SendBackspace, On
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

        Hotkey, *k, SendEnter, Off
        Hotkey, *j, SendBackspace, Off
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




;--------------------------------------------------------------------------------
;---------------------------------- ,  ------------------------------------------

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
        Send, {'}
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
        Send, {|}
    }
Return



;--------------------------------------------------------------------------------
;---------------------------------- '  ------------------------------------------

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
    Hotkey, *q, SendCtrlQ, Off
    Hotkey, *w, SendCtrlW, Off
    Hotkey, *e, SendCtrlE, Off
    Hotkey, *r, SendCtrlR, Off
    Hotkey, *t, SendCtrlT, Off
    Hotkey, *y, SendCtrlY, Off
    Hotkey, *u, SendCtrlU, Off
    Hotkey, *i, SendCtrlI, Off
    Hotkey, *o, SendCtrlO, Off
    Hotkey, *p, SendCtrlP, Off 
    Hotkey, *a, SendCtrlA, Off
    Hotkey, *s, SendCtrlS, Off
    Hotkey, *d, SendCtrlD, Off 
    Hotkey, *f, SendCtrlF, Off 
    Hotkey, *g, SendCtrlG, Off 
    Hotkey, *h, SendCtrlH, Off 
    Hotkey, *j, SendCtrlJ, Off 
    Hotkey, *k, SendCtrlK, Off 
    Hotkey, *l, SendCtrlL, Off 
    Hotkey, *z, SendCtrlZ, Off
    Hotkey, *x, SendCtrlX, Off 
    Hotkey, *c, SendCtrlC, Off 
    Hotkey, *v, SendCtrlV, Off 
    Hotkey, *b, SendCtrlB, Off 
    Hotkey, *n, SendCtrlN, Off 
    Hotkey, *m, SendCtrlM, Off
    Hotkey, *q, SendCtrlShiftQ, Off
    Hotkey, *w, SendCtrlShiftW, Off
    Hotkey, *e, SendCtrlShiftE, Off
    Hotkey, *r, SendCtrlShiftR, Off
    Hotkey, *t, SendCtrlShiftT, Off
    Hotkey, *y, SendCtrlShiftY, Off
    Hotkey, *u, SendCtrlShiftU, Off
    Hotkey, *i, SendCtrlShiftI, Off
    Hotkey, *o, SendCtrlShiftO, Off
    Hotkey, *p, SendCtrlShiftP, Off 
    Hotkey, *a, SendCtrlShiftA, Off
    Hotkey, *s, SendCtrlShiftS, Off
    Hotkey, *d, SendCtrlShiftD, Off 
    Hotkey, *f, SendCtrlShiftF, Off 
    Hotkey, *g, SendCtrlShiftG, Off 
    Hotkey, *h, SendCtrlShiftH, Off 
    Hotkey, *j, SendCtrlShiftJ, Off 
    Hotkey, *k, SendCtrlShiftK, Off 
    Hotkey, *l, SendCtrlShiftL, Off 
    Hotkey, *z, SendCtrlShiftZ, Off
    Hotkey, *x, SendCtrlShiftX, Off 
    Hotkey, *c, SendCtrlShiftC, Off 
    Hotkey, *v, SendCtrlShiftV, Off 
    Hotkey, *b, SendCtrlShiftB, Off 
    Hotkey, *n, SendCtrlShiftN, Off 
    Hotkey, *m, SendCtrlShiftM, Off

    if (layer_state = 1) {
        ; Activate ctrl layer
        Hotkey, *q, SendCtrlQ, On
        Hotkey, *w, SendCtrlW, On
        Hotkey, *e, SendCtrlE, On
        Hotkey, *r, SendCtrlR, On
        Hotkey, *t, SendCtrlT, On
        Hotkey, *y, SendCtrlY, On
        Hotkey, *u, SendCtrlU, On
        Hotkey, *i, SendCtrlI, On
        Hotkey, *o, SendCtrlO, On
        Hotkey, *p, SendCtrlP, On 
        Hotkey, *a, SendCtrlA, On
        Hotkey, *s, SendCtrlS, On
        Hotkey, *d, SendCtrlD, On 
        Hotkey, *f, SendCtrlF, On 
        Hotkey, *g, SendCtrlG, On 
        Hotkey, *h, SendCtrlH, On 
        Hotkey, *j, SendCtrlJ, On 
        Hotkey, *k, SendCtrlK, On 
        Hotkey, *l, SendCtrlL, On 
        Hotkey, *z, SendCtrlZ, On
        Hotkey, *x, SendCtrlX, On 
        Hotkey, *c, SendCtrlC, On 
        Hotkey, *v, SendCtrlV, On 
        Hotkey, *b, SendCtrlB, On 
        Hotkey, *n, SendCtrlN, On 
        Hotkey, *m, SendCtrlM, On

    } else if (layer_state = 2) {
        ; Activate ctrl+shift layer
        Hotkey, *q, SendCtrlShiftQ, On
        Hotkey, *w, SendCtrlShiftW, On
        Hotkey, *e, SendCtrlShiftE, On
        Hotkey, *r, SendCtrlShiftR, On
        Hotkey, *t, SendCtrlShiftT, On
        Hotkey, *y, SendCtrlShiftY, On
        Hotkey, *u, SendCtrlShiftU, On
        Hotkey, *i, SendCtrlShiftI, On
        Hotkey, *o, SendCtrlShiftO, On
        Hotkey, *p, SendCtrlShiftP, On 
        Hotkey, *a, SendCtrlShiftA, On
        Hotkey, *s, SendCtrlShiftS, On
        Hotkey, *d, SendCtrlShiftD, On 
        Hotkey, *f, SendCtrlShiftF, On 
        Hotkey, *g, SendCtrlShiftG, On 
        Hotkey, *h, SendCtrlShiftH, On 
        Hotkey, *j, SendCtrlShiftJ, On 
        Hotkey, *k, SendCtrlShiftK, On 
        Hotkey, *l, SendCtrlShiftL, On 
        Hotkey, *z, SendCtrlShiftZ, On
        Hotkey, *x, SendCtrlShiftX, On 
        Hotkey, *c, SendCtrlShiftC, On 
        Hotkey, *v, SendCtrlShiftV, On 
        Hotkey, *b, SendCtrlShiftB, On 
        Hotkey, *n, SendCtrlShiftN, On 
        Hotkey, *m, SendCtrlShiftM, On
    }
Return

; Remap ctrl
SendCtrlQ:
Send, ^q
Return

SendCtrlW:
Send, ^w
Return

SendCtrlE:
Send, ^e
Return

SendCtrlR:
Send, ^r
Return

SendCtrlT:
Send, ^t
Return

SendCtrlY:
Send, ^y
Return

SendCtrlU:
Send, ^u
Return

SendCtrlI:
Send, ^i
Return

SendCtrlO:
Send, ^o
Return

SendCtrlP:
Send, ^p
Return

SendCtrlA:
Send, ^a
Return

SendCtrlS:
Send, ^s
Return

SendCtrlD:
Send, ^d
Return

SendCtrlF:
Send, ^f
Return

SendCtrlG:
Send, ^g
Return

SendCtrlH:
Send, ^h
Return

SendCtrlJ:
Send, ^j
Return

SendCtrlK:
Send, ^k
Return

SendCtrlL:
Send, ^l
Return

SendCtrlZ:
Send, ^z
Return

SendCtrlX:
Send, ^x
Return

SendCtrlC:
Send, ^c
Return

SendCtrlV:
Send, ^v
Return

SendCtrlB:
Send, ^b
Return

SendCtrlN:
Send, ^n
Return

SendCtrlM:
Send, ^m
Return


; Remap ctrl+shift
SendCtrlShiftQ:
Send, ^+q
Return

SendCtrlShiftW:
Send, ^+w
Return

SendCtrlShiftE:
Send, ^+e
Return

SendCtrlShiftR:
Send, ^+r
Return

SendCtrlShiftT:
Send, ^+t
Return

SendCtrlShiftY:
Send, ^+y
Return

SendCtrlShiftU:
Send, ^+u
Return

SendCtrlShiftI:
Send, ^+i
Return

SendCtrlShiftO:
Send, ^+o
Return

SendCtrlShiftP:
Send, ^+p
Return

SendCtrlShiftA:
Send, ^+a
Return

SendCtrlShiftS:
Send, ^+s
Return

SendCtrlShiftD:
Send, ^+d
Return

SendCtrlShiftF:
Send, ^+f
Return

SendCtrlShiftG:
Send, ^+g
Return

SendCtrlShiftH:
Send, ^+h
Return

SendCtrlShiftJ:
Send, ^+j
Return

SendCtrlShiftK:
Send, ^+k
Return

SendCtrlShiftL:
Send, ^+l
Return

SendCtrlShiftZ:
Send, ^+z
Return

SendCtrlShiftX:
Send, ^+x
Return

SendCtrlShiftC:
Send, ^+c
Return

SendCtrlShiftV:
Send, ^+v
Return

SendCtrlShiftB:
Send, ^+b
Return

SendCtrlShiftN:
Send, ^+n
Return

SendCtrlShiftM:
Send, ^+m
Return



;--------------------------------------------------------------


