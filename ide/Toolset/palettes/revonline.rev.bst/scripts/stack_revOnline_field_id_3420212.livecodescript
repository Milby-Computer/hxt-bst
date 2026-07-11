Script "stack_revOnline_field_id_3420212"

/*
# Name: field "update" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3420212 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: RIA9lrPWkOe3RTkzhDh+rQ==
*/


on mouseUp
   showContentChooser "update"
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "update" of the owner of me to 205424
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "update" of the owner of me to 205425
end mouseleave
