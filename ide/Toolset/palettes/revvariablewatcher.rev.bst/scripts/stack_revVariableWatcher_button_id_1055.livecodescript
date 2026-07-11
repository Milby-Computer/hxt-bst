Script "stack_revVariableWatcher_button_id_1055"

/*
# Name: button "contentsArrayLine" of card "home" of stack "revVariableWatcher"
# ID: button id 1055 of card id 1002 of stack "revVariableWatcher"
# Hash: YIA7Bh74DUeA82WwUk1biQ==
*/


local dragging

on mouseDown
  put true into dragging
end mouseDown

on mouseMove x, y
  local tRect
  if dragging then
    set the left of me to min(max(x, the left of field "contentsArrayKey" + 24),the width of this cd - 48)
    
    put the rect of fld "contentsArrayKey" into tRect
    put the left of me + 3 into item 3 of tRect
    set the rect of fld "contentsArrayKey" to tRect
    
    put the rect of fld "contentsArrayValue" into tRect
    put the right of me - 3 into item 1 of tRect
    set the rect of fld "contentsArrayValue" to tRect
    --resizeStack
  end if
end mouseMove

on mouseUp
  put false into dragging
  resizeStack
end mouseUp

on mouseRelease
  put false into dragging
  resizeStack
end mouseRelease

on mouseEnter
  set cursor to 31
  lock cursor
end mouseEnter

on mouseLeave
  unlock cursor
end mouseLeave
