Script "stack_revTabRuler_button_id_2255"

/*
# Name: button "Edit" of card id 1002 of stack "revTabRuler"
# ID: button id 2255 of card id 1002 of stack "revTabRuler"
# Hash: r6VV7iKLDajnW2ydy7l2QA==
*/


on menuPick what
  global gTabruler,gCopiedRuler
  
  lock screen
  
  switch what
  case "Undo all changes"
    SetChanged false
    set the tabStops of gTabruler["FldRef"] to gTabruler["SavedTabs"]

    DeleteAllMarkers
    CreateAllMarkers
    break
  case "Copy Ruler"
    SetEditMenuItemEnabled "Paste Ruler",true
    put the tabStops of gTabruler["FldRef"] into gCopiedRuler
    break
  case "Paste Ruler"
    SetChanged true
    DeleteAllMarkers
    set the tabStops of gTabruler["FldRef"] to gCopiedRuler
    CreateAllMarkers
    break
  case "Clear all Tabs"
    SetChanged true
    DeleteAllMarkers
    set the tabStops of gTabruler["FldRef"] to empty
    CreateAllMarkers
    break
  end switch
end menuPick
