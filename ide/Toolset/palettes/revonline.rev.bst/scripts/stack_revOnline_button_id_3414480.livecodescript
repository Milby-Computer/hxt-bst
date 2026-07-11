Script "stack_revOnline_button_id_3414480"

/*
# Name: button "cancel" of group "edit profile" of group "user" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 3414480 of group id 3414548 of group id 31884 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: Jk7HFBFlUR3JMuRDQVrZsQ==
*/


on mouseUp
   hideEditControls
   discardChanges
end mouseUp

on mousemove
   set the textcolor of field "cancel" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "cancel" of the owner of me to empty
end mouseleave
