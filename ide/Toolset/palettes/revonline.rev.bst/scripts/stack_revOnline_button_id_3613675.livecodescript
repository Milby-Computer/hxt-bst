Script "stack_revOnline_button_id_3613675"

/*
# Name: button "cancel" of group "edit controls" of card "main" of stack "revOnline"
# ID: button id 3613675 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: wFN5CFKwZvmzwabYxpriOg==
*/


on mouseUp
   cancelChanges
end mouseUp

on mousemove
   set the textcolor of field "cancel" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "cancel" of the owner of me to empty
end mouseleave
