Script "stack_revObjectLibrary_button_id_1050"

/*
# Name: button "Mac Stack Height Flipper" of card "MacOS Style Stack Height Flipper" of stack "revObjectLibrary"
# ID: button id 1050 of card id 1049 of stack "revObjectLibrary"
# Hash: HmHe2y/vmLkLWKANnugAtw==
*/


on mouseUp
  if the hilite of me then set the rect of this stack to the topLeft of this stack, the right of this stack, the top of this stack + the cContractedStackHeight of me 
  else set the rect of this stack to the topLeft of this stack, the right of this stack, the top of this stack + the cExpandedStackHeight of me
end mouseUp

on mouseDoubleUp
  mouseUp
end mouseDoubleUp
