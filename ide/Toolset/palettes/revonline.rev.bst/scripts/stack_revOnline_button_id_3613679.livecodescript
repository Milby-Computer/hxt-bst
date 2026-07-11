Script "stack_revOnline_button_id_3613679"

/*
# Name: button "update" of group "edit controls" of card "main" of stack "revOnline"
# ID: button id 3613679 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: SClbouGjgoIUnOJ0STQD4w==
*/


on mouseUp
   updateStack
end mouseUp

on mousemove
   set the textcolor of field "update" of the owner of me to rvoHiliteColor()
end mousemove

on mouseleave
   set the textcolor of field "update" of the owner of me to empty
end mouseleave
