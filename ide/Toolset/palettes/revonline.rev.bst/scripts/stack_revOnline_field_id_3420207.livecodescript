Script "stack_revOnline_field_id_3420207"

/*
# Name: field "Yes" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3420207 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: cGcijBi96AY4IcdpHob2IA==
*/


on mouseUp
   deleteStack
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "yes" of the owner of me to 205418
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "yes" of the owner of me to 205419
end mouseleave
