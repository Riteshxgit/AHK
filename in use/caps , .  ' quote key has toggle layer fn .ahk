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
layer_active := false

; Redefine the ' key to toggle layers on tap
$':: 
    layer_active := !layer_active  ; Toggle the layer state
    if (layer_active) {
        ; Activate layer
        Hotkey, *g, Send0, On
        Hotkey, *f, Send1, On
        Hotkey, *d, Send2, On
        Hotkey, *s, Send3, On
        Hotkey, *a, Send4, On
        Hotkey, *t, Send5, On
        Hotkey, *r, Send6, On
        Hotkey, *e, Send7, On
        Hotkey, *w, Send8, On
        Hotkey, *q, Send9, On
    } else {
        ; Deactivate layer
        Hotkey, *g, Send0, Off
        Hotkey, *f, Send1, Off
        Hotkey, *d, Send2, Off
        Hotkey, *s, Send3, Off
        Hotkey, *a, Send4, Off
        Hotkey, *t, Send5, Off
        Hotkey, *r, Send6, Off
        Hotkey, *e, Send7, Off
        Hotkey, *w, Send8, Off
        Hotkey, *q, Send9, Off
    }
Return

; Remap functions
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

;--------------------------------------------------------------
`::,