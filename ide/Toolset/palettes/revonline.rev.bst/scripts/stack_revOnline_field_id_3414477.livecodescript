Script "stack_revOnline_field_id_3414477"

/*
# Name: field "save" of group "edit profile" of group "user" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3414477 of group id 3414548 of group id 31884 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: yFH6/HRfva6pPB3mQ1mwPw==
*/


on mouseUp
   setUserData
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "save" of the owner of me to 205418
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "save" of the owner of me to 205419
end mouseleave
