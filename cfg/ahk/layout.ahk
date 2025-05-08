#Requires AutoHotkey v2.0
#SingleInstance Force
#DllLoad "Imm32" ; for consoles compatibility, see docs.microsoft.com/en-us/windows/win32/api/imm/
; InstallKeybdHook
; KeyHistory
global imm := DllCall("GetModuleHandle", "Str","Imm32", "Ptr") ; better performance; lexikos.github.io/v2/docs/commands/DllCall.htm
global immGetDefaultIMEWnd := DllCall("GetProcAddress", "Ptr",imm, "AStr","ImmGetDefaultIMEWnd", "Ptr") ; docs.microsoft.com/en-us/windows/win32/api/imm/nf-imm-immgetdefaultimewnd


; https://stackoverflow.com/questions/71547669/use-multi-modifier-key-combination-in-autohotkey-to-replace-alt-tab
; using custom since its working, requires uninstalling copilot to disable win+shift+c or smth like that
; still sometimes tries to open some https link i dont now what it is
#+!c::{
    Send("{Shift Up}") ; allow circle forward(c) after circling back(g)
    Send("{Alt Down}{Tab}")
}

#+!g::{
    Send("{Alt Down}{Shift Down}{Tab}")
}

#+!Escape::{
    Send("{Alt Down}{F4}{Alt Up}")
}

#+!Backspace::{
    Run "wt.exe"
}

; add us english-us keyboard
; add russian keyboard
; add german-us keyboard
$#F11:: {
    SetInputLang(0x0419) ; 67699721
}

$#F12:: { ; win F12
    SetInputLang(0x0407) ; de-de
}

$#F10:: {
    SetInputLang(0x0409) ; english-ÜS
}


SetInputLang(Lang)
{
    hWnd := WinActive("A")
    PostMessage(0x50, 0, Lang, hWnd)
}