Script "stack_revOnline_button_id_3420203"

/*
# Name: button "cancel" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 3420203 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: oPyfQEjgXM0p2u5LDklpbQ==
*/


on mouseUp
   cancelContentChanges
end mouseUp

on mousemove
   set the textcolor of field "cancel" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "cancel" of the owner of me to empty
end mouseleave
