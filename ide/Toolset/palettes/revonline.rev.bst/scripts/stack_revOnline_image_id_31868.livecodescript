Script "stack_revOnline_image_id_31868"

/*
# Name: image "profile image" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: image id 31868 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: UI1xn2dT9I7uSFVxs0rJYQ==
*/


on mousedown
   local tUserEmail
   put the cAuthor of the owner of me into tUserEmail
   updateView "list", "user", tUserEmail
end mousedown
   
   
