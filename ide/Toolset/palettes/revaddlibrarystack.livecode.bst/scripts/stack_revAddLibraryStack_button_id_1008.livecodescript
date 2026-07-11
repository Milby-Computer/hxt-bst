Script "stack_revAddLibraryStack_button_id_1008"

/*
# Name: button "OK" of card id 1002 of stack "revAddLibraryStack"
# ID: button id 1008 of card id 1002 of stack "revAddLibraryStack"
# Hash: BVO1apGsEOs2UbZTguT9cg==
*/


on mouseUp
  set the cREVResult of this stack to "OK"
  set the cREVStack of this stack to the label of btn "Stack"
  close this stack
end mouseUp
