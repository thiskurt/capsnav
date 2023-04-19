; TabNav: Windows snapping, virtual desktops and moving between monitors
;-----------------------------------------------------------------------
; Allow default functionality
Tab::Send("{tab}")
+Tab::Send("+{tab}")
#Tab::Send("#{tab}")
LAlt & Tab::AltTab
; LAlt & Tab::Send("^!{tab}")
Ctrl & Tab::{
    if GetKeyState("Shift") = 1 {
        Send("^+{tab}")
    } else if GetKeyState("Alt") = 1 { 
        Send("^!{tab}")
    } else {
        Send("^{tab}")
    }
    return
}
; Tab + er = ctrl tab and shift ctrl tab alternative
Tab & e::Send("^+{tab}")
Tab & r::Send("^{tab}")
; Tab + space = AltGr Tab (alt tab with pausing)
Tab & Space::Send("^!{tab}")
; Tab + hjkl = window snapping
Tab & h::Send("#{Left}")
Tab & j::Send("#{Down}")
Tab & k::Send("#{Up}")
Tab & l::Send("#{Right}")
; Tab + nm = move between virtual desktops
Tab & n::Send("^#{Left}")
Tab & m::Send("^#{Right}")
; Tab + yu = move window between monitors
Tab & y::Send("+#{Left}")
Tab & u::Send("+#{Right}")
; Tab + <> = delete current, add new virtual desktop
Tab & ,::Send("^#{F4}")
Tab & .::Send("^#{d}")