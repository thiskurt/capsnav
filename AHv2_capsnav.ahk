; CapsLock            : Esc
; CapsLock+t          : CapsLock
; CapsLock + h/j/k/l  : arrows left/down/up/right, including most combos:
;                       - CapsLock + Shift (+ Ctrl) (+ Alt)
;                       - CapsLock + Ctrl (+ Win)
;                       - CapsLock + Alt || CapsLock + Win
;                       - Not CapsLock + Shift + Win or CapsLock + Alt + Win
; CaspLock + n/m      : Home/End
; CaspLock + y/u      : PageUp/PageDown
; CaspLock + s/d/f/g  : Shift/Ctrl/Alt/Win
; CaspLock + ,/.      : Delete word-before/word-after
; CapsLock + i/p      : Insert/PrintScreen
; CapsLock + 1/../=   : F1/../F12
;                       - Ctrl + 4 || Alt + 4 || Shift + 4 => + F4 supported
;                       - Ctrl + - supported  
;                       - Ctrl + = supported  
; CapsLock + w/e/r    : volume down/up/off
; CapsLock + x/c/v    : brightness down/up/half
; CapsLock + [        : backspace
; CapsLock + ]        : delete

; TODO: Some oddities to fix
;   - CapsLock + G        => triggers Win + G (assigned to xbox game thing)
;       --> Now it doesn't anymore!?
;   - Capslock + Win + L  => triggers Win + L (assigned to lock windows)
;   = So in general, supress the letters when they are keys?

; CapsLock Initializer
;--------------------------------------
SetCapsLockState("AlwaysOff")

; CapsLock ==> Esc
;--------------------------------------
CapsLock::Send("{ESC}")

; CapsLock + t ==> Capslock
;--------------------------------------
CapsLock & t:: {
    CapsLockState := GetKeyState("CapsLock", "T") ? "D" : "U"
    if (CapsLockState = "D")
        SetCapsLockState("AlwaysOff")
    else
        SetCapsLockState("AlwaysOn")
    KeyWait("``")
    return
} 

; CapsLock Direction Navigator
; CapsLock + h / j / k /l ==> Left / Down / Up / Right
; Ctrl, Alt Compatible
; TODO: Could I do these GetKeyState checks perhaps globally on CapsLock?
;--------------------------------------
CapsLock & h:: {
    ; CapsLock + Shift
    if GetKeyState("Shift") = 1 {
        ; CapsLock + Shift + Ctrl
        if GetKeyState("Ctrl") = 1 {
            ; CapsLock + Shift + Ctrl + Alt
            if GetKeyState("Alt") = 1 {
                Send("+^!{Left}")
                return
            }
            Send("+^{Left}")
            return
        }
        ; CapsLock + Shift + Alt
        else if getKeyState("Alt") = 1 {
            Send("+!{Left}")
            return
        }
        Send("+{Left}")
        return
    }
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        ; CapsLock + Ctrl + Alt
        if GetKeyState("Alt") = 1 {
            Send("^!{Left}")
            return
        }
        if GetKeyState("LWin") = 1 {
            Send("^#{Left}")
            return
        }
        Send("^{Left}")
        return
    }
    ; CapsLock + Alt
    if GetKeyState("Alt") = 1 {
        Send("!{Left}")
        return
    }
    ; CapsLock + Win
    if GetKeyState("LWin") = 1 {
        Send("#{Left}")
        return
    }
    Send("{Left}")
    return
}

