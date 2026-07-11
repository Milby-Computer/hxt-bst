Script "stack_revOnline_field_id_2953176"

/*
# Name: field "change password" of group "user" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 2953176 of group id 31884 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: P/b4eja2q3w5Wek2ZKPAdQ==
*/


on mouseUp
   revOnlineShowChangePasswordDialog
end mouseUp

on mousemove
   --set the textcolor of me to rvoHiliteColor()
   set the textStyle of me to "underline"
end mousemove

on mouseleave
   set the textStyle of me to empty
   --set the textcolor of me to empty
end mouseleave
