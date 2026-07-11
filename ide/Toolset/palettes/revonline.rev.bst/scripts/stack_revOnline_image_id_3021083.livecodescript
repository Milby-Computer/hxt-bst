Script "stack_revOnline_image_id_3021083"

/*
# Name: image "thumbnail" of group "template new 2" of card "templates" of stack "revOnline"
# ID: image id 3021083 of group id 3021066 of card id 157677 of stack "revOnline"
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
