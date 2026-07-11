Script "stack_revSETemplate_button_id_1035"

/*
# Name: button "Handlers" of group "Toolbar" of card "Main" of stack "revSETemplate" of stack "revNewScriptEditor"
# ID: button id 1035 of group id 1021 of card id 1002 of stack "revSETemplate" of stack "revNewScriptEditor"
# Hash: 4k52NLzn/aRouOcITfoWeA==
*/


on mouseUp
   if seHandlerListIsShowing() then
      seHideHandlerList
   else
      seShowHandlerList
   end if
end mouseUp
