Script "stack_revAbout_field_id_1033"

/*
# Name: field "Credits" of card "card id 1002" of stack "revAbout"
# ID: field id 1033 of card id 1002 of stack "revAbout"
# Hash: c/Bh5tTcJKm0PNenDps+0A==
*/


local lScroll, lCount,lMouseDown

on mouseEnter
  put "Double-click to pause" into fld "Pause"
end mouseEnter

on mouseLeave
  put empty into fld "Pause"
end mouseLeave

on mouseDoubleDown
  mouseDown
end mouseDoubleDown

on mouseDown
  put true into lMouseDown
end mouseDown

on mouseDoubleUp
  
end mouseDoubleUp

on mouseUp
  put false into lMousedown
end mouseUp

on mouseRelease
  put false into lMouseDown
  put empty into fld "Pause"
end mouseRelease

on revStartScroll
  put false into lMouseDown
  put empty into lCount
  put the formattedHeight of me - the height of me into lScroll
  send "revScroll" to me in 4 seconds
end revStartScroll

on revScroll
   if the mode of stack "revAbout" is 0 then exit revScroll
  if not lMouseDown then
    if lCount < lScroll then
      add 1 to lCount
      set the scroll of me to lCount
      if "revScroll" is not in the pendingMessages then
        send "revScroll" to me in 40 millisecs
      end if
    else
      send "revScrollBack" to me in 3 seconds
    end if
  else
    if "revScroll" is not in the pendingMessages then
      send "revScroll" to me in 40 millisec
    end if
  end if
end revScroll

on revScrollBack
  set the scroll of me to 1
  revStartScroll
end revScrollBack
