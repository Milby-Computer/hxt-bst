Script "stack_revOnline_image_id_3021053"

/*
# Name: image "thumbnail" of group "template new 1" of card "templates" of stack "revOnline"
# ID: image id 3021053 of group id 3021051 of card id 157677 of stack "revOnline"
# Hash: +4KuDCMghgu57V7QC8xSlQ==
*/


on mouseUp
   local tStackId
   put the cStackId of the owner of me into tStackId
   --put tStackId
   updateView "list","stack",tStackId
end mouseUp
