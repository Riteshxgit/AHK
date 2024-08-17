----------------------------caps--------------------------------------------------


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

; Remap f to $
f::Send, $
; Remap g to >
g::Send, >
; Remap c to =
c::Send, =
; Remap r to \
r::Send, `\
; Remap l to !
l::Send, {!}
; Remap d to <
d::Send, <
; Remap h to (
h::Send, (
; Remap t to +
t::Send, {+}
; Remap n to *
n::Send, *
; Remap b to _
b::Send, {_}
; Remap m to )
m::Send, )
; Remap w to -
w::
Send, -
return

return
; Remap / to ?
/::
Send, ?
return

; Remap s to -
s::
Send, {-}
return

;-----
; Remap  to !
;v::
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