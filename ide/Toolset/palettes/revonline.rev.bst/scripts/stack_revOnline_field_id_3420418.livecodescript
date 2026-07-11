Script "stack_revOnline_field_id_3420418"

/*
# Name: field "Edit Content" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3420418 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: MdreOHMUrAP7BrrvAIilcQ==
*/


on mouseUp
   showEditControls
   editDetails
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of me to empty
end mouseleave
