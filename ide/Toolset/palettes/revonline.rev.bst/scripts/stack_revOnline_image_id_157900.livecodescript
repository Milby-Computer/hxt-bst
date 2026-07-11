Script "stack_revOnline_image_id_157900"

/*
# Name: image "thumbnail" of group "template original" of card "templates" of stack "revOnline"
# ID: image id 157900 of group id 157898 of card id 157677 of stack "revOnline"
# Hash: +4KuDCMghgu57V7QC8xSlQ==
*/


on mouseUp
   local tStackId
   put the cStackId of the owner of me into tStackId
   --put tStackId
   updateView "list","stack",tStackId
end mouseUp
