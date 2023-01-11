#include Gdip_All.ahk ; from https://github.com/mmikeww/AHKv2-Gdip
#If WinActive("Voice")
^v::
    pToken := Gdip_Startup() 
    pBitmap := Gdip_CreateBitmapFromClipboard()
    if(pBitmap > 0 ) { 
        Gdip_SaveBitmapToFile(pBitmap, OUTF := A_ScriptDir "\" A_Now ".jpg" ) 
        Gdip_DisposeImage(pBitmap) 
        SendInput +{tab}{enter}
        Sleep, 1000
        SendInput {enter}
        WinWaitActive, Open,,2
        if !ErrorLevel {
            SendInput %OUTF%{enter}
        }
    } else {
        SendInput ^v
    }
    Gdip_Shutdown(pToken)
    Loop {
        Sleep, 1000
        FileDelete %OUTF%
    } Until ErrorLevel
Return
#If
