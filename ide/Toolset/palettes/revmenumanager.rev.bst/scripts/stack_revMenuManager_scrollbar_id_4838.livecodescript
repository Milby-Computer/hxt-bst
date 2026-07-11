Script "stack_revMenuManager_scrollbar_id_4838"

/*
# Name: scrollbar "Menu Items" of bkgnd "Menu Items:" of stack "revMenuManager"
# ID: scrollbar id 4838 of bkgnd id 3226 of stack "revMenuManager"
# Hash: 3pZ7zfHpRRt9m197/EeZHQ==
*/


on scrollbarDrag pWhich
  global gREVTextHeight
  lock screen
  put round(pWhich/gREVTextHeight) into tTopLine
  put tTopLine * gREVTextHeight into tNewScroll
  if the scroll of fld "Menu Items" is not tNewScroll then
    set the scroll of fld "Menu Items" to tNewScroll
    revResetTriangles
    set the cREVLine of grp "Item Insert" to round(((item 2 of the loc of grp "Item Insert" - the top of fld "Menu Items")/gREVTextHeight) + (the scroll of fld "Menu Items"/gREVTextHeight))
  end if
  unlock screen
  pass scrollbarDrag
end scrollbarDrag
