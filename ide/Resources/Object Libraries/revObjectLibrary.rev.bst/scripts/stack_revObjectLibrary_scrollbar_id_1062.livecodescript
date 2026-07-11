Script "stack_revObjectLibrary_scrollbar_id_1062"

/*
# Name: scrollbar "Scrollbar for Fields and Groups" of card "Scrolling Scrollbar" of stack "revObjectLibrary"
# ID: scrollbar id 1062 of card id 1061 of stack "revObjectLibrary"
# Hash: qDlU+KKy6yBVuXwPGXRLXA==
*/


on scrollBarDrag x
  if the cTargetType of me is "field" then
    put the formattedHeight of fld (the cTargetName of me) - the height of fld (the cTargetName of me) into tScrollDistance
    set the scroll of fld (the cTargetName of me) to round(((tScrollDistance/100) * x))
  else if the cTargetType of me is "group" then
    put the formattedHeight of grp (the cTargetName of me) - the height of grp (the cTargetName of me) into tScrollDistance
    set the scroll of grp (the cTargetName of me) to round(((tScrollDistance/100) * x))
  end if
end scrollBarDrag
