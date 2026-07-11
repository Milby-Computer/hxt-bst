Script "stack_revOnline_image_id_2030656"

/*
# Name: image "thumbnail" of card "templates" of stack "revOnline"
# ID: image id 2030656 of card id 157677 of stack "revOnline"
# Hash: n3fPTJcy1+1AS/bf4aOvmw==
*/


on mousedown
   local tStackId
   put the cStackId of the owner of me into tStackId
   --put tStackId
   updateView "list","stack",tStackId
end mousedown
