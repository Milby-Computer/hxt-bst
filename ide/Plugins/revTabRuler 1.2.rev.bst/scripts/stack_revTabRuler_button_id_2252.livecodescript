Script "stack_revTabRuler_button_id_2252"

/*
# Name: button "Grid" of card id 1002 of stack "revTabRuler"
# ID: button id 2252 of card id 1002 of stack "revTabRuler"
# Hash: oAobjHh4pGi3liMO5+gjtw==
*/


global gTabruler

on menuPick menuChoice
  if menuChoice is "Other..."
  then
    ask "Grid size (in pixels):" titled "TabRuler"
    if the result is "Cancel" then exit menuPick
    set the cGrid of this stack to it
  else set the cGrid of this stack to menuChoice
  
  UpdateGridMenu menuChoice
  
  if menuChoice is not "None"
  then
    SetChanged true
    
    get the tabStops of gTabruler["FldRef"]
     
    repeat with i=1 to number of items of it
      put ClosestTab(item i of it) into item i of it
    end repeat
    
    repeat with i=number of items of it down to 2
      if item i of it = item (i-1) of it
      then delete item i of it
    end repeat
    
    set the tabStops of gTabruler["FldRef"] to it
    DeleteAllMarkers
    CreateAllMarkers
  end if
end menuPick