CapsLock & j:: {
    ; CapsLock + Shift
    if GetKeyState("Shift") = 1 {
        ; CapsLock + Shift + Ctrl
        if GetKeyState("Ctrl") = 1 {
            ; CapsLock + Shift + Ctrl + Alt
            if GetKeyState("Alt") = 1 {
                Send("+^!{Down}")
                return
            }
            Send("+^{Down}")
            return
        }
        ; CapsLock + Shift + Alt
        else if getKeyState("Alt") = 1 {
            Send("+!{Down}")
            return
        }
        Send("+{Down}")
        return
    }
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        ; CapsLock + Ctrl + Alt
        if GetKeyState("Alt") = 1 {
            Send("^!{Down}")
            return
        }
        if GetKeyState("LWin") = 1 {
            Send("^#{Down}")
            return
        }
        Send("^{Down}")
        return
    }
    ; CapsLock + Alt
    if GetKeyState("Alt") = 1 {
        Send("!{Down}")
        return
    }
    ; CapsLock + Win
    if GetKeyState("LWin") = 1 {
        Send("#{Down}")
        return
    }
    Send("{Down}")
    return
}

CapsLock & k:: {
    ; CapsLock + Shift
    if GetKeyState("Shift") = 1 {
        ; CapsLock + Shift + Ctrl
        if GetKeyState("Ctrl") = 1 {
            ; CapsLock + Shift + Ctrl + Alt
            if GetKeyState("Alt") = 1 {
                Send("+^!{Up}")
                return
            }
            Send("+^{Up}")
            return
        }
        ; CapsLock + Shift + Alt
        else if getKeyState("Alt") = 1 {
            Send("+!{Up}")
            return
        }
        Send("+{Up}")
        return
    }
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        ; CapsLock + Ctrl + Alt
        if GetKeyState("Alt") = 1 {
            Send("^!{Up}")
            return
        }
        if GetKeyState("LWin") = 1 {
            Send("^#{Up}")
            return
        }
        Send("^{Up}")
        return
    }
    ; CapsLock + Alt
    if GetKeyState("Alt") = 1 {
        Send("!{Up}")
        return
    }
    ; CapsLock + Win
    if GetKeyState("LWin") = 1 {
        Send("#{Up}")
        return
    }
    Send("{Up}")
    return
} 

CapsLock & l:: {
    ; CapsLock + Shift
    if GetKeyState("Shift") = 1 {
        ; CapsLock + Shift + Ctrl
        if GetKeyState("Ctrl") = 1 {
            ; CapsLock + Shift + Ctrl + Alt
            if GetKeyState("Alt") = 1 {
                Send("+^!{Right}")
                return
            }
            Send("+^{Right}")
            return
        }
        ; CapsLock + Shift + Alt
        else if getKeyState("Alt") = 1 {
            Send("+!{Right}")
            return
        }
        Send("+{Right}")
        return
    }
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        ; CapsLock + Ctrl + Alt
        if GetKeyState("Alt") = 1 {
            Send("^!{Right}")
            return
        }
        ; CapsLock + Ctrl + Win
        if GetKeyState("LWin") = 1 {
            Send("^#{Right}")
            return
        }
        Send("^{Right}")
        return
    }
    ; CapsLock + Alt
    if GetKeyState("Alt") = 1 {
        Send("!{Right}")
        return
    }
    ; CapsLock + Win
    ; if .. = 0 is neccessary because of 'lock windows'
    if GetKeyState("Ctrl") = 0 {
        if GetKeyState("LWin") = 1 {
            Send("#{Right}")
            return
        }
    }
    Send("{Right}")
    return
}

; CapsLock + Backspace = Del
;--------------------------------------
CapsLock & Backspace:: {
    if GetKeyState("Shift") = 1 {
        Send("+{Del}")
        return
    }
    Send("{Del}")
    return
}

; Alternative modifiers
; CapsLock + s / d / f / g => shift / Ctrl / Alt / Win
;--------------------------------------
CapsLock & s::Shift
CapsLock & d::Ctrl
CapsLock & f::Alt
CapsLock & g::LWin

; More delete options
; CapsLock + , / .    : delete word before / after
; CapsLock + [ / ]    : backspace / delete
;--------------------------------------
CapsLock & ,::Send("^{Backspace}")
CapsLock & .::Send("^{Del}")
Capslock & [::Send("{Backspace}")
Capslock & ]::Send("{Del}")

