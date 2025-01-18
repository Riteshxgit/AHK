; Remap keys when Ctrl is pressed

; This function checks if Ctrl is released and disables remapping
CheckCtrl:
    if !GetKeyState("Ctrl", "P")
    {
        Suspend, Off
        SetTimer, CheckCtrl, Off
    }
return

#If GetKeyState("Ctrl", "P")
z::;
v::.
w::,
b::n
x::b
k::v
j::c
q::x
;::z
o::s
e::d
u::f
i::g
d::h
h::j
t::k
n::l
s::;
l::p
r::o
c::i
g::u
f::y
y::t
p::r
.::e
,::w
'::q
semicolon::z

~Ctrl::
    Suspend, On
    SetTimer, CheckCtrl, 10
return
