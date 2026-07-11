Script "stack_revOnline_image_id_3113673"

/*
# Name: image "user image thumbnail" of group "image importer" of card "templates" of stack "revOnline"
# ID: image id 3113673 of group id 3107893 of card id 157677 of stack "revOnline"
# Hash: UI1xn2dT9I7uSFVxs0rJYQ==
*/


on mousedown
   local tUserEmail
   put the cAuthor of the owner of me into tUserEmail
   updateView "list", "user", tUserEmail
end mousedown
   
   
