; README
;{{{
/*
o------------------------------------------------------------o
|Using Keyboard Numpad as a Mouse                            |
(------------------------------------------------------------)
| By deguix           / A Script file for AutoHotkey 1.0.22+ |
|                    ----------------------------------------|
|                                                            |
|    This script is an example of use of AutoHotkey. It uses |
| the remapping of numpad keys of a keyboard to transform it |
| into a mouse. Some features are the acceleration which     |
| enables you to increase the mouse movement when holding    |
| a key for a long time, and the rotation which makes the    |
| numpad mouse to "turn". I.e. , as ,        |
| and vice-versa. See the list of keys used below:           |
|                                                            |
|------------------------------------------------------------|
| Keys                  | Description                        |
|------------------------------------------------------------|
| ScrollLock (toggle on)| Activates numpad mouse mode.       |
|-----------------------|------------------------------------|
| NumPad0               | Left mouse button click.           |
| k               | Middle mouse button click.         |
| RControl             | Right mouse button click.          |
| h/n  | X1/X2 mouse button click. (Win 2k+)|
| '/`;   | Moves up/down the mouse wheel.     |
|                       |                                    |
|-----------------------|------------------------------------|
| NumLock (toggled off) | Activates mouse movement mode.     |
|-----------------------|------------------------------------|
| m/Down/PgDn/  | Mouse movement.                    |
| /Left/Right/Home/Up/  |                                    |
| /PgUp                 |                                    |
|                       |                                    |
|-----------------------|------------------------------------|
| NumLock (toggled on)  | Activates mouse speed adj. mode.   |
|-----------------------|------------------------------------|
| NumPad7/NumPad1       | Inc./dec. acceleration per         |
|                       | button press.                      |
| NumPad8/NumPad2       | Inc./dec. initial speed per        |
|                       | button press.                      |
| NumPad9/NumPad3       | Inc./dec. maximum speed per        |
|                       | button press.                      |
| ^NumPad7/^NumPad1     | Inc./dec. wheel acceleration per   |
|                       | button press*.                     |
| ^NumPad8/^NumPad2     | Inc./dec. wheel initial speed per  |
|                       | button press*.                     |
| ^NumPad9/^NumPad3     | Inc./dec. wheel maximum speed per  |
|                       | button press*.                     |
| NumPad4/NumPad6       | Inc./dec. rotation angle to        |
|                       | right in degrees. (i.e. 180° =     |
|                       | = inversed controls).              |
|------------------------------------------------------------|
| * = These options are affected by the mouse wheel speed    |
| adjusted on Control Panel. If you don't have a mouse with  |
| wheel, the default is 3 +/- lines per option button press. |
o------------------------------------------------------------o
*/
;}}}

; CONFIG SECTION
;{{{

Process, Priority, , AboveNormal

;START OF CONFIG SECTION
#SingleInstance force
#MaxHotkeysPerInterval 500

; Using the keyboard hook to implement the Numpad hotkeys prevents
; them from interfering with the generation of ANSI characters such
; as à.  This is because AutoHotkey generates such characters
; by holding down ALT and sending a series of Numpad keystrokes.
; Hook hotkeys are smart enough to ignore such keystrokes.
#UseHook

MouseSpeed = 1
MouseAccelerationSpeed = 100  ;45  ;35
MouseMaxSpeed = 40  ;35   ;20

;Mouse wheel speed is also set on Control Panel. As that
;will affect the normal mouse behavior, the real speed of
;these three below are times the normal mouse wheel speed.
MouseWheelSpeed = 1
MouseWheelAccelerationSpeed = 1
MouseWheelMaxSpeed = 1

MouseRotationAngle = 0


;END OF CONFIG SECTION

;This is needed or key presses would faulty send their natural
;actions. Like h would send sometimes "`;" to the
;screen.
#InstallKeybdHook

Temp = 0
Temp2 = 0

MouseRotationAnglePart = %MouseRotationAngle%
;Divide by 45º because MouseMove only supports whole numbers,
;and changing the mouse rotation to a number lesser than 45º
;could make strange movements.
;
;For example: 22.5º when pressing i:
;  First it would move upwards until the speed
;  to the side reaches 1.
MouseRotationAnglePart /= 45

MouseCurrentAccelerationSpeed = 0
MouseCurrentSpeed = %MouseSpeed%

MouseWheelCurrentAccelerationSpeed = 0
MouseWheelCurrentSpeed = %MouseSpeed%
;}}}

