Script "stack_revOnline_image_id_2084024"

/*
# Name: image "type" of group "template original" of card "templates" of stack "revOnline"
# ID: image id 2084024 of group id 157898 of card id 157677 of stack "revOnline"
# Hash: LomrmIU1mVuzFM5NOtRMhA==
*/


on mouseUp
   local tUserId
   put the cUserId of the owner of me into tUserId
   updateView "list","user",tUserId
end mouseUp
