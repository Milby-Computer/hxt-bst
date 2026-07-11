Script "stack_revGettingStartedScripts_field_id_1206"

/*
# Name: field "Digits Only" of group "Accepting only digit characters during data entry Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1206 of group id 1205 of card id 1002 of stack "revGettingStartedScripts"
# Hash: TVpJAwV0Q30nC6YfDRvSCQ==
*/


on keyDown theKey
  if theKey is not a number then beep
  else pass keyDown
end keyDown
