
; add us english-us keyboard
; add russian keyboard
; add german-us keyboard
; to remove existent - just add it to the language list (via settings), and then remove it again(viä settings)
; test allöhä hui ålohui ähahåh åspån drison OAUAUAUAÖÄUAßÄüpston іїґэ ийгє````ÄÖÜoöOoöÖÖÖÖÖO  ÜÜUÜ äöüß ßÄ  ääää äöüI  ß ö ö ü І Ї  И і Э э a aöIü И ö oöoöUÜa Ä; u  Ä Ao U OOÖÖ
$F1:: {
    SetInputLang(0x0419)
}

$F3:: {
    SetInputLang(0x0407) ; de-de
}

$F4:: {
    SetInputLang(0x0409) ; english-ÜS
}


; Flowlauncher key remappings
; Disable some windows shortcuts instead
#Esc::Send("^{Numpad1}")  
#`::Send("^{Numpad2}")    
#Tab::Send("^{Numpad3}")
#q::Send("^{Numpad4}")   
#w::Send("^{Numpad5}")   
#a::Send("^{Numpad6}")   
#s::Send("^{Numpad7}")    
#d::Send("^{Numpad8}")    
#f::Send("^{Numpad9}")     
#Space::Send("^{Numpad0}")
 
; Map the letter to its similar-language variation with rotation (a -> ä -> a)
$`:: {


    ClipSaved := A_Clipboard ; store temporärily original clipboard

    Send("{Left}{LShift down}{Right down}{LShift up}{Right up}") ; Select left character. DO NOT CHANGE, its ok, its indended
    Send("^c") ; Copy selected left character to the clipboard


    sleep(50) ; delay a lil bit

    Mapped := MapLetter(A_Clipboard) ; map the letter


    ; MsgBox(Mapped)

    Send(Mapped) ;replace it with its mapped version

    if (Mapped = ""){ ; if no letter, map it to pressing right
        Send("{Right}")
    }


    ;restore the original clipboard
    A_Clipboard := ClipSaved   
    ClipSaved := ""   

    return
}

CapsLock::{
     Send("``")
 }


SetInputLang(Lang)
{
    hWnd := WinActive("A")
    PostMessage(0x50, 0, Lang, hWnd)
}

MapLetter(letter)
{
    ; MsgBox(letter . StrLen(letter))
    if (LetterMapping.has(letter)){
        return LetterMapping[letter]
    }else {
        return ""
    }
}

LetterMapping := Map(
    "a", "ä",
    "A", "Ä",
    "o", "ö",
    "O", "Ö",
    "u", "ü",
    "U", "Ü",
    "s", "ß",
    "ä", "a",
    "Ä", "A",
    "ö", "o",
    "Ö", "O",
    "ü", "u",
    "Ü", "U",
    "ß", "s",
    "и", "і",
    "И", "І",
    "й", "ї",
    "Й", "Ї",
    "э", "є",
    "Э", "Є",
    "г", "ґ",
    "Г", "Ґ",
    "і", "и",
    "І", "И",
    "ї", "й",
    "Ї", "Й",
    "є", "э",
    "Є", "Э",
    "ґ", "г",
    "Ґ", "Г"
)