; add us english-us keyboard
; add russian keyboard
; add german-us keyboard
$#F11:: {
    SetInputLang(0x0419)
}

$#F12:: {
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
