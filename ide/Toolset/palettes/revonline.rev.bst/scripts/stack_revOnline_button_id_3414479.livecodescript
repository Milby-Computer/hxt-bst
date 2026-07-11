Script "stack_revOnline_button_id_3414479"

/*
# Name: button "save" of group "edit profile" of group "user" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 3414479 of group id 3414548 of group id 31884 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: oEJTQ6ZryeVgaGSe6TrMdg==
*/


on mouseUp
   setUserData
end mouseUp

on mousemove
   set the textcolor of field "save" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "save" of the owner of me to empty
end mouseleave