; MODE 
;{{{

GroupAdd VimGroup
;GroupAdd, VimGroup, , , , Klavarog

;GroupAdd VimGroup, ahk_exe acad.exe
;GroupAdd VimGroup, ahk_exe chrome.exe
;GroupAdd VimGroup, ahk_exe sublime_text.exe
;GroupAdd AllWindons

; vim_verbose: 0 - no message; 1 - short message; 2 - full message
vim_verbose=0

VimMode=Mouse
Vim_g=0
Vim_n=0
VimLineCopy=0

;}}}

; HOTKEY
;{{{
btnLeftClick = *NumPad0
btnLeftClickIns = >^Space
btnLeftClickIns = >+Space
btnLeftClickIns = !Space
btnLeftClickIns = Space
btnMiddleClick = *k
btnMiddleClickClear = *NumpadClear
btnRightClick = *RControl
btnRightClickDel = *NumPadDel
btnX1Click = *`; 
btnX2Click = *'
btnWheelUp = *n
btnWheelDown = *h
btnUp = *i
btnDown = *`,
btnLeft = *j
btnRight = *l
btnUpLeft = *u
btnUpRight = *m
btnDownLeft = *o
btnDownRight = *.
btnSpeedUp = Numpad8
btnSpeedDown = Numpad2
btnAccelerationSpeedUp = Numpad7
btnAccelerationSpeedDown = Numpad1
btnMaxSpeedUp = Numpad9
btnMaxSpeedDown = Numpad3
btnRotationAngleUp = Numpad6
btnRotationAngleDown = Numpad4
btnWheelSpeedUp = !Numpad8
btnWheelSpeedDown = !Numpad2
btnWheelAccelerationSpeedUp = !Numpad7
btnWheelAccelerationSpeedDown = !Numpad1
btnWheelMaxSpeedUp = !Numpad9
btnWheelMaxSpeedDown = !Numpad3
SetKeyDelay, -1
SetMouseDelay, -1
 
Hotkey, %btnLeftClick%, ButtonLeftClick
Hotkey, %btnLeftClickIns%, ButtonLeftClickIns
Hotkey, %btnLeftClickIns%, ButtonLeftClickIns
Hotkey, %btnLeftClickIns%, ButtonLeftClickIns
Hotkey, %btnLeftClickIns%, ButtonLeftClickIns
Hotkey, %btnMiddleClick%, ButtonMiddleClick
Hotkey, %btnMiddleClickClear%, ButtonMiddleClickClear
Hotkey, %btnRightClick%, ButtonRightClick
Hotkey, %btnRightClickDel%, ButtonRightClickDel
Hotkey, %btnX1Click%, ButtonX1Click
Hotkey, %btnX2Click%, ButtonX2Click
 
Hotkey, %btnWheelUp%, ButtonWheelUp
Hotkey, %btnWheelDown%, ButtonWheelDown
 
Hotkey, %btnUp%, ButtonUp
Hotkey, %btnDown%, ButtonDown
Hotkey, %btnLeft%, ButtonLeft
Hotkey, %btnRight%, ButtonRight
Hotkey, %btnUpLeft%, ButtonUpLeft
Hotkey, %btnUpRight%, ButtonUpRight
Hotkey, %btnDownLeft%, ButtonDownLeft
Hotkey, %btnDownRight%, ButtonDownRight
 
Hotkey, %btnSpeedUp%, ButtonSpeedUp
Hotkey, %btnSpeedDown%, ButtonSpeedDown
Hotkey, %btnAccelerationSpeedUp%, ButtonAccelerationSpeedUp
Hotkey, %btnAccelerationSpeedDown%, ButtonAccelerationSpeedDown
Hotkey, %btnMaxSpeedUp%, ButtonMaxSpeedUp
Hotkey, %btnMaxSpeedDown%, ButtonMaxSpeedDown
 
Hotkey, %btnRotationAngleUp%, ButtonRotationAngleUp
Hotkey, %btnRotationAngleDown%, ButtonRotationAngleDown
 
Hotkey, %btnWheelSpeedUp%, ButtonWheelSpeedUp
Hotkey, %btnWheelSpeedDown%, ButtonWheelSpeedDown
Hotkey, %btnWheelAccelerationSpeedUp%, ButtonWheelAccelerationSpeedUp
Hotkey, %btnWheelAccelerationSpeedDown%, ButtonWheelAccelerationSpeedDown
Hotkey, %btnWheelMaxSpeedUp%, ButtonWheelMaxSpeedUp
Hotkey, %btnWheelMaxSpeedDown%, ButtonWheelMaxSpeedDown
;}}}

