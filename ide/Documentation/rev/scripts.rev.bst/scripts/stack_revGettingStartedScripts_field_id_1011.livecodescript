Script "stack_revGettingStartedScripts_field_id_1011"

/*
# Name: field "Find Example" of group "Text search box Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1011 of group id 1009 of card id 1002 of stack "revGettingStartedScripts"
# Hash: wtJMbCr/jsEGBSaTlCoqRw==
*/


on returnInField -- goes in Find field's script
  if me is empty then beep -- nothing to find
  else find the text of me -- "me" is the field
end returnInField
