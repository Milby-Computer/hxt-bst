Script "stack_revGettingStartedScripts_field_id_1167"

/*
# Name: field "Example" of group "Limiting the number of characters during data entry Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1167 of group id 1166 of card id 1002 of stack "revGettingStartedScripts"
# Hash: DpkomuKH5wrKWud9UkzfCg==
*/


on keyDown theKey
  if the length of me >= 5 then beep
  else pass keyDown
end keyDown
