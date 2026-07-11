Script "stack_revObjectLibrary_button_id_1080"

/*
# Name: button "Windows Hierarchical Field Widget" of card "Windows Standard Hierarchical Field Widget" of stack "revObjectLibrary"
# ID: button id 1080 of card id 1079 of stack "revObjectLibrary"
# Hash: T6Pg7iv4ixLFkCEv74iJoA==
*/


local lResult, lHilite

on mouseDown
  put the hilite of me into lHilite
  set the hilite of me to not the hilite of me
  hWithinCheck
end mouseDown

on mouseDoubleDown
  mouseDown
end mouseDoubleDown

on mouseUp
  cancel lResult
  set the hilite of me to not lHilite
end mouseUp

on mouseRelease
  cancel lResult
  if within(me,the mouseLoc) then set the hilite of me to not lHilite
  else set the hilite of me to lHilite
end mouseRelease

on hWithinCheck
  if within(me,the mouseLoc) then
    set the hilite of me to not lHilite
    if "hWithinCheck" is not in the pendingMessages then send "hWithinCheck" to me in 20 milliseconds
    put the result into lResult
  else
    set the hilite of me to lHilite
    if "hWithinCheck" is not in the pendingMessages then send "hWithinCheck" to me in 20 milliseconds
    put the result into lResult
  end if
end hWithinCheck
