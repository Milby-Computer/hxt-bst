Script "stack_revOnline_button_id_3420211"

/*
# Name: button "delete" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 3420211 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: bNPkFr9HfFbKFVs9ps4dmQ==
*/


on mouseUp
   hideAll
   showDeleteControls
end mouseUp

on mousemove
   set the textcolor of field "delete" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "delete" of the owner of me to empty
end mouseleave
