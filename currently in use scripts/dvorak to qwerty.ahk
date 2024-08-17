#NoEnv
SendMode Input
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
#MaxHotkeysPerInterval 1000

; Dvorak to QWERTY remapping
dvorakToQwerty := { "a":"a", "b":"x", "c":"j", "d":"e", "e":".", "f":"u", "g":"i", "h":"d", "i":"c", "j":"h", "k":"t", "l":"n", "m":"m", "n":"b", "o":"r", "p":"l", "q":"'", "r":"p", "s":"o", "t":"y", "u":"g", "v":"k", "w":",", "x":"q", "y":"f", "z":";", ";":"s", "'":"-", ".":"v", ",":"w", "/":"z" }

; Detect if a modifier key is pressed
IsModifierPressed() {
    return GetKeyState("Ctrl", "P") || GetKeyState("Alt", "P") || GetKeyState("LWin", "P") || GetKeyState("RWin", "P")
}

; Function to handle key remapping
RemapKey(key) {
    if IsModifierPressed() {
        if dvorakToQwerty.HasKey(key) {
            SendInput % dvorakToQwerty[key]
        } else {
            SendInput %key%
        }
    } else {
        SendInput %key%
    }
}

; Remap each Dvorak key to the corresponding QWERTY key when a modifier is pressed
~a::RemapKey("a")
~b::RemapKey("b")
~c::RemapKey("c")
~d::RemapKey("d")
~e::RemapKey("e")
~f::RemapKey("f")
~g::RemapKey("g")
~h::RemapKey("h")
~i::RemapKey("i")
~j::RemapKey("j")
~k::RemapKey("k")
~l::RemapKey("l")
~m::RemapKey("m")
~n::RemapKey("n")
~o::RemapKey("o")
~p::RemapKey("p")
~q::RemapKey("q")
~r::RemapKey("r")
~s::RemapKey("s")
~t::RemapKey("t")
~u::RemapKey("u")
~v::RemapKey("v")
~w::RemapKey("w")
~x::RemapKey("x")
~y::RemapKey("y")
~z::RemapKey("z")
~`;::RemapKey(";")
~'::RemapKey("'")
~.::RemapKey(".")
~,::RemapKey(",")
~/::RemapKey("/")

; Allow hotkeys to work even if modifiers are held
#If IsModifierPressed()
a::SendInput % dvorakToQwerty["a"]
b::SendInput % dvorakToQwerty["b"]
c::SendInput % dvorakToQwerty["c"]
d::SendInput % dvorakToQwerty["d"]
e::SendInput % dvorakToQwerty["e"]
f::SendInput % dvorakToQwerty["f"]
g::SendInput % dvorakToQwerty["g"]
h::SendInput % dvorakToQwerty["h"]
i::SendInput % dvorakToQwerty["i"]
j::SendInput % dvorakToQwerty["j"]
k::SendInput % dvorakToQwerty["k"]
l::SendInput % dvorakToQwerty["l"]
m::SendInput % dvorakToQwerty["m"]
n::SendInput % dvorakToQwerty["n"]
o::SendInput % dvorakToQwerty["o"]
p::SendInput % dvorakToQwerty["p"]
q::SendInput % dvorakToQwerty["q"]
r::SendInput % dvorakToQwerty["r"]
s::SendInput % dvorakToQwerty["s"]
t::SendInput % dvorakToQwerty["t"]
u::SendInput % dvorakToQwerty["u"]
v::SendInput % dvorakToQwerty["v"]
w::SendInput % dvorakToQwerty["w"]
x::SendInput % dvorakToQwerty["x"]
y::SendInput % dvorakToQwerty["y"]
z::SendInput % dvorakToQwerty["z"]
`;::SendInput % dvorakToQwerty[";"]
'::SendInput % dvorakToQwerty["'"]
.::SendInput % dvorakToQwerty["."]
,::SendInput % dvorakToQwerty[","]
/::SendInput % dvorakToQwerty["/"]
#If

return
