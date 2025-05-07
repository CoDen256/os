Set WshShell = CreateObject("WScript.Shell" )
WshShell.Run """C:\os\win\ahk\layout.ahk""", 0 'Must quote command if it has spaces; must escape quotes
Set WshShell = Nothing