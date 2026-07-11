Script "stack_Calculator_field_id_1026"

/*
# Name: field "Result" of card "Calculator" of stack "Calculator"
# ID: field id 1026 of card id 1002 of stack "Calculator"
# Hash: hppaEaGsU8VP8jF6z/AdcA==
*/


on enterInField
  -- activate the enterKey handler contained in the card script
  send "enterKey" to this card
end enterInField

on returnInField
  -- activate the enterInField handler above
  enterInField
end returnInField
