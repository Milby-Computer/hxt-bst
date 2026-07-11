Script "stack_revOnline_button_id_3614617"

/*
# Name: button "yes" of group "edit controls" of card "main" of stack "revOnline"
# ID: button id 3614617 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: VlGxZguaLptrlJKdxuDZJg==
*/


on mouseUp
   deleteStack
end mouseUp

on mousemove
   set the textcolor of field "yes" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "yes" of the owner of me to empty
end mouseleave
