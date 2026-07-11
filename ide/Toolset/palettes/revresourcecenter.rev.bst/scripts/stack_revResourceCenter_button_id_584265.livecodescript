Script "stack_revResourceCenter_button_id_584265"

/*
# Name: button "Is OS X?" of group "Example" of group id 109171 of group "mainContent" of card "Findoutthecurrentplatformandsystemversion" of stack "revResourceCenter"
# ID: button id 584265 of group id 584264 of group id 109171 of group id 109172 of card id 109160 of stack "revResourceCenter"
# Hash: vUBpPECSPm9ORgsJe6NxpA==
*/


on mouseUp
   get isOSX()
   local myAnswer
  if it then put "is" into myAnswer else put "is not" into myAnswer
  answer "LiveCode" && myAnswer && "running on an OS X system." \
  & return & tab & "Platform:" && the platform \
  & return & tab & "System version:" && the systemVersion
end mouseUp

function isOSX
  set the itemDelimiter to "."
  -- system versions are of the form "x.y.z"
  if the platform is "MacOS" \
      and item 1 of the systemVersion >= 10 \
      then return true
  else return false
end isOSX
