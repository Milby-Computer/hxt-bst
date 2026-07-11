Script "stack_revOnline_image_id_4036491"

/*
# Name: image "thumbnail" of group "Object 244" of group "search list" of card "main" of stack "revOnline"
# ID: image id 4036491 of group id 4036490 of group id 1691 of card id 1002 of stack "revOnline"
# Hash: 6nICQzIYK1HmW5ld2G3Pyw==
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
