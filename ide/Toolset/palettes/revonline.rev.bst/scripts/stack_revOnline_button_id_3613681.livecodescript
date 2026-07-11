Script "stack_revOnline_button_id_3613681"

/*
# Name: button "delete" of group "edit controls" of card "main" of stack "revOnline"
# ID: button id 3613681 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: gpLdw2lT4W0/vu45C7Ibfg==
*/


on mouseUp
  showDeleteConfirmation
end mouseUp

on mousemove
   set the textcolor of field "delete" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "delete" of the owner of me to empty
end mouseleave
