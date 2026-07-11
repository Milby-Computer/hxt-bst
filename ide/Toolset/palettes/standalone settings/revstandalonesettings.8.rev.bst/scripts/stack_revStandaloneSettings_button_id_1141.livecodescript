Script "stack_revStandaloneSettings_button_id_1141"

/*
# Name: button "Choose..." of group "Windows" of card "Windows" of stack "revStandaloneSettings"
# ID: button id 1141 of group id 1169 of card id 1016 of stack "revStandaloneSettings"
# Hash: kPV28HCnnCqLOWfRLb6mFA==
*/


# OK-2007-07-09 : Bug 4592, Rewrote this as part of bug fix
on mouseUp
  local tIconFile
  put utilityChooseIconFile("Windows") into tIconFile
  
  if tIconFile is empty then
    exit mouseUp
  end if
  
  local tRelativeIconFile
  put utilityMakePathRelative(tIconFile, utilityTargetStackPath()) into tRelativeIconFile
  
  put tRelativeIconFile into field "documenticonFile"
  
  send "WINpropertyChanged" && the id of field "documenticonFile" to the owner of field "documenticonFile"
end mouseUp
