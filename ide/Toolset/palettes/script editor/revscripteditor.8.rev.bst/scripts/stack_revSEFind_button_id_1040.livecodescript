Script "stack_revSEFind_button_id_1040"

/*
# Name: button "Find all" of card "Main" of stack "revSEFind" of stack "revNewScriptEditor"
# ID: button id 1040 of card id 1002 of stack "revSEFind" of stack "revNewScriptEditor"
# Hash: pgv12kho26DHzXgAP1No5g==
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
   findAll
   unlock cursor
   set the label of me to empty
end mouseUp
