Script "stack_revOnline_field_id_3613676"

/*
# Name: field "save" of group "edit controls" of card "main" of stack "revOnline"
# ID: field id 3613676 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: pgShXq5xjBCFZ0dZOsRTFg==
*/


on mouseUp
   saveChanges
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "save" of the owner of me to 205418
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "save" of the owner of me to 205419
end mouseleave
