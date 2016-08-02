; #NoTrayIcon
; #SingleInstance Force
SetKeyDelay 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; On notapad simple enhancement (analog Emacs key bindings)
;; Emacs you may find a lot of not so good button press, it is because Ctrl is located in the corner of the keyboard,
;; The easiest solution is to approach the Ctrl key and CapsLK key exchange, there are many online and how to modify the registry in this exchange Two key ways ;;
;; Ctrl + q to jump the line (default Emacs is Ctrl + a jump to the beginning of the line, but I will CapsLK with the Ctrl key after key exchange,
;; Ctrl (original sensitive switch key) and a short distance, very good press, so I'll Ctrl + q is also bound to jump to the beginning of the line)
;; Ctrl + a jump to the beginning of the line
;; Ctrl + e to jump to the end of the line
;; Ctrl + n to the next line
;; Ctrl + p on line


;; Ctrl + bacespace delete a word
;; Alt + bacespace delete a word
;; Alt + f forward a word
;; Ctrl + m copy and paste the current row
;; Ctrl + d Delete a character
;; Ctrl + h to delete a character backward
;; Ctrl + f move the cursor forward
;; Ctrl + b to move the cursor backward
;; Alt + s search

;; Ctrl + w shear
;; Alt + w Copy
;; Ctrl + y paste
;; Ctrl + to select the current word
;; Ctrl + u delete the contents of the cursor to the beginning of the line (bash in bindings)
;; Ctrl + k to delete the contents of the cursor to the end of the line, k is the abbreviation kill, cut in Emacs not called cut, called kill
;; Ctrl + / undo
;; Ctrl + j Enter (normal operation is Ctrl + e, Ctrl + j) Add the next line narrow
;; Ctrl + o add a blank line above and move the cursor to a blank line (usually Ctrl + a, jump to the beginning of the line, then Ctrl + o)


#IfWinActive Ahk_class OpusApp
^ X :: return
^ BS :: Send ^ + {Left} {Del}
! BS :: Send ^ + {Left} {Del}
^ U :: Send + {Home} ^ c {Del}
^ K :: Send + {End} ^ c {Del}
! D :: Send ^ + {Right} ^ c {Del}
^ Q :: send {Home}
^ A :: send {Home}
^ E :: send {end}
^ M :: Send {Home} + {End} ^ c {End} {Enter} ^ v; Duplicate the current line, like R #
^ I :: Send ^ {Left} ^ + {Right}; Select the current word
! W :: Send ^ c
^ W :: Send ^ x
^ Y :: Send ^ v
^ D :: Send {Del}
^ / :: Send ^ z
^ J :: Send {Enter}
^ O :: Send {Enter} {Up}

^ P :: send {Up}
^ N :: send {Down}
^ F :: Send {Right}
! F :: Send ^ {Right}
^ B :: Send {Left}
! B :: Send ^ {Left}
+! <:: Send ^ {Home}
+!> :: Send ^ {End}
! <:: Send ^ {Home}
!> :: Send ^ {End}

! S :: Send ^ f
^ H :: Send {BackSpace}
return
#IfWinActive 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;

