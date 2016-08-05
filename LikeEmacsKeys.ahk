;;; On notapad simple enhancement (analog Emacs key bindings)
;;; Emacs you may find a lot of not so good button press, it is because Ctrl is located in the corner of the keyboard,
;;; The easiest solution is to approach the Ctrl key and CapsLK key exchange, there are many online and how to modify the registry in this exchange Two key ways ;;
;;; Ctrl + q to jump the line (default Emacs is Ctrl + a jump to the beginning of the line, but I will CapsLK with the Ctrl key after key exchange,
;;; Ctrl (original sensitive switch key) and a short distance, very good press, so I'll Ctrl + q is also bound to jump to the beginning of the line)
;;; Ctrl + a jump to the beginning of the line
;;; Ctrl + e to jump to the end of the line
;;; Ctrl + n to the next line
;;; Ctrl + p on line
;
;
;;; Ctrl + bacespace delete a word
;;; Alt + bacespace delete a word
;;; Alt + f forward a word
;;; Ctrl + m copy and paste the current row
;;; Ctrl + d Delete a character
;;; Ctrl + h to delete a character backward
;;; Ctrl + f move the cursor forward
;;; Ctrl + b to move the cursor backward
;;; Alt + s search
;
;;; Ctrl + w shear
;;; Alt + w Copy
;;; Ctrl + y paste
;;; Ctrl + to select the current word
;;; Ctrl + u delete the contents of the cursor to the beginning of the line (bash in bindings)
;;; Ctrl + k to delete the contents of the cursor to the end of the line, k is the abbreviation kill, cut in Emacs not called cut, called kill
;;; Ctrl + / undo
;;; Ctrl + j Enter (normal operation is Ctrl + e, Ctrl + j) Add the next line narrow
;;; Ctrl + o add a blank line above and move the cursor to a blank line (usually Ctrl + a, jump to the beginning of the line, then Ctrl + o)


^u::Send +{Home}{Del}
!d::Send ^+{Right}{Space}{BackSpace}   ;Delete forward word
^+a::send {Home}
^e::send {end}
^m::Send {Home}+{End}^c{End}{Enter}^v ; Duplicate the current line, like R #
^i::Send ^{Left}^+{Right} ; Select the current word
!i::Send {End}+{Home} ; Select the current string
RControl & w::Send ^+{Left}{Space}{BS}   ;Delete backward word
^d::Send {Del}   ;Delete char
RControl & /::Send ^z
^o::Send ^+{End}{BackSpace}   ; Delete forward current line

^p::send {Up}
Rcontrol & n::send {Down}
^f::Send {Right}
!f::Send ^{Right}
^b::Send {Left}
!b::Send ^{Left}
+!<::Send ^{Home}
+!>::Send ^{End}
!<::Send ^{Home}
!>::Send ^{End}

Rcontrol & h::Send {BackSpace}
return


>^Space::Send {END}     ; space & n  - footer page
!Space::                  ; Launchy: application launch, toTop: to top page of browser
    Action := MultiPress("Launchy_inputMode, toTop_inputMode")
return
Launchy_inputMode:
send !{Space}
return
toTop_inputMode:
send, {HOME}
return

