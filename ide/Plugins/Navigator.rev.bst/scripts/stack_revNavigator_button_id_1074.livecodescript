Script "stack_revNavigator_button_id_1074"

/*
# Name: button "Set" of group "commandControls" of group "commandGroup" of card "display" of stack "revNavigator"
# ID: button id 1074 of group id 1076 of group id 1100 of card id 1002 of stack "revNavigator"
# Hash: eqHY8CAJESHg+cV+Rtu9TA==
*/


global gSBThisStack

on mouseUp
  put the pWorkingLines of group "commandGroup" into tIDList
  put the long id of stack gSBThisStack into tSBThisStackID
  if tIDList is tSBThisStackID then  -- setting add props pref
    set the customPropertySet of stack gSBThisStack to "gSBAddPropsProp"
  end if
  set the itemDelimiter to "="
  put fld "command" into tCommandList
  repeat for each line tCommand in tCommandList
    if "=" is not in tCommand then
      if tProp is empty then next repeat
      put cr & tCommand after tVal
      next repeat
    end if
    if tProp is not empty then
      repeat for each line tID in tIDList
        set the tProp of tID to tVal
      end repeat
    end if
    put item 1 of tCommand into tProp
    put item 2 to -1 of tCommand into tVal
  end repeat
  -- gotta catch the last one:
  repeat for each line tID in tIDList
    set the tProp of tID to tVal
  end repeat
  
  
  if tIDList is tSBThisStackID then  -- setting add props pref
    set the customPropertySet of stack gSBThisStack to empty
  end if
end mouseUp
