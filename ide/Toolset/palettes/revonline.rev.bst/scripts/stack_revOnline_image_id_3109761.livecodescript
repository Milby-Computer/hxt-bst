Script "stack_revOnline_image_id_3109761"

/*
# Name: image "stack image thumbnail" of group "image importer" of card "templates" of stack "revOnline"
# ID: image id 3109761 of group id 3107893 of card id 157677 of stack "revOnline"
# Hash: +4KuDCMghgu57V7QC8xSlQ==
*/


on mouseUp
   local tStackId
   put the cStackId of the owner of me into tStackId
   --put tStackId
   updateView "list","stack",tStackId
end mouseUp
