Script "stack_revOnline_field_id_3021052"

/*
# Name: field "title" of group "template new 1" of card "templates" of stack "revOnline"
# ID: field id 3021052 of group id 3021051 of card id 157677 of stack "revOnline"
# Hash: nw6WAHu7oRniyvlmWFXq0Q==
*/


on mouseUp
   local tStackId
   put the cStackId of the owner of me into tStackId
   --put tStackId
   updateView "list","stack",tStackId
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