; CapsLock + p = PrintScreen
;--------------------------------------
CapsLock & p:: {
    if GetKeyState("Ctrl") = 1 {
        Send("^{PrintScreen}")
    }
    if GetKeyState("Alt") {
        Send("!{PrintScreen}")
    }
    Send("{PrintScreen}")
    return
}

; CapsLock + i = Insert
;--------------------------------------
CapsLock & i:: {
    ; CapsLock + Shift
    if GetKeyState("Shift") = 1 {
        Send("+{Insert}")
        return
    }
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        Send("^{Insert}")
        return
    }
    Send("{Insert}")
    return
}

; CapsLock + y = PageUp
;--------------------------------------
CapsLock & y:: {
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        Send("^{PgUp}")
        return
    }
    Send("{PgUp}")
    return
}

; CapsLock + u = PageDown
;--------------------------------------
CapsLock & u:: {
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        Send("^{PgDn}")
        return
    }
    Send("{PgDn}")
    return
}

; CapsLock + n = Home
;--------------------------------------
CapsLock & n:: {
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        ; CapsLock + Ctrl + Shift
        if GetKeyState("Shift"){
            Send("^+{Home}")
            return
        }
        Send("^{Home}")
        return
    }
    ; CapsLock + Shift
    if GetKeyState("Shift"){
        Send("+{Home}")
        return
    }
    Send("{Home}")
    return
}

; CapsLock + m = End
;--------------------------------------
CapsLock & m:: {
    ; CapsLock + Ctrl
    if GetKeyState("Ctrl") = 1 {
        ; CapsLock + Ctrl + Shift
        if GetKeyState("Shift"){
            Send("^+{End}")
            return
        }
        Send("^{End}")
        return
    }
    ; CapsLock + Shift
    if GetKeyState("Shift"){
        Send("+{End}")
        return
    }
    Send("{End}")
    return
}

; CapsLock + 1 to {{ = }} = F1 to F12
;--------------------------------------
CapsLock & 1::Send("{F1}")
CapsLock & 2::Send("{F2}")
CapsLock & 3::Send("{F3}")
CapsLock & 4:: {
    if GetKeyState("Shift") = 1 {
        Send("+{F4}")
        return
    }
    if GetKeyState("Ctrl") = 1 {
        Send("^{F4}")
        return
    }
    if GetKeyState("Alt") = 1 {
        Send("!{F4}")
        return
    }
    Send("{F4}")
}
CapsLock & 5::Send("{F5}")
CapsLock & 6::Send("{F6}")
CapsLock & 7::Send("{F7}")
CapsLock & 8::Send("{F8}")
CapsLock & 9::Send("{F9}")
CapsLock & 0::Send("{F10}")
CapsLock & -:: {
    if GetKeyState("Ctrl") = 1 {
        Send("^{NumpadSub}")
        return
    }
    Send("{F11}")
}
CapsLock & =:: {
    if GetKeyState("Ctrl") = 1 {
        Send("^{NumpadAdd}")
        return
    }
    Send("{F12}")
}

; CapsLock Media Controller
;--------------------------------------
CapsLock & r::Send("{Volume_Mute}")
CapsLock & w::Send("{Volume_Down}")
CapsLock & e::Send("{Volume_Up}")

; CapsLock Brightness Controller
;--------------------------------------
CapsLock & c::ChangeBrightness(+5)
CapsLock & x::ChangeBrightness(-5)
CapsLock & v::SetBrightness(50)

ChangeBrightness(modifier, timeout := 1) {
	for property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness	

	newBrightness := currentBrightness + modifier

	if newBrightness > 100 
		newBrightness := 100
	if newBrightness < 0 
		newBrightness := 0

    SetBrightness(newBrightness, timeout)
}

SetBrightness(newBrightness, timeout := 1) {
    for property in ComObjGet("winmgmts:\\.\root\WMI").ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods")
		property.WmiSetBrightness(timeout, newBrightness)	
}
