Script "stack_revOnline_image_id_4036503"

/*
# Name: image "type" of group "Object 244" of group "search list" of card "main" of stack "revOnline"
# ID: image id 4036503 of group id 4036490 of group id 1691 of card id 1002 of stack "revOnline"
# Hash: LomrmIU1mVuzFM5NOtRMhA==
*/


on mouseUp
   local tUserId
   put the cUserId of the owner of me into tUserId
   updateView "list","user",tUserId
end mouseUp
