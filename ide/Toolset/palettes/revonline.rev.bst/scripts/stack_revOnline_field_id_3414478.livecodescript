Script "stack_revOnline_field_id_3414478"

/*
# Name: field "cancel" of group "edit profile" of group "user" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 3414478 of group id 3414548 of group id 31884 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: n/L0dUpcJQ/Kx+4B/tPs3g==
*/


on mouseUp
   hideEditControls
   discardChanges
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "cancel" of the owner of me to 205421
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "cancel" of the owner of me to 205422
end mouseleave
