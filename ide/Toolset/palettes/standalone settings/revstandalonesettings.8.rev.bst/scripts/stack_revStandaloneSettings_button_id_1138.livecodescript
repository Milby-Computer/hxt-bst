Script "stack_revStandaloneSettings_button_id_1138"

/*
# Name: button "Choose..." of group "Windows" of card "Windows" of stack "revStandaloneSettings"
# ID: button id 1138 of group id 1169 of card id 1016 of stack "revStandaloneSettings"
# Hash: wgRiuJ9bbEEbBp4agLAC9Q==
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
  
  put tRelativeIconFile into field "iconFile"
  
  send "WINpropertyChanged" && the id of field "iconFile" to the owner of field "iconFile"
end mouseUp
