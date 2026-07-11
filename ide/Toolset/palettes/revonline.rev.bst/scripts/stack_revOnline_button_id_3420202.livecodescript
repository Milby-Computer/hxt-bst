Script "stack_revOnline_button_id_3420202"

/*
# Name: button "save" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 3420202 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: 72VRqK2kw5Z7H1tkRAhEyg==
*/


on mouseUp
   saveContentChanges
end mouseUp

on mousemove
   set the textcolor of field "save" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "save" of the owner of me to empty
end mouseleave
