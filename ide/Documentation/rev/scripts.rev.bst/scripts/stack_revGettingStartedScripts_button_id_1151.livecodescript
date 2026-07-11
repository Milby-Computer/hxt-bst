Script "stack_revGettingStartedScripts_button_id_1151"

/*
# Name: button "Is OS X?" of group "Find out the current platform and system version Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1151 of group id 1150 of card id 1002 of stack "revGettingStartedScripts"
# Hash: LZio8InAl6pahxsD4FpOnA==
*/


on mouseUp
  get isOSX()
  if it then put "is" into myAnswer else put "is not" into myAnswer
  answer "Revolution" && myAnswer && "running on an OS X system." \
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
