Script "stack_revSEFind_button_id_1032"

/*
# Name: button "Replace all" of card "Main" of stack "revSEFind" of stack "revNewScriptEditor"
# ID: button id 1032 of card id 1002 of stack "revSEFind" of stack "revNewScriptEditor"
# Hash: Q2kdaOzqFMCehWFROfmGeQ==
*/


on mouseUp
   if the label of me is "Cancel" then
      set the label of me to "Cancelling.."
      cancelOperation
      exit mouseUp
   end if
   
   set the label of me to "Cancel"
   lock cursor
   set the cursor to watch
   replaceAll
   unlock cursor
   set the label of me to empty
end mouseUp