;TOOLTIP AND SUSPEND SCRIPT
;{{{
#Include, d:\KEYBOARD\ToolTip\ToolTipEx.ahk

HFONT := GetHFONT("s6", "Arial")
;ToolTipEx("M", 1300, 766, 2,HFONT, "Red", "Black",,"S")
ToolTipEx("M", 1300, 766, 2,HFONT, "Black", "White",,"S")
Suspend   ; Turn off on onload

return



~vkC0 & F3::ExitApp               ; ` & F3
>+>!r::Reload  ; Assign RShift-RAlt-R as a hotkey to restart the script.
sc152::                           ; insert
Suspend
;ToolTip % (A_IsSuspended) ? "S": Return , 1336, 757
If (A_IsSuspended)
{
HFONT := GetHFONT("s6", "Arial")
ToolTipEx("M", 1300, 766, 2,HFONT, "Black", "White",,"S")
}
else If (VimMode == "Mouse")
{
HFONT := GetHFONT("s6", "Arial")
ToolTipEx("M", 1300, 766, 2,HFONT, "Red", "Black",,"S")
}
else
{
HFONT := GetHFONT("s6", "Arial")
ToolTipEx("A", 1300, 766, 2,HFONT, "0x5dff09", "Black",,"S")
}
return

!sc152::send {Insert}                           ; !Insert - insert
;}}}

; SET MODE {{{
#IfWInActive, ahk_group VimGroup

VimSetMode(Mode="", g=0, n=0, LineCopy=-1) {
  global
  if(Mode!=""){
    VimMode=%Mode%
  }
  if (g != -1){
    Vim_g=%g%
  }
  if (n != -1){
    Vim_n=%n%
  }
  if (LineCopy!=-1) {
    VimLineCopy=%LineCopy%
  }
  VimCheckMode(vim_verbose,Mode,g,n,LineCopy)
  Return
}
VimCheckMode(verbose=0,Mode="", g=0, n=0, LineCopy=-1) {
  global
  if(verbose<1) or ((Mode=="" ) and (g==0) and (n==0) and (LineCopy==-1)) {
    Return
  }else if(verbose=1){
    TrayTip,VimMode,%VimMode%,1,, ; 1 sec is minimum for TrayTip
  }else if(verbose=2){
    TrayTip,VimMode,%VimMode%`r`ng=%Vim_g%`r`nn=%Vim_n%,1,,
  }
  if(verbose=3){
    Msgbox,
    (
    VimMode: %VimMode%
    Vim_g: %Vim_g%
    Vim_n: %Vim_n%
    VimLineCopy: %VimLineCopy%
    )
  }
  Return
}

;^!+sc1E::    ;sc1E key  - a
^!+a::    ;sc1E key  - a
  VimCheckMode(3,VimMode)
  Return
; }}}

; Enter vim normal mode {{{
#IfWInActive, (ahk_group VimGroup) && (VimMode == "Insert")
;+sc14:: ; Just send Esc at converting, long press for normal Esc.
+t:: ; Just send Esc at converting, long press for normal Esc.
  ;KeyWait, sc14, T0.5   ; sc14 key - t
  KeyWait, t, T0.5   ; sc14 key - t
  if (ErrorLevel){ ; long press
    Send,{Esc}
    Return
  }
  else {
    VimSetMode("Normal")
  }
  Return



/*
^[:: ; Go to Normal mode (for vim) with IME off even at converting.
  KeyWait, [, T0.5
  if (ErrorLevel){ ; long press to Esc
    Send,{Esc}
    Return
  }
*/


; }}}

; Toogle mode {{{

#If WInActive("ahk_group VimGroup")  && (VimMode =="Arrows")

y::
VimSetMode("Mouse")  ;q
HFONT := GetHFONT("s6", "Arial")
ToolTipEx("M", 1300, 766, 2,HFONT, "Red", "Black",,"S")
Return

#If WInActive("ahk_group VimGroup") && (VimMode=="Mouse")

y::
VimSetMode("Arrows")  ;t
HFONT := GetHFONT("s6", "Arial")
ToolTipEx("A", 1300, 766, 2,HFONT, "0x5dff09", "Black",,"S")
Return

;}}}

; MOUSE MODE 
;{{{
#If WInActive("ahk_group VimGroup") and (VimMode="Mouse")

;Mouse click support

ButtonLeftClick:
GetKeyState, already_down_state, LButton
If already_down_state = D
    return
Button2 = NumPad0
ButtonClick = Left
Goto ButtonClickStart
ButtonLeftClickIns:
GetKeyState, already_down_state, LButton
If already_down_state = D
    return
Button2 = Space
ButtonClick = Left
Goto ButtonClickStart

ButtonMiddleClick:
GetKeyState, already_down_state, MButton
If already_down_state = D
    return
Button2 =k
ButtonClick = Middle
Goto ButtonClickStart
ButtonMiddleClickClear:
GetKeyState, already_down_state, MButton
If already_down_state = D
    return
Button2 = NumpadClear
ButtonClick = Middle
Goto ButtonClickStart

ButtonRightClick:
GetKeyState, already_down_state, RButton
If already_down_state = D
    return
Button2 = RControl
ButtonClick = Right
Goto ButtonClickStart
ButtonRightClickDel:
GetKeyState, already_down_state, RButton
If already_down_state = D
    return
Button2 = NumPadDel
ButtonClick = Right
Goto ButtonClickStart

ButtonX1Click:
GetKeyState, already_down_state, XButton1
If already_down_state = D
    return
Button2 = h
ButtonClick = X1
Goto ButtonClickStart

ButtonX2Click:
GetKeyState, already_down_state, XButton2
If already_down_state = D
    return
Button2 = n
ButtonClick = X2
Goto ButtonClickStart

ButtonClickStart:
MouseClick, %ButtonClick%,,, 1, 0, D
SetTimer, ButtonClickEnd, 10
return

ButtonClickEnd:
GetKeyState, kclickstate, %Button2%, P
if kclickstate = D
    return

SetTimer, ButtonClickEnd, off
MouseClick, %ButtonClick%,,, 1, 0, U
return

;Mouse movement support

ButtonSpeedUp:
MouseSpeed++
ToolTip, Mouse speed: %MouseSpeed% pixels
SetTimer, RemoveToolTip, 1000
return
ButtonSpeedDown:
If MouseSpeed > 1
    MouseSpeed--
If MouseSpeed = 1
    ToolTip, Mouse speed: %MouseSpeed% pixel
else
    ToolTip, Mouse speed: %MouseSpeed% pixels
SetTimer, RemoveToolTip, 1000
return
ButtonAccelerationSpeedUp:
MouseAccelerationSpeed++
ToolTip, Mouse acceleration speed: %MouseAccelerationSpeed% pixels
SetTimer, RemoveToolTip, 1000
return
ButtonAccelerationSpeedDown:
If MouseAccelerationSpeed > 1
    MouseAccelerationSpeed--
If MouseAccelerationSpeed = 1
    ToolTip, Mouse acceleration speed: %MouseAccelerationSpeed% pixel
else
    ToolTip, Mouse acceleration speed: %MouseAccelerationSpeed% pixels
SetTimer, RemoveToolTip, 1000
return

ButtonMaxSpeedUp:
MouseMaxSpeed++
ToolTip, Mouse maximum speed: %MouseMaxSpeed% pixels
SetTimer, RemoveToolTip, 1000
return
ButtonMaxSpeedDown:
If MouseMaxSpeed > 1
    MouseMaxSpeed--
If MouseMaxSpeed = 1
    ToolTip, Mouse maximum speed: %MouseMaxSpeed% pixel
else
    ToolTip, Mouse maximum speed: %MouseMaxSpeed% pixels
SetTimer, RemoveToolTip, 1000
return

ButtonRotationAngleUp:
MouseRotationAnglePart++
If MouseRotationAnglePart >= 8
    MouseRotationAnglePart = 0
MouseRotationAngle = %MouseRotationAnglePart%
MouseRotationAngle *= 45
ToolTip, Mouse rotation angle: %MouseRotationAngle%°
SetTimer, RemoveToolTip, 1000
return
ButtonRotationAngleDown:
MouseRotationAnglePart--
If MouseRotationAnglePart < 0
    MouseRotationAnglePart = 7
MouseRotationAngle = %MouseRotationAnglePart%
MouseRotationAngle *= 45
ToolTip, Mouse rotation angle: %MouseRotationAngle%°
SetTimer, RemoveToolTip, 1000
return

ButtonUp:
ButtonDown:
ButtonLeft:
ButtonRight:
ButtonUpLeft:
ButtonUpRight:
ButtonDownLeft:
ButtonDownRight:
If Button <> 0
{
    IfNotInString, A_ThisHotkey, %Button%
    {
        MouseCurrentAccelerationSpeed = 0
        MouseCurrentSpeed = %MouseSpeed%
    }
}
StringReplace, Button, A_ThisHotkey, *

ButtonAccelerationStart:
If MouseAccelerationSpeed >= 1
{
    If MouseMaxSpeed > %MouseCurrentSpeed%
    {
        Temp = 0.001
        Temp *= %MouseAccelerationSpeed%
        MouseCurrentAccelerationSpeed += %Temp%
        MouseCurrentSpeed += %MouseCurrentAccelerationSpeed%
    }
}

;MouseRotationAngle convertion to speed of button direction
{
    MouseCurrentSpeedToDirection = %MouseRotationAngle%
    MouseCurrentSpeedToDirection /= 90.0
    Temp = %MouseCurrentSpeedToDirection%

    if Temp >= 0
    {
        if Temp < 1
        {
            MouseCurrentSpeedToDirection = 1
            MouseCurrentSpeedToDirection -= %Temp%
            Goto EndMouseCurrentSpeedToDirectionCalculation
        }
    }
    if Temp >= 1
    {
        if Temp < 2
        {
            MouseCurrentSpeedToDirection = 0
            Temp -= 1
            MouseCurrentSpeedToDirection -= %Temp%
            Goto EndMouseCurrentSpeedToDirectionCalculation
        }
    }
    if Temp >= 2
    {
        if Temp < 3
        {
            MouseCurrentSpeedToDirection = -1
            Temp -= 2
            MouseCurrentSpeedToDirection += %Temp%
            Goto EndMouseCurrentSpeedToDirectionCalculation
        }
    }
    if Temp >= 3
    {
        if Temp < 4
        {
            MouseCurrentSpeedToDirection = 0
            Temp -= 3
            MouseCurrentSpeedToDirection += %Temp%
            Goto EndMouseCurrentSpeedToDirectionCalculation
        }
    }
}
EndMouseCurrentSpeedToDirectionCalculation:

;MouseRotationAngle convertion to speed of 90 degrees to right
{
    MouseCurrentSpeedToSide = %MouseRotationAngle%
    MouseCurrentSpeedToSide /= 90.0
    Temp = %MouseCurrentSpeedToSide%
    Transform, Temp, mod, %Temp%, 4

    if Temp >= 0
    {
        if Temp < 1
        {
            MouseCurrentSpeedToSide = 0
            MouseCurrentSpeedToSide += %Temp%
            Goto EndMouseCurrentSpeedToSideCalculation
        }
    }
    if Temp >= 1
    {
        if Temp < 2
        {
            MouseCurrentSpeedToSide = 1
            Temp -= 1
            MouseCurrentSpeedToSide -= %Temp%
            Goto EndMouseCurrentSpeedToSideCalculation
        }
    }
    if Temp >= 2
    {
        if Temp < 3
        {
            MouseCurrentSpeedToSide = 0
            Temp -= 2
            MouseCurrentSpeedToSide -= %Temp%
            Goto EndMouseCurrentSpeedToSideCalculation
        }
    }
    if Temp >= 3
    {
        if Temp < 4
        {
            MouseCurrentSpeedToSide = -1
            Temp -= 3
            MouseCurrentSpeedToSide += %Temp%
            Goto EndMouseCurrentSpeedToSideCalculation
        }
    }
}
EndMouseCurrentSpeedToSideCalculation:

MouseCurrentSpeedToDirection *= %MouseCurrentSpeed%
MouseCurrentSpeedToSide *= %MouseCurrentSpeed%

Temp = %MouseRotationAnglePart%
Transform, Temp, Mod, %Temp%, 2

If Button = i
{
    if Temp = 1
    {
        MouseCurrentSpeedToSide *= 2
        MouseCurrentSpeedToDirection *= 2
    }

    MouseCurrentSpeedToDirection *= -1
    MouseMove, %MouseCurrentSpeedToSide%, %MouseCurrentSpeedToDirection%, 0, R
}
else if Button =,
{
    if Temp = 1
    {
        MouseCurrentSpeedToSide *= 2
        MouseCurrentSpeedToDirection *= 2
    }

    MouseCurrentSpeedToSide *= -1
    MouseMove, %MouseCurrentSpeedToSide%, %MouseCurrentSpeedToDirection%, 0, R
}
else if Button = j
{
    if Temp = 1
    {
        MouseCurrentSpeedToSide *= 2
        MouseCurrentSpeedToDirection *= 2
    }

    MouseCurrentSpeedToSide *= -1
    MouseCurrentSpeedToDirection *= -1

    MouseMove, %MouseCurrentSpeedToDirection%, %MouseCurrentSpeedToSide%, 0, R
}
else if Button = l
{
    if Temp = 1
    {
        MouseCurrentSpeedToSide *= 2
        MouseCurrentSpeedToDirection *= 2
    }

    MouseMove, %MouseCurrentSpeedToDirection%, %MouseCurrentSpeedToSide%, 0, R
}
else if Button = u
{
    Temp = %MouseCurrentSpeedToDirection%
    Temp -= %MouseCurrentSpeedToSide%
    Temp *= -1
    Temp2 = %MouseCurrentSpeedToDirection%
    Temp2 += %MouseCurrentSpeedToSide%
    Temp2 *= -1
    MouseMove, %Temp%, %Temp2%, 0, R
}
else if Button = o
{
    Temp = %MouseCurrentSpeedToDirection%
    Temp += %MouseCurrentSpeedToSide%
    Temp2 = %MouseCurrentSpeedToDirection%
    Temp2 -= %MouseCurrentSpeedToSide%
    Temp2 *= -1
    MouseMove, %Temp%, %Temp2%, 0, R
}
else if Button = m
{
    Temp = %MouseCurrentSpeedToDirection%
    Temp += %MouseCurrentSpeedToSide%
    Temp *= -1
    Temp2 = %MouseCurrentSpeedToDirection%
    Temp2 -= %MouseCurrentSpeedToSide%
    MouseMove, %Temp%, %Temp2%, 0, R
}
else if Button = .
{
    Temp = %MouseCurrentSpeedToDirection%
    Temp -= %MouseCurrentSpeedToSide%
    Temp2 *= -1
    Temp2 = %MouseCurrentSpeedToDirection%
    Temp2 += %MouseCurrentSpeedToSide%
    MouseMove, %Temp%, %Temp2%, 0, R
}

SetTimer, ButtonAccelerationEnd, 10
return

ButtonAccelerationEnd:
GetKeyState, kstate, %Button%, P
if kstate = D
    Goto ButtonAccelerationStart

SetTimer, ButtonAccelerationEnd, off
MouseCurrentAccelerationSpeed = 0
MouseCurrentSpeed = %MouseSpeed%
Button = 0
return

;Mouse wheel movement support

ButtonWheelSpeedUp:
MouseWheelSpeed++
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
MouseWheelSpeedReal = %MouseWheelSpeed%
MouseWheelSpeedReal *= %MouseWheelSpeedMultiplier%
ToolTip, Mouse wheel speed: %MouseWheelSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return
ButtonWheelSpeedDown:
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
If MouseWheelSpeedReal > %MouseWheelSpeedMultiplier%
{
    MouseWheelSpeed--
    MouseWheelSpeedReal = %MouseWheelSpeed%
    MouseWheelSpeedReal *= %MouseWheelSpeedMultiplier%
}
If MouseWheelSpeedReal = 1
    ToolTip, Mouse wheel speed: %MouseWheelSpeedReal% line
else
    ToolTip, Mouse wheel speed: %MouseWheelSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return

ButtonWheelAccelerationSpeedUp:
MouseWheelAccelerationSpeed++
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
MouseWheelAccelerationSpeedReal = %MouseWheelAccelerationSpeed%
MouseWheelAccelerationSpeedReal *= %MouseWheelSpeedMultiplier%
ToolTip, Mouse wheel acceleration speed: %MouseWheelAccelerationSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return
ButtonWheelAccelerationSpeedDown:
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
If MouseWheelAccelerationSpeed > 1
{
    MouseWheelAccelerationSpeed--
    MouseWheelAccelerationSpeedReal = %MouseWheelAccelerationSpeed%
    MouseWheelAccelerationSpeedReal *= %MouseWheelSpeedMultiplier%
}
If MouseWheelAccelerationSpeedReal = 1
    ToolTip, Mouse wheel acceleration speed: %MouseWheelAccelerationSpeedReal% line
else
    ToolTip, Mouse wheel acceleration speed: %MouseWheelAccelerationSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return

ButtonWheelMaxSpeedUp:
MouseWheelMaxSpeed++
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
MouseWheelMaxSpeedReal = %MouseWheelMaxSpeed%
MouseWheelMaxSpeedReal *= %MouseWheelSpeedMultiplier%
ToolTip, Mouse wheel maximum speed: %MouseWheelMaxSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return
ButtonWheelMaxSpeedDown:
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
If MouseWheelMaxSpeed > 1
{
    MouseWheelMaxSpeed--
    MouseWheelMaxSpeedReal = %MouseWheelMaxSpeed%
    MouseWheelMaxSpeedReal *= %MouseWheelSpeedMultiplier%
}
If MouseWheelMaxSpeedReal = 1
    ToolTip, Mouse wheel maximum speed: %MouseWheelMaxSpeedReal% line
else
    ToolTip, Mouse wheel maximum speed: %MouseWheelMaxSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return

ButtonWheelUp:
ButtonWheelDown:

If Button <> 0
{
    If Button <> %A_ThisHotkey%
    {
        MouseWheelCurrentAccelerationSpeed = 0
        MouseWheelCurrentSpeed = %MouseWheelSpeed%
    }
}
StringReplace, Button, A_ThisHotkey, *

ButtonWheelAccelerationStart:
If MouseWheelAccelerationSpeed >= 1
{
    If MouseWheelMaxSpeed > %MouseWheelCurrentSpeed%
    {
        Temp = 0.001
        Temp *= %MouseWheelAccelerationSpeed%
        MouseWheelCurrentAccelerationSpeed += %Temp%
        MouseWheelCurrentSpeed += %MouseWheelCurrentAccelerationSpeed%
    }
}

If Button =h
    MouseClick, wheelup,,, %MouseWheelCurrentSpeed%, 0, D
else if Button =n
    MouseClick, wheeldown,,, %MouseWheelCurrentSpeed%, 0, D

SetTimer, ButtonWheelAccelerationEnd, 100
return

ButtonWheelAccelerationEnd:
GetKeyState, kstate, %Button%, P
if kstate = D
    Goto ButtonWheelAccelerationStart

MouseWheelCurrentAccelerationSpeed = 0
MouseWheelCurrentSpeed = %MouseWheelSpeed%
Button = 0
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

#Include, d:\KEYBOARD\NumpadMouse\AddonsForNumpadMouse-Script.ahk

; Clean mode
#IfWinActive
;}}} Mouse

; ARROWS MODE 
;{{{
#If WInActive("ahk_group VimGroup") and (VimMode="Arrows")

#Include, d:\KEYBOARD\NumpadMouse\AddonsForArrowsMode.ahk

; Clean mode
#IfWinActive
;}}} Arrows
