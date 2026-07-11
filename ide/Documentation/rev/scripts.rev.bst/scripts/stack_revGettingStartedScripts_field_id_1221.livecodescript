Script "stack_revGettingStartedScripts_field_id_1221"

/*
# Name: field "Example Number" of group "Rounding a number up to a ceiling Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1221 of group id 1219 of card id 1002 of stack "revGettingStartedScripts"
# Hash: wtJMbCr/jsEGBSaTlCoqRw==
*/


on returnInField -- goes in Find field's script
  if me is empty then beep -- nothing to find
  else find the text of me -- "me" is the field
end returnInField
