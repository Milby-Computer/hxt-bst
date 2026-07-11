Script "stack_revTabRuler"

/*
# Name: stack "revTabRuler"
# ID: stack "revTabRuler"
# Hash: z6K4uTfUzhzztVVtLCvUBA==
*/


constant kDeltaH=-3
global gTabruler,gCopiedRuler

on preOpenStack
  hide me
  if char 1 to 2 of the systemVersion is "10" and the LookAndFeel is "Appearance Manager"
  then set the backGroundColor of this stack to empty
  else set the backGroundColor of this stack to the cBackColor of this stack
  CheckForField
end preOpenStack

on closeStack
  CleanExit
  delete global gTabruler
  delete global gCopiedRuler
end closeStack

on revSelectedObjectChanged
  if the short name of the topStack is not "revTabRuler"
  then
    CheckForField
  end if
end revSelectedObjectChanged

on revResizeControl
  if gTabruler["FldRef"] is not empty
  then MoveRuler
end revResizeCOntrol

on revMoveControl
  if gTabruler["FldRef"] is not empty
  then MoveRuler
end revMoveControl

on CheckStackRect
  put false into needResize

  if the short name of the topStack is not "revTabRuler" and gTabruler["FldRef"] is not empty
  then
    if the rect of the topstack is not gTabruler["StackRect"]
    then
      put the rect of the topstack into gTabruler["StackRect"]
      put true into needResize
    end if

    if the width of me is not the width of gTabruler["FldRef"] + kDeltaH
    then put true into needResize

    if needResize then MoveRuler
  end if

  send CheckStackRect to me in 10 ticks
  put the result into gTabruler["CheckingMsgID"]
end CheckStackRect

on CheckForField
  hide me
  
  repeat for each line theObject in the selectedObject
    if word 1 of theObject is "field"
    then
      put theObject into theField
      exit repeat
    end if
  end repeat
  
  lock screen
  
  CleanExit
  
  if theField is not empty
  then
    put the rect of the topstack into gTabruler["StackRect"]
    put false into gTabruler["TabChanged"]
    put theField into gTabruler["FldRef"]
    put the vGrid of theField into gTabruler["VGridState"]
    if char 1 of revAppVersion() is "2"
    then put the borderColor of theField into gTabruler["VGridColor"]
    else put the hiliteColor of theField into gTabruler["VGridColor"]
    put the tabStops of theField into gTabruler["SavedTabs"]
    
    set the cGrid of this stack to "None"
    UpdateGridMenu "None"
    
    set the vGrid of theField to (the tabStops of gTabruler["FldRef"] is not empty)
    SetEditMenuItemEnabled "Clear all Tabs",(the tabStops of gTabruler["FldRef"] is not empty)
    if char 1 of revAppVersion() is "2"
    then set the borderColor of theField to the cBackColor of this stack
    else set the hiliteColor of theField to the cBackColor of this stack
    
    CreateAllMarkers
    MoveRuler
    show me
    CheckStackRect
  end if
end CheckForField

on MoveRuler
  if the vScrollBar of gTabruler["FldRef"]
  then put the scrollBarWidth of gTabruler["FldRef"] into scrollW
  else put 0 into scrollW
  get the left of gTabruler["FldRef"] + the left of the topStack

  set the rect of this stack to \
      it, \
      the top of gTabruler["FldRef"] - the height of this stack + the top of the topStack, \
      it + max(150,the width of gTabruler["FldRef"] - scrollW) + 2, \
      the top of gTabruler["FldRef"] + the top of the topStack

  RevUpdateGeometry
end MoveRuler

on CreateAllMarkers
  repeat for each item theTab in the tabStops of gTabruler["FldRef"]
    CreateTabGraphic the left of group "TabRuler" + theTab
  end repeat
end CreateAllMarkers

on CleanExit
  if gTabruler["FldRef"] is not empty
  then
    if gTabruler["TabChanged"] and not the hilite of btn "Auto"
    then
      beep
      answer question "Apply tab changes to field?" with "No" or "Yes" titled "TabRuler"
      if it is "No"
      then set the tabStops of gTabruler["FldRef"] to gTabruler["SavedTabs"]
    end if

    cancel gTabruler["CheckingMsgID"]
    set the vGrid of gTabruler["FldRef"] to gTabruler["VGridState"]
    if char 1 of revAppVersion() is "2"
    then set the borderColor of gTabruler["FldRef"] to gTabruler["VGridColor"]
    else set the hiliteColor of gTabruler["FldRef"] to gTabruler["VGridColor"]
    put empty into gTabruler
    SetEditMenuItemEnabled "Undo all changes",false
  end if

  DeleteAllMarkers
end CleanExit

on DeleteAllMarkers
  repeat number of graphics of group "TabRuler"
    delete graphic 1 of of group "TabRuler"
  end repeat

  if gTabruler["FldRef"] is not empty
  then
    set the vGrid of gTabruler["FldRef"] to false
    SetEditMenuItemEnabled "Clear all Tabs",false
  end if
end DeleteAllMarkers

on UpdateFieldTabs
  repeat with i=1 to number of graphics in group "TabRuler"
    if the backGroundColor of graphic i is the cBackColor of this stack
    then put (item 1 of the loc of graphic i) - (the left of group "TabRuler") & "," after temp
  end repeat

  sort items of temp numeric
  set the tabStops of gTabruler["FldRef"] to char 2 to -1 of temp
end UpdateFieldTabs

on CreateTabGraphic H
  set the angle of the templateGraphic to 90
  set the backgroundColor of the templateGraphic to the cBackColor of this stack
  set the lineSize of the templateGraphic to 1
  set the foregroundColor of the templateGraphic to black
  set the style of the templateGraphic to regular
  set the polySides of the templateGraphic to 3
  set the width of the templateGraphic to 16
  set the height of the templateGraphic to 16
  set the name of the templateGraphic to "TabMarker"
  set the script of the templateGraphic to "on mouseDown;end mouseDown;on mouseMove;if the mouse is down then MoveTab;end mouseMove"
  
  create invisible graphic in group "TabRuler"
  set the loc of last graphic of group "TabRuler" to H,the top of group "TabRuler" + 3
  show last graphic of group "TabRuler"
  set the vGrid of gTabruler["FldRef"] to true
  SetEditMenuItemEnabled "Clear all Tabs",true
end CreateTabGraphic

function ClosestTab theVal
  put (theVal div the cGrid of this stack) * the cGrid of this stack into minVal
  put ((theVal div the cGrid of this stack) + 1) * the cGrid of this stack into maxVal

  if minVal = 0 then add the cGrid of this stack to minVal
  if maxVal > the width of this stack then subtract the cGrid of this stack from maxVal

  if theVal - minVal < maxVal - theVal
  then return minVal
  else return maxVal
end ClosestTab

on UpdateGridMenu menuChoice
  repeat with i=1 to number of lines of btn "Grid"
    if char 1 to 2 of line i of btn "Grid" is "!c"
    then delete char 1 to 2 of line i of btn "Grid"
  end repeat
  put "!c" before line lineOffset(menuChoice,btn "Grid") of btn "Grid"
end UpdateGridMenu

on SetEditMenuItemEnabled theItem,theState
  if theState
  then enable menuItem lineOffset(theItem,btn "Edit") of btn "Edit"
  else disable menuItem lineOffset(theItem,btn "Edit") of btn "Edit"
end SetEditMenuItemEnabled

on SetChanged state
  put state into gTabruler["TabChanged"]
  SetEditMenuItemEnabled "Undo all changes",state
end SetChanged
