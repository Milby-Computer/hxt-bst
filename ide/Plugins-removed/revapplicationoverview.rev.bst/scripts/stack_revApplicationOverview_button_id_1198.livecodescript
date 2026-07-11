Script "stack_revApplicationOverview_button_id_1198"

/*
# Name: button "Control tabs popup" of card "Cards and Controls" of stack "revApplicationOverview"
# ID: button id 1198 of card id 1002 of stack "revApplicationOverview"
# Hash: K92I43d7hEobET6lC2DJ3A==
*/


constant kTabs="Type,Visible,Selectable,Layer,Control,ID,Script Lines"

on menuPick pWhich
  lock screen
  if pWhich is "Reset Columns" then
    set the cControlTabs of grp "control tabs" to 1,2,3,4,5,7
  else
    put the cControlTabs of grp "control tabs" into tControlTabs
    put itemOffset(pWhich,kTabs) into tOffset
    if tOffset is not 0 then
      put itemOffset(tOffset,tControlTabs) into tItemOffset
      if tItemOffset is not 0
      then delete item tItemOffset of tControlTabs
      else put comma & tOffset after tControlTabs
    end if
    sort items of tControlTabs numeric
    set the cControlTabs of grp "control tabs" to tControlTabs
  end if
  revUpdateControlsField true
  put the cLastTab of grp "Control Tabs" into tTab
  set the rect of btn tTab of grp "Control Tabs" to the topLeft of btn tTab of grp "Control Tabs", \
      revLastTabRight(the long id of fld "Controls"), \
      the bottom of btn tTab of grp "Control Tabs"
  unlock screen   
end menuPick
