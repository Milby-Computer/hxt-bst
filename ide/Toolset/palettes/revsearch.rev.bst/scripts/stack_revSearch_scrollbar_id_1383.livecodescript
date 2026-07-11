Script "stack_revSearch_scrollbar_id_1383"

/*
# Name: scrollbar "Results" of card id 1002 of stack "revSearch"
# ID: scrollbar id 1383 of card id 1002 of stack "revSearch"
# Hash: XFeBm1/sIR96Ml9gP8SAlA==
*/


on scrollbarDrag x
  if "hSelectionUpdate" is in the pendingMessages then
    cancel (item 1 of line lineOffset("hSelectionUpdate",the pendingMessages) of the pendingMessages)
  end if
  lock messages
  set the scroll of fld "stack" to x
  set the scroll of fld "type" to x
  set the scroll of fld "card" to x
  set the scroll of fld "name" to x
  unlock messages
end scrollbarDrag
