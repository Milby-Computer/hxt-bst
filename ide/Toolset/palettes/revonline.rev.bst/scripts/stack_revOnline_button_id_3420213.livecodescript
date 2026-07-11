Script "stack_revOnline_button_id_3420213"

/*
# Name: button "update" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 3420213 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: 01SPnzxawKLXJ7iSZMlcUg==
*/


on mouseUp
   showContentChooser "update"
end mouseUp

on mousemove
   set the textcolor of field "update" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "update" of the owner of me to empty
end mouseleave
