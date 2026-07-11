Script "stack_revOnline_field_id_3414534"

/*
# Name: field "Edit profile" of group "edit profile" of group "user" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3414534 of group id 3414548 of group id 31884 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: mK8M2CAnjj+0XjFFI9Zy7Q==
*/


on mouseUp
   showEditControls
   editProfile
end mouseUp

on mouseEnter
   --set the textStyle of me to "underline"
   set the textColor of me to rvoHiliteColor()
end mouseEnter

on mouseMove
   --set the textStyle of me to "underline"
   set the textColor of me to rvoHiliteColor()
end mouseMove

on mouseLeave
   --set the textStyle of me to empty
   set the textColor of me to empty
end mouseLeave
