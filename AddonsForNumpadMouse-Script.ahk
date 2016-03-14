GroupAdd, Games, ahk_exe ugol.exe              ; table shulte
GroupAdd, Games, ahk_exe swf_player.exe        ; numbers


RControl & '::Send {LCtrl down}{Tab}{LCtrl up}
RControl & `;::Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}
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
^k::                           ; ; YouTube Full screen for extention Speed 2x with autoplay
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