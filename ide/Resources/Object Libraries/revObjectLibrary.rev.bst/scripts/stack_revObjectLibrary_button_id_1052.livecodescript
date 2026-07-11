Script "stack_revObjectLibrary_button_id_1052"

/*
# Name: button "Grey Stack Width Flipper" of card "Grey Stack Width Flipper" of stack "revObjectLibrary"
# ID: button id 1052 of card id 1051 of stack "revObjectLibrary"
# Hash: ost9u8W6YNEmKc/QfTaFoQ==
*/


on mouseUp
  if the hilite of me then set the rect of this stack to the topLeft of this stack, the left of this stack + the cContractedStackWidth of me, the bottom of this stack
  else set the rect of this stack to the topLeft of this stack, the left of this stack + the cExpandedStackWidth of me, the bottom of this stack
end mouseUp

on mouseDoubleUp
  mouseUp
end mouseDoubleUp
