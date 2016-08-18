GroupAdd, Games, ahk_exe ugol.exe              ; table shulte
GroupAdd, Games, ahk_exe swf_player.exe        ; numbers

detectHiddenWindows, on
;ControlSend, ahk_class Lv16_MainWindow, {Control down}cc{Control up}   ; tranclate Lingvo
ControlSend, , {Control down}cc{Control up}, ahk_exe Lingvo.exe ; tranclate Lingvo

RControl & vkDB::Send {ESC}    ;^[
RControl & y::Send ^c
RControl & l::Send {Shift down}{LCtrl down}{vk54}{Shift Up}{LCtrl up}     ; +^t - restore tab in chrome
RControl & /::Send {LCtrl down}{vk57}{LCtrl up}     ; ^w  - close tab

+p::Send, ^c^t^v{Enter}

>^Space::Send {END}     ; space & n  - footer page
!Space::                  ; Launchy: application launch, toTop: to top page of browser
    Action := MultiPress("Launchy, toTop")
return
Launchy:
send !{Space}
return
toTop:
send, {HOME}
return

'::Send {LCtrl down}{Tab}{LCtrl up}
`;::Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}
LControl & vk4F::WinMaximize, A    ; ^o  - max window
RControl & vk4D::WinMinimize, A    ; ^m  - mix window
AppsKey::send {Space}
<^n::send N
<^p::send P
<^i::send {Up}
<^k::send {Down}
RControl & n::send {Down}
<^j::send {Left}
+j::send j
<^l::send {Right}
+l::send l
+m::send m
+i::          ; Speed 2X for YouTube
MouseClick, left,  1263,  738
Sleep, 800
MouseClick, left,  1236,  568
Sleep, 800
MouseClick, left,  1270,  667
Sleep, 200
MouseClick, left,  970,  667
Sleep, 200
MouseMove,  840,  540
Return

+k::          ; Speed 2X for YouTube(middle position button)
MouseClick, left,  1263,  738
Sleep, 800
MouseClick, left,  1226,  613
Sleep, 800
MouseClick, left,  1270,  667
Sleep, 200
MouseClick, left,  970,  667
Sleep, 200
MouseMove,  840,  540
Return

+<::          ; Speed 1X for YouTube
MouseClick, left,  1263,  738
Sleep, 800
MouseClick, left,  1236,  568
Sleep, 800
MouseClick, left,  1270,  516
Sleep, 200
MouseClick, left,  970,  667
Sleep, 200
MouseMove,  840,  540
Return

+>::          ; Speed 1.5X for YouTube
MouseClick, left,  1263,  738
Sleep, 800
MouseClick, left,  1236,  568
Sleep, 800
MouseClick, left,  1243,  616
Sleep, 200
MouseClick, left,  970,  667
Sleep, 200
MouseMove,  840,  540
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

#IfWinActive Macromedia Flash Player 8, 
RButton::
k::
MouseClick, left,  1141,  744
Sleep, 100
MouseClick, left,  665,  721
Sleep, 100
MouseClick, left,  692,  636
Sleep, 100
MouseClick, left,  1140,  744
Sleep, 100
MouseMove, 672, 334
Return

#IfWinActive

#IfWinActive ahk_class Chrome_WidgetWin_1
^vkBC::  ;^,
send ^{Left}
Return
#IfWinActive


#IfWinActive ahk_exe Lingvo.exe
>^h::send, ^{Home}
>^n::send, ^{End}
>^`;::send, !{Left}
>^'::send, !{Right}
>^j::send, !{Down}
;MouseClick, left, 349, 61
;Return
#IfWinActive


#F11::
Run, c:\Users\ADMIN\Favorites\Links\Google.url
    Action := MultiPress("trans", 25000)
return
trans:
    WinGetActiveTitle, ActiveWindow
    title = Random Word - Google Chrome
if InStr(ActiveWindow,title)
{
        Send, ^r
        Sleep, 7000
        Click 681, 400, 2
     ;   MsgBox, You have won!
}
return
