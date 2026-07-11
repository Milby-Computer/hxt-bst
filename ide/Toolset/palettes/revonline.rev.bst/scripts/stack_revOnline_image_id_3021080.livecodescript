Script "stack_revOnline_image_id_3021080"

/*
# Name: image "type" of group "template new 2" of card "templates" of stack "revOnline"
# ID: image id 3021080 of group id 3021066 of card id 157677 of stack "revOnline"
# Hash: LomrmIU1mVuzFM5NOtRMhA==
*/


on mouseUp
   local tUserId
   put the cUserId of the owner of me into tUserId
   updateView "list","user",tUserId
end mouseUp
