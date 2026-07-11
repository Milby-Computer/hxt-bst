Script "stack_revOnline_field_id_3613674"

/*
# Name: field "cancel" of group "edit controls" of card "main" of stack "revOnline"
# ID: field id 3613674 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: 8xCIWVDub81sb4tPcruUEQ==
*/


on mouseUp
   cancelChanges
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "cancel" of the owner of me to 205421
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "cancel" of the owner of me to 205422
end mouseleave
