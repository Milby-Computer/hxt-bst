Script "stack_Calculator_button_id_1020"

/*
# Name: button "Clear" of card "Calculator" of stack "Calculator"
# ID: button id 1020 of card id 1002 of stack "Calculator"
# Hash: aAbLXsidC4HAy+wIASz7Jg==
*/


on mouseUp
  -- set the custom property that stores the calculated result
  -- to empty
  set the runningTotal of this card to empty
  -- put 0 into the result field
  put zero into field "Result"
end mouseUp
