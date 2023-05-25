#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

LWin::
Send {Esc} 
Return 

; add us english-us keyboard
; add russion keyboard
; add german-us keyboard
; to remove existent - just add it to the language list (via settings), and then remove it again(via settings)
; test alloha hui ålohui ähahåh åspån dristön üpstön ы І Ї
$F1:: SetInputLang(0x0419)
return

$F3:: SetInputLang(0x0407) ; de-de
return


$F4:: SetInputLang(0x0409) ; english-ÜS
return



SetInputLang(Lang)
{
    WinExist("A")
    ControlGetFocus, CtrlInFocus
    PostMessage, 0x50, 0, % Lang, %CtrlInFocus%
}

`::

ClipSaved := ClipboardAll 


Send {Left}{LShift down}{Right down}{LShift up}{Right up}

Send ^c
sleep, 50
if (clipboard == "a"){
    Send ä
}
else if (clipboard == "A"){
    Send Ä
}
else if (clipboard == "o"){
    Send ö
}
else if (clipboard == "O"){
    Send Ö
}
else if (clipboard == "u"){
    Send ü
}
else if (clipboard == "U"){
    Send Ü
}
else if (clipboard == "s"){
    Send ß
}else if (clipboard == "ä"){
    Send å
}
else if (clipboard == "Ä"){
    Send Å
}
else if (clipboard == "и"){
    Send і
}
else if (clipboard == "И"){
    Send І
}
else if (clipboard == "й"){
    Send ї
}
else if (clipboard == "Й"){
    Send Ї
}

else {
    Send {Right}
} 

Clipboard := ClipSaved   
ClipSaved := ""   

return