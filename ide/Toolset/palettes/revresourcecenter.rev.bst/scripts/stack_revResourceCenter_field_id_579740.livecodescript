Script "stack_revResourceCenter_field_id_579740"

/*
# Name: field "Find Example" of group "Example" of group id 584249 of group "mainContent" of card "TextSearchBox" of stack "revResourceCenter"
# ID: field id 579740 of group id 577017 of group id 584249 of group id 109202 of card id 109191 of stack "revResourceCenter"
# Hash: wtJMbCr/jsEGBSaTlCoqRw==
*/


on returnInField -- goes in Find field's script
  if me is empty then beep -- nothing to find
  else find the text of me -- "me" is the field
end returnInField
