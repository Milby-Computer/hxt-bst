Script "stack_revGettingStartedScripts_field_id_1155"

/*
# Name: field "Margin" of group "Fitting a printout to the page Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1155 of group id 1152 of card id 1002 of stack "revGettingStartedScripts"
# Hash: sj+3e4vkiAfG9VflItPrlw==
*/


local savedNumber

on openField
  put me into savedNumber
end openField

on closeField
  if me is not a number and me is not empty then
    put savedNumber into me
    beep
    answer "This field must be a number."
    select text of me
  end if
end closeField
