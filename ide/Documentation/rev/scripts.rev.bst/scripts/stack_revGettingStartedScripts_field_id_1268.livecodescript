Script "stack_revGettingStartedScripts_field_id_1268"

/*
# Name: field "Line Length" of bkgnd "Inserting line breaks to hard wrap text Example" of stack "revGettingStartedScripts"
# ID: field id 1268 of bkgnd id 1265 of stack "revGettingStartedScripts"
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
