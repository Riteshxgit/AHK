; Navigation up down right left

; Move the mouse cursor up by 46 pixels when Numpad 6 is pressed (UP)
Numpad8::
{
    MouseGetPos, currentX, currentY  ; Get the current mouse position
    MouseMove, currentX, currentY - 46, 0  ; Move the cursor up by 46 pixels
}
return

; Move the mouse cursor down by 46 pixels when Numpad 3 is pressed (DOWN)
Numpad5::
{
    MouseGetPos, currentX, currentY  ; Get the current mouse position
    MouseMove, currentX, currentY + 46, 0  ; Move the cursor down by 46 pixels
}
return

; Move the mouse cursor right by 45 pixels when Numpad 3 is pressed (-->)
Numpad6::
{
    MouseGetPos, currentX, currentY  ; Get the current mouse position
    MouseMove, currentX + 46, currentY, 0  ; Move the cursor right by 45 pixels
}
return

; Move the mouse cursor left by 45 pixels when Numpad 1 is pressed (<--)
Numpad4::
{
    MouseGetPos, currentX, currentY  ; Get the current mouse position
    MouseMove, currentX - 46, currentY, 0  ; Move the cursor left by 45 pixels
}
return


;--------------- SCROLL ----------------------------------

; Define hotkeys for dedicated scroll actions

; Press = to scroll down at location (600, 500)
Numpad1::
{
    CoordMode, Mouse, Screen
    ; MouseMove, 600, 500  ; Move mouse to the predescribed location
    MouseClick, WheelDown, currentX, currentY, 1  ; Scroll down 3 units
}
return

; Press - to scroll up at location (600, 500)
Numpad3::
{
    CoordMode, Mouse, Screen
    ; MouseMove, 600, 500  ; Move mouse to the predescribed location
    MouseClick, WheelUp, currentX, currentY, 1  ; Scroll up 3 units
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Define hotkey to trigger the sequence
; Press ] to execute the script
Numpad7::
{
    MouseGetPos, originalX, originalY

    ; Step 1: Click at (200, 100)
    CoordMode, Mouse, Screen
    MouseMove, 200, 100
    Click

    ; Delay for 0.15 seconds
    Sleep, 150

    ; Step 2: Move Mouse to (600, 500)
    MouseMove, originalX, originalY
}
return

Numpad0::
{
    MouseGetPos, originalX, originalY

    ; Step 1: Click at (200, 100)
    CoordMode, Mouse, Screen
    MouseMove, 1900, 152
    Click

    ; Delay for 0.15 seconds

    ; Step 2: Move Mouse to (600, 500)
    MouseMove, originalX, originalY
}
Return

NumpadDot::
{
    MouseGetPos, originalX, originalY

    ; Step 1: Click at (200, 100)
    CoordMode, Mouse, Screen
    MouseMove, 1900, 176
    Click

    ; Delay for 0.15 seconds

    ; Step 2: Move Mouse to (600, 500)
    MouseMove, originalX, originalY
}
Return

; Perform a left mouse click at the current mouse cursor location when Numpad 9 is pressed
Numpad9::
{
    Click  ; Perform a left mouse click
}
return

Up::
{
    MouseGetPos, originalX, originalY

    ; Step 1: Click at (200, 100)
    CoordMode, Mouse, Screen
    MouseMove, 1850, 380
    Click

    ; Delay for 0.15 seconds
    Sleep, 150

    ; Step 2: Move Mouse to (600, 500)
    MouseMove, originalX, originalY
}
return

Down::
{
    MouseGetPos, originalX, originalY

    ; Step 1: Click at (200, 100)
    CoordMode, Mouse, Screen
    MouseMove, 1850, 490
    Click

    ; Delay for 0.15 seconds
    Sleep, 150

    ; Step 2: Move Mouse to (600, 500)
    MouseMove, originalX, originalY
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

