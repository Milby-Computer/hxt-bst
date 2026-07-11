Script "stack_revOnline_field_id_1702872"

/*
# Name: field "AddTag" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 1702872 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: ZeGLvBzndaOa3/rAyzKtVw==
*/


on mouseUp
   tagContent
end mouseUp

on mousemove
   set the textStyle of me to "underline"
   set the icon of button "tag" of the owner of me to 205424
end mousemove

on mouseleave
   --set the textcolor of me to rvoHiliteColor()
   set the textStyle of me to empty
   set the icon of button "tag" of the owner of me to 205425
end mouseleave
