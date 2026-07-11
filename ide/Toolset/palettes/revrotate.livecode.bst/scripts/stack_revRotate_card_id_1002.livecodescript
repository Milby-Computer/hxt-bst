Script "stack_revRotate_card_id_1002"

/*
# Name: card id 1002 of stack "revRotate"
# ID: card id 1002 of stack "revRotate"
# Hash: xl11XLID9tR6fr+ow0oMBw==
*/


on preOpenStack
  set the cRotateGraphic of this stack to empty
end preOpenStack
  
on enterKey
  click at the loc of btn "OK"
end enterKey

on returnKey
  enterKey
end returnKey

on enterInField
  enterKey
end enterInField

on returnInField
  enterKey
end returnInField
