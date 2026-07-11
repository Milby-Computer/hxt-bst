Script "stack_revOnline_field_id_3614613"

/*
# Name: field "no" of group "edit controls" of card "main" of stack "revOnline"
# ID: field id 3614613 of group id 3610310 of card id 1002 of stack "revOnline"
# Hash: gg18HjxaRbA3p5kFIec89Q==
*/


on mouseUp
   hideAll
   showEditControls
end mouseUp

on mousemove
   set the textcolor of me to rvoHiliteColor()
   set the icon of button "no" of the owner of me to 205421
end mousemove

on mouseleave
   set the textcolor of me to empty
   set the icon of button "no" of the owner of me to 205422
end mouseleave
