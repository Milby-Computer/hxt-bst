Script "stack_revSearch_button_id_1375"

/*
# Name: button "Name Resize" of card id 1002 of stack "revSearch"
# ID: button id 1375 of card id 1002 of stack "revSearch"
# Hash: AtwAbSPKO9ZJY65JGenKcg==
*/


local lMoving, lNameHorizontalDistance, lMaxRight

on mouseDown
  put true into lMoving
  put the right of btn "Name" - the mouseH into lNameHorizontalDistance
  put the left of sb "Results"+1 into lMaxRight
end mouseDown

on mouseUp
  put false into lMoving
  set the hilitedLines of fld "name" to the hilitedLines of fld "stack"
  set the scroll of fld "name" to the scroll of fld "stack"
end mouseUp

on mouseRelease
  put false into lMoving
  set the hilitedLines of fld "name" to the hilitedLines of fld "stack"
  set the scroll of fld "name" to the scroll of fld "stack"
end mouseRelease

on mouseMove x
  lock screen
  if lMoving then
    put x+lNameHorizontalDistance into tNameRight
    if tNameRight - the left of btn "Name" > the cREVMinWidth of btn "Name" and tNameRight <  lMaxRight then
      set the rect of btn "Name" to the topleft of btn "Name", tNameRight, the bottom of btn "Name"
      set the left of btn "Card" to the right of btn "Name"
      set the left of btn "Stack" to the right of btn "Card"
      set the right me to tNameRight
      set the right of btn "Card Resize" to the right of btn "Card"
      
      set the rect of fld "Name" to the topLeft of fld "Name", tNameRight, the bottom of fld "type"
      set the left of fld "Card" to the right of fld "Name"-2
      set the left of fld "Stack" to the right of fld "Card"-2
      if the right of fld "Stack" < lMaxRight
      then set the rect of fld "Stack" to the topLeft of fld "Stack", lMaxRight, the bottom of fld "Stack"
      set the hilitedLines of fld "name" to the hilitedLines of fld "stack"
      set the scroll of fld "name" to the scroll of fld "stack"
    end if
  end if
  unlock screen
end mouseMove

on mouseEnter
  set the cursor to 31
  lock cursor
end mouseEnter

on mouseLeave
  unlock cursor
end mouseLeave
