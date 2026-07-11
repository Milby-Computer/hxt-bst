Script "stack_revObjectLibrary_button_id_1048"

/*
# Name: button "Grey Stack Height Flipper" of card "Grey Stack Height Flipper" of stack "revObjectLibrary"
# ID: button id 1048 of card id 1047 of stack "revObjectLibrary"
# Hash: HmHe2y/vmLkLWKANnugAtw==
*/


on mouseUp
  if the hilite of me then set the rect of this stack to the topLeft of this stack, the right of this stack, the top of this stack + the cContractedStackHeight of me 
  else set the rect of this stack to the topLeft of this stack, the right of this stack, the top of this stack + the cExpandedStackHeight of me
end mouseUp

on mouseDoubleUp
  mouseUp
end mouseDoubleUp
