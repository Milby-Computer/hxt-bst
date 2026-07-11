Script "stack_revOnline_field_id_3420210"

/*
# Name: field "delete" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3420210 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: k2UW8nWNmbkRkMzY6S+WWw==
*/


on mouseUp
   hideAll
   showDeleteControls
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "delete" of the owner of me to 205421
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "delete" of the owner of me to 205422
end mouseleave
