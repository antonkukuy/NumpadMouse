;READMY
;{{{
    ; For more information please visit to:
    ; https://autohotkey.com/board/topic/82815-yet-another-hotkey-multiple-press-function/
/*
    Function: MultiPress(actionList = "", delay = 500)

A function to cleanly implement the response to more than one pressing of a hotkey.
A "clean" approach because:
    - only one static variable is maintained by the function
    - the function returns promptly because it does not manage the delay period
    - one timer subroutine in the calling script services all instances of use
    - the timer is transient and does not consume resources when not needed
    - coding for a given hotkey is compact and very readable
    
Limitation:
    - cannot "interlace" key presses, i.e. have one hotkey with a very long delay and then
    expect a second hotkey with a short delay to function in between presses of the first
    
How it works:
    - Invoke the function with a list of labels corresponding to all service routines for
    that particular hotkey.  This is just a comma separated list as a string in the order
    corresponding to number of presses (first position for 1 press, second position for
    2 presses and so on).
    - Default delay period to allow between key presses is 500 msec, but can be as long
    as you want.
    - Each press of the hotkey calls the function which counts the number of key
    presses of the same key honoring the delay period.  Exceeding the delay period between
    presses restarts the counter at 1.
    - The function returns the label that corresponds to the number of times the hotkey
    was pressed and at the same time starts a timer whose routine is in the main script.
    - The timer routine checks to make sure the label exists, calls that label and turns
    itself OFF.
    - Optionally, the action list can be empty in which case the function simply returns the
    number of hotkey presses made honoring the delay period.  The timer is not started.

    
Example 1:

This is the timer subroutine.  Its name must match the name in the function.  The variable
"Action" is the variable that is equated to the function call that will contain the label of
the routine to execute for that number of key presses. Place one instance of this in the
calling script.

Hotkey subroutines invoke the function passing a list of subroutine names corresponding
to the services for the number of key presses made inside of the delay period.  Note
the first parameter is a non-existing label that will do nothing.  In this example the
result is to render one press of F6 to do nothing but it will respond to 2, 3, & 4 presses.

    TakeAction:
        SetTimer, TakeAction, Off
        if (IsLabel(Action))
            Gosub, %Action%
    Return


    F6::
        Action := MultiPress("null, Manny, Moe, Jack")
    Return
        Manny:
            MsgBox, This is Manny!
        Return
        Moe:
            MsgBox, Moe here!
        Return
        Jack:
            MsgBox, Jack present and accounted for!
        Return

    
Example 2:

In this example the hotkey routine simply asks for the number of presses made that honor
a two second delay period and takes appropriate action on its own.  Note that this only
works when there is a single definition of N presses for the hotkey behavior.
Use the previous example when multiple behaviors are required for a given hotkey.

    F7::
    if (MultiPress("", 2000) = 3)
        Msgbox, holy keypresses Batman!
    Return

*/
;}}}


MultiPress(actionList = "", delay = 500)
{
    Static pressCount := 0

    pressCount := ( ((A_PriorHotKey = "") || (A_ThisHotKey = A_PriorHotKey))
                    && (A_TimeSincePriorHotkey < delay) ) ? (pressCount + 1) : (1)

    if (actionList = "")  ;this option flags to just return count to caller
        Return pressCount

    HFONT := GetHFONT("s10", "Arial")
    ToolTipEx(pressCount, , , 3,HFONT, "0x5dff09", "Black",,"S")
    ;Tooltip, %pressCount%
    SetTimer, TakeAction, % delay
    Loop, Parse, actionList, `,, %A_Space%
        if (A_Index = pressCount)
            Return A_LoopField

    Return False
}

TakeAction:
    SetTimer, TakeAction, Off
    ;Tooltip
    ToolTipEx("", , , 3,HFONT, "0x5dff09", "Black",,"S")
    if (IsLabel(Action))
        Gosub, %Action%
Return


