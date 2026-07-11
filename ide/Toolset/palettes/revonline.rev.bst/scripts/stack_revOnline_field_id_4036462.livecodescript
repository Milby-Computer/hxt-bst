Script "stack_revOnline_field_id_4036462"

/*
# Name: field "title" of group "Object 243" of group "search list" of card "main" of stack "revOnline"
# ID: field id 4036462 of group id 4036460 of group id 1691 of card id 1002 of stack "revOnline"
# Hash: Sx+yCJtD7saUJNm1z53l9w==
*/


on mouseUp
   local tStackId
   put the cStackId of the owner of me into tStackId
   --updateView "list","stack",tStackId
   # Need to send in 0 milliseconds because potentially this call will delete this group
   local tMode = "list"
   local tView = "stack"
   send "updateView tMode, tView, tStackId" to stack "revonline" in 0 milliseconds
end mouseUp



on mouseEnter
   if the mousetext is not empty then
      set the textStyle of me to "underline, bold"
   end if
end mouseEnter

on mouseMove
   if the mousetext is not empty then
      set the textStyle of me to "underline, bold"
   end if
end mouseMove

on mouseLeave
   set the textStyle of me to "bold"
end mouseLeave
