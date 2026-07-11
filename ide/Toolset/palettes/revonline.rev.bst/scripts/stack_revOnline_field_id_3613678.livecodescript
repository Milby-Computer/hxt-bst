Script "stack_revOnline_field_id_3613678"

/*
# Name: field "update" of group "edit controls" of card "main" of stack "revOnline"
# ID: field id 3613678 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: KmjJt6LB7KDeZ3ZBX4AiHQ==
*/


on mouseUp
   updateStack
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "update" of the owner of me to 205424
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "update" of the owner of me to 205425
end mouseleave
