Script "stack_revOnline_field_id_31861"

/*
# Name: field "Author" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 31861 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: W6odAW2xHEv5Sm5kMTIEVQ==
*/


on mouseUp
   local tUserEmail
   put the cAuthor of the owner of me into tUserEmail
   updateView "list", "user", tUserEmail
end mouseUp

on mousemove
   lock screen
   set the textStyle of me to empty
   if the mouseText is not empty then
      set the textStyle of me to "underline"
   end if
   unlock screen
end mousemove

on mouseleave
   --set the textcolor of me to rvoHiliteColor()
   set the textStyle of me to empty
end mouseleave
