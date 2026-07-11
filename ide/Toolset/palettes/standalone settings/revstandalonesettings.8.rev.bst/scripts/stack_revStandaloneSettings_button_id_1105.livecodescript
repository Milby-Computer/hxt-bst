Script "stack_revStandaloneSettings_button_id_1105"

/*
# Name: button "Choose..." of group "OSX" of card "OS X" of stack "revStandaloneSettings"
# ID: button id 1105 of group id 1221 of card id 1015 of stack "revStandaloneSettings"
# Hash: AsUs4YtiqheVDdipbDrSaw==
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
  
  put tRelativeIconFile into field "iconFile"
  
  send "OSXpropertyChanged" && the id of field "iconFile" to the owner of field "iconFile"
end mouseUp




