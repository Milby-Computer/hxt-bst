Script "stack_revOnline_button_id_3420206"

/*
# Name: button "no" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 3420206 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: wYEd7ZLmNYu5C5gjOKFoLw==
*/


on mouseUp
   hideAll
   showEditControls
end mouseUp

on mousemove
   set the textcolor of field "no" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "no" of the owner of me to empty
end mouseleave
