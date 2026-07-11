Script "stack_revSuppressMessages_button_id_1011"

/*
# Name: button "Delete" of card id 1002 of stack "revSuppressMessages" of stack "revMessageWatcher"
# ID: button id 1011 of card id 1002 of stack "revSuppressMessages" of stack "revMessageWatcher"
# Hash: d3nfpYpOOZd9eaaf322Qtw==
*/


on mouseUp
  get the hilitedLines of field "Suppressed Messages"
  if it is not empty
  then delete line it of field "Suppressed Messages"
end mouseUp
