;;
;; Text Substitution Shortcuts
;;

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

;#region Text Entry Shorthands
::;ty::
Send Thank you for your time.{Enter 2}
return

::;bq::
Send <blockquote></blockquote>{Left 13}
return

::;p::
Send <p></p>{Left 4}
return
;#endregion Text Entry Shorthands