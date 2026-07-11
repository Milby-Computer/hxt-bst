Script "stack_revOnline_field_id_2099027"

/*
# Name: field "type" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 2099027 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: i6v8vd3qY+mrdcIb3duIgw==
*/


on mouseUp
   set the cSelectedType of group "search filter" of this stack to the text of me
end mouseUp

on mousemove
   --set the textcolor of me to rvoHiliteColor()
   set the textStyle of me to "underline"
end mousemove

on mouseleave
   set the textcolor of me to rvoHiliteColor()
   set the textStyle of me to empty
end mouseleave
