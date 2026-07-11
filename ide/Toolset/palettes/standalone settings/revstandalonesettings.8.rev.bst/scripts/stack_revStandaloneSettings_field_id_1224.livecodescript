Script "stack_revStandaloneSettings_field_id_1224"

/*
# Name: field "encrypt" of group "selectedStack" of group "Advanced Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: field id 1224 of group id 1261 of group id 2036 of card id 1013 of stack "revStandaloneSettings"
# Hash: HQlcLht8VnwWye9b3zYlwQ==
*/


on keyUp 
  if not (the hilite of btn "encrypt") then
    set the hilite of btn "encrypt" to true
    send "mouseUp" to btn "encrypt"
  end if
end keyUp

on keyDown
  if not the enabled of btn "encrypt" then exit keyDown
  else pass keyDown
end keyDown

on closeField
  local tStacks,tStack
  put the hilitedStacks of field "stacks" into tStacks
  repeat for each line tStack in tStacks
    set the cRevStandaloneSettings["password"] of stack tStack to me
    revSetEdit the mainstack of stack tStack
  end repeat
end closeField
