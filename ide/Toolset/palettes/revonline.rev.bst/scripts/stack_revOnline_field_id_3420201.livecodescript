Script "stack_revOnline_field_id_3420201"

/*
# Name: field "cancel" of group "edit stack" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3420201 of group id 3420214 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: oWPqCByExhkoUpF71IlBxw==
*/


on mouseUp
   cancelContentChanges
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "cancel" of the owner of me to 205421
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "cancel" of the owner of me to 205422
end mouseleave
