Script "stack_revOnline_button_id_3613677"

/*
# Name: button "save" of group "edit controls" of card "main" of stack "revOnline"
# ID: button id 3613677 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: vOFFE+iZXsZeJyAUu2p52Q==
*/


on mouseUp
  saveChanges
end mouseUp

on mousemove
   set the textcolor of field "save" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "save" of the owner of me to empty
end mouseleave
