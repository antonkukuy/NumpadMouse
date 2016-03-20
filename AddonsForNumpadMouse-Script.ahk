GroupAdd, Games, ahk_exe ugol.exe              ; table shulte
GroupAdd, Games, ahk_exe swf_player.exe        ; numbers



RControl & l::Send {Shift down}{LCtrl down}{vk54}{Shift Up}{LCtrl up}     ; +^t - restore tab in chrome
RControl & k::Send {LCtrl down}{vk57}{LCtrl up}     ; ^w  - close tab
RControl & vk49 ::Send {HOME}     ; ^i  - head page
RControl & vkBC ::Send {END}     ; ^,  - footer page
RControl & '::Send {LCtrl down}{Tab}{LCtrl up}
RControl & `;::Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}
RControl & vk4F::WinMaximize, A    ; ^o  - max window
RControl & vk4D::WinMinimize, A    ; ^m  - mix window
AppsKey::send {Space}
+i::send {Up}
+k::send {Down}
+j::send {Left}
+l::send {Right}
^i::
MouseClick, left,  862, 616    ; YouTube Full screen
Return
+o::
MouseClick, left,  850, 598    ; YouTube Full screen for extention
Return
+m::
send {Esc}
Sleep, 200
MouseClick, left,  684, 661    ; YouTube Esc Full screen for extention
Return
+u::                           ; YouTube Speed 1x
MouseClick, left,  789, 615
Sleep, 1300
MouseClick, left,  802, 514
Sleep, 1300
MouseClick, left,  834, 570
Sleep, 1300
MouseClick, left,  861, 613
Sleep, 1300
MouseClick, left,  1097, 558
Sleep, 1300
Return
+y::                           ; YouTube Speed 2x and full screen mode
mouseclick, left, 655, 486
sleep, 1600
mouseclick, left,  794, 613
sleep, 1600
MouseClick, left,  808, 541
Sleep, 1600
MouseClick, left,  830, 572
Sleep, 1600
MouseClick, left,  861, 616
Sleep, 1600
MouseClick, left,  798, 663
Sleep, 160
Return
^y::                           ; YouTube playlist Speed 2x and full screen mode
mouseclick, left,  793, 615
sleep, 1600
MouseClick, left,  803, 518
Sleep, 1600
MouseClick, left,  830, 572
Sleep, 1600
MouseClick, left,  861, 616
Sleep, 1600
MouseClick, left,  798, 663
Sleep, 16000
Return
LControl & k::                           ; ; YouTube Full screen for extention Speed 2x with autoplay
MouseClick, left,  823,  601
Sleep, 1300
MouseClick, left,  795,  504
Sleep, 1300
MouseClick, left,  830,  552
Sleep, 1300
MouseClick, left,  858,  599
Return
+^k::                           ; ; YouTube Full screen for extention Speed 2x and play
MouseClick, left,  823,  601
Sleep, 1300
MouseClick, left,  795,  504
Sleep, 1300
MouseClick, left,  830,  552
Sleep, 1300
MouseClick, left,  858,  599
Sleep, 1300
MouseClick, left,  850, 598
Return

;ToolTipFont(Options, Name)
;Sets the font options and name for subsequent calls to the ToolTip command.
;Parameters are the same as for Gui Font.
;Pass "Default" for Options to restore the font setting to default.


;ToolTipColor(Background, Text)
;Sets the background and text colours for subsequent calls to the ToolTip command.
;Parameters are the same as for Gui Color.
;Pass "Default" for either parameter to restore it to its default. If both are default, the system visual style is used.

;Examples
;ToolTipFont("s20", "Comic Sans MS")
;ToolTipColor("Red", "Blue")

ToolTipFont(Options := "", Name := "", hwnd := "") {
    static hfont := 0
    if (hwnd = "")
        hfont := Options="Default" ? 0 : _TTG("Font", Options, Name), _TTHook()
    else
        SendMessage 0x30, hfont, 0,, ahk_id %hwnd%
}

ToolTipColor(Background := "", Text := "", hwnd := "") {
    static bc := "", tc := ""
    if (hwnd = "") {
        if (Background != "")
            bc := Background="Default" ? "" : _TTG("Color", Background)
        if (Text != "")
            tc := Text="Default" ? "" : _TTG("Color", Text)
        _TTHook()
    }
    else {
        VarSetCapacity(empty, 2, 0)
        DllCall("UxTheme.dll\SetWindowTheme", "ptr", hwnd, "ptr", 0, "ptr", bc tc != "" ? &empty : 0)
        if (bc != "")
            SendMessage 1043, %bc%,,, ahk_id %hwnd%
        if (tc != "")
            SendMessage 1044, %tc%,,, ahk_id %hwnd%
    }
}

_TTHook() {
    static hook := 0
    if !hook
        hook := DllCall("SetWindowsHookExW", "int", 4
            , "ptr", RegisterCallback("_TTWndProc", "F"), "ptr", 0
            , "uint", DllCall("GetCurrentThreadId"), "ptr")
}

_TTWndProc(nCode, _wp, _lp) {
    Critical 999
   ;lParam  := NumGet(_lp+0*A_PtrSize)
   ;wParam  := NumGet(_lp+1*A_PtrSize)
    uMsg    := NumGet(_lp+2*A_PtrSize)
    hwnd    := NumGet(_lp+3*A_PtrSize)
    if (nCode >= 0 && (uMsg = 1081 || uMsg = 1036) && WinExist("ahk_class tooltips_class32 ahk_id " hwnd)) {
        ToolTipColor(,, hwnd)
        ToolTipFont(,, hwnd)
    }
    return DllCall("CallNextHookEx", "ptr", 0, "int", nCode, "ptr", _wp, "ptr", _lp, "ptr")
}

_TTG(Cmd, Arg1, Arg2 := "") {
    static htext := 0, hgui := 0
    if !htext {
        Gui _TTG: Add, Text, +hwndhtext
        Gui _TTG: +hwndhgui +0x40000000
    }
    Gui _TTG: %Cmd%, %Arg1%, %Arg2%
    if (Cmd = "Font") {
        GuiControl _TTG: Font, %htext%
        SendMessage 0x31, 0, 0,, ahk_id %htext%
        return ErrorLevel
    }
    if (Cmd = "Color") {
        hdc := DllCall("GetDC", "ptr", htext, "ptr")
        SendMessage 0x138, hdc, htext,, ahk_id %hgui%
        clr := DllCall("GetBkColor", "ptr", hdc, "uint")
        DllCall("ReleaseDC", "ptr", htext, "ptr", hdc)
        return clr
    }
}

;If WinActivate (ahk_exe ugol.exe)
#IfWinActive ahk_exe ugol.exe
k::
LControl::
MouseClick, left,  1010,  730
Sleep, 100
MouseClick, left,  1166,  721
Sleep, 100
MouseMove, 683, 390
Sleep, 100
Return

#IfWinActive


/*
#IfWinActive, ahk_class TTOTAL_CMD
    SetScrollLockState, Off 
    Return

#IfWinNotActive, ahk_class TTOTAL_CMD
    SetScrollLockState, On 
    Return

*/

; Восстановление последнего свернутого окна
/*
DetectHiddenWindows, on ;включаем поиск в скрытых окнах
!`:: ; Alt+ ` - горячая клавиша
 
If Win_To_Hide_ID = ;если значение переменной  пусто (т.е. окно еще не скрывалось)
    {
        WinGet, Win_To_Hide_ID, ID, A ; сохранить ID скрываемого окна в переменной
        WinHide, ahk_id %Win_To_Hide_ID% ; скрыть окно
    }
else ;если же окно уже скрыто, то выполняем:
    {
        WinShow, ahk_id %Win_To_Hide_ID% ; восстановить скрытое окно с запомненным ID
        WinActivate, ahk_id %Win_To_Hide_ID% ; активизировать его
        Win_To_Hide_ID = ;обнуляем значение переменной, чтобы можно было снова скрывать окно
    }

Return ; закончить обработку горячей клавиши
*/
