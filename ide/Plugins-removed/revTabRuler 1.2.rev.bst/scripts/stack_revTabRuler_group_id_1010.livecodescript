Script "stack_revTabRuler_group_id_1010"

/*
# Name: group "TabRuler" of card id 1002 of stack "revTabRuler"
# ID: group id 1010 of card id 1002 of stack "revTabRuler"
# Hash: cehjFEdFfLN90iw8clRQVg==
*/


global gTabruler
local lStoredTabs,lDeltaMouse

on mouseEnter
  set the cursor to arrow
  lock cursor

put empty into lDeltaMouse

  if the short name of the target is "TabMarker"
  then
    get item 1 of the loc of the target
    put it - the left of me into fld "ValLabel"
    set the loc of fld "ValLabel" to min(max(16,it),the width of this stack - 16),the top of group "TabRuler" - 8
    show fld "ValLabel"
  end if
end mouseEnter

on mouseLeave
  unlock cursor

  if the short name of the target is "TabMarker"
  then hide fld "ValLabel"
end mouseLeave

on mouseDown
  SetChanged true

  if the cGrid of this stack is "None"
  then
    CreateTabGraphic the mouseH
    send mouseEnter to last graphic of group "TabRuler"
    UpdateFieldTabs
  else
    get ClosestTab(the mouseH) + the left of me
    set the wholeMatches to true
    if itemOffset(it - the left of me,the tabStops of gTabruler["FldRef"]) is 0
    then
      set screenMouseLoc to globalLoc(it & "," & the mouseV)
      CreateTabGraphic it
      send mouseEnter to last graphic of group "TabRuler"
      UpdateFieldTabs
    else beep
  end if
end mouseDown

on MoveTab
  SetChanged true
 
  if lDeltaMouse is empty
  then
    put the mouseH - item 1 of the loc of the target into lDeltaMouse
   
    put the tabStops of gTabruler["FldRef"] into lStoredTabs
    set the wholeMatches to true
    delete item itemOffset(item 1 of the loc of the target - the left of me,lStoredTabs) of lStoredTabs
  end if
 
  if the cGrid of this stack is "None"
  then get min(max(1 + the left of me,(the mouseH - lDeltaMouse)),the right of me - 2) - the left of me
  else get min(max(ClosestTab(1),ClosestTab(the mouseH - lDeltaMouse)),ClosestTab(the right of me - 2))
 
  put it into fld "ValLabel"
  set the loc of fld "ValLabel" to min(max(16,it + the left of me),the width of this stack - 16),the top of group "TabRuler" - 8
  set the visible of fld "ValLabel" to (the mouseV < the bottom of group "TabRuler")
 
  set the wholeMatches to true

  if the mouseV < the bottom of group "TabRuler" \
      and itemOffset(it,lStoredTabs) is 0
  then
    set the backGroundColor of the target to the cBackColor of this stack
    set the loc of the target to it + the left of me,the top of group "TabRuler" + 3
  else
    set the backGroundColor of the target to red
    set the loc of the target to it + the left of me,the bottom of group "TabRuler" - 8
  end if
 
  UpdateFieldTabs

  set the vGrid of gTabruler["FldRef"] to (the tabStops of gTabruler["FldRef"] is not empty)
end MoveTab

on mouseRelease
  MoveEnd the short id of the target,(the backGroundColor of the target is red)
end mouseRelease

on mouseUp
  MoveEnd the short id of the target,(the backGroundColor of the target is red)
end mouseUp

on MoveEnd graphicID,needDelete
  --hide fld "ValLabel"

  put empty into lDeltaMouse

  if needDelete
  then delete graphic id graphicID

  --UpdateFieldTabs
end MoveEnd
