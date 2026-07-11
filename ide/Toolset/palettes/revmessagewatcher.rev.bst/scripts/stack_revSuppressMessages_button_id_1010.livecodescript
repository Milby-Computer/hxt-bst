Script "stack_revSuppressMessages_button_id_1010"

/*
# Name: button "Add..." of card id 1002 of stack "revSuppressMessages" of stack "revMessageWatcher"
# ID: button id 1010 of card id 1002 of stack "revSuppressMessages" of stack "revMessageWatcher"
# Hash: lS/lhbsqr+DGe0iGJYjnog==
*/


on mouseUp
  ask question "Message to add?"
  if it is not empty then
    if field "Suppressed Messages" is empty
    then put it into field "Suppressed Messages"
    else put cr & it after field "Suppressed Messages"
  end if
end mouseUp
