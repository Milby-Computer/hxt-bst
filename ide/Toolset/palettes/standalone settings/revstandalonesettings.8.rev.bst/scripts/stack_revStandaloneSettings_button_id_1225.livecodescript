Script "stack_revStandaloneSettings_button_id_1225"

/*
# Name: button "destroyStack" of group "selectedStack" of group "Advanced Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: button id 1225 of group id 1261 of group id 2036 of card id 1013 of stack "revStandaloneSettings"
# Hash: 1RtfMAwa7xlhBtrbDF3f9A==
*/


on mouseUp
  local tStacks,tStack
  put the hilitedStacks of field "stacks" into tStacks
  repeat for each line tStack in tStacks
    set the cRevStandaloneSettings["destroyStack"] of stack tStack to the hilite of me
    revSetEdit the mainstack of stack tStack
  end repeat
  revSetEdit
end mouseUp
