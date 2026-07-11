Script "stack_revResourceCenter_field_id_578795"

/*
# Name: field "Line Length" of group "Example" of group id 578797 of group "mainContent" of card "Insertinglinebreakstohardwraptext" of stack "revResourceCenter"
# ID: field id 578795 of group id 578792 of group id 578797 of group id 80450 of card id 80438 of stack "revResourceCenter"
# Hash: BlwkxUGNDgC9TGnGMxQnGQ==
*/


on keyDown theKey
  if theKey is not a number then beep
  else pass keyDown
end keyDown

on closeField
  if me is not an integer or me < 10 then
    beep
    put "20" into me
  end if
end closeField
