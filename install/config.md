
###### Update Path and link tools

    pathed /append "$($env:USERPROFILE)\tools\android" /user
    pathed /append "$($env:USERPROFILE)\tools\android\dex-tools" /user
    pathed /append "$($env:USERPROFILE)\tools\android\dex-tools\bin" /user
    pathed /append "$($env:USERPROFILE)\tools\android\jadx\bin" /user

    pathed /append $(dir "$($env:USERPROFILE)\tools\android\sdk\build-tools\*").FullName 
    pathed /append "$($env:USERPROFILE)\tools\android\sdk\platform-tools" /user     
    pathed /append "C:\Program Files\7-Zip" /user                                   





