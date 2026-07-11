Script "stack_revStandaloneSettings_button_id_1289"

/*
# Name: button "Choose..." of group "OSX" of card "OS X" of stack "revStandaloneSettings"
# ID: button id 1289 of group id 1221 of card id 1015 of stack "revStandaloneSettings"
# Hash: BIMzPGNah6a5y2eCTMj04g==
*/


# OK-2007-07-09 : Bug 4592
on mouseUp
  local tIconFile
  put utilityChooseIconFile("Mac OS X") into tIconFile
  if tIconFile is empty then
    exit mouseUp
  end if
  
  local tRelativeIconFile
  put utilityMakePathRelative(tIconFile, utilityTargetStackPath()) into tRelativeIconfile
  
  put tRelativeIconFile into field "documenticonFile"
  
  send "OSXpropertyChanged" && the id of field "documenticonFile" to the owner of field "documenticonFile"
end mouseUp
