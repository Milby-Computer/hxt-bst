Script "stack_revOnline_field_id_3613680"

/*
# Name: field "delete" of group "edit controls" of card "main" of stack "revOnline"
# ID: field id 3613680 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: +NsjiZdAZx/iOH/exdMo6A==
*/


on mouseUp
   showDeleteConfirmation
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "delete" of the owner of me to 205421
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "delete" of the owner of me to 205422
end mouseleave
