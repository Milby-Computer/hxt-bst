Script "stack_revStandaloneSettings_button_id_1223"

/*
# Name: button "encrypt" of group "selectedStack" of group "Advanced Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: button id 1223 of group id 1261 of group id 2036 of card id 1013 of stack "revStandaloneSettings"
# Hash: ClkLzxNNbDvgKm1BZY8WtA==
*/


on mouseUp
  local tStacks,tStack
  set the enabled of fld "encrypt" to the enabled of me
  put the hilitedStacks of field "stacks" into tStacks
  repeat for each line tStack in tStacks
    if the hilite of me then
      set the cRevStandaloneSettings["password"] of stack tStack to fld "encrypt"
    else
      set the cRevStandaloneSettings["password"] of stack tStack to ""
    end if
    revSetEdit the mainstack of stack tStack
  end repeat
end mouseUp
