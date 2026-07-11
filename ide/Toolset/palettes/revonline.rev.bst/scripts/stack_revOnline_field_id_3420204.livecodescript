Script "stack_revOnline_field_id_3420204"

/*
# Name: field "save" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3420204 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: SgSEfboYvC6RhZ4aJ0p6Qg==
*/


on mouseUp
   saveContentChanges
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "save" of the owner of me to 205418
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "save" of the owner of me to 205419
end mouseleave
