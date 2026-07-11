Script "stack_revOnline_image_id_4036504"

/*
# Name: image "user thumbnail" of group "Object 244" of group "search list" of card "main" of stack "revOnline"
# ID: image id 4036504 of group id 4036490 of group id 1691 of card id 1002 of stack "revOnline"
# Hash: kUaC465XXZkwJaRQ0nSkKg==
*/


on mouseUp
   local tUserId
   put the cUserId of the owner of me into tUserId
   lock screen
   put the cUserDisplayName of the owner of me into field "user filter" of group "search filter" of stack "revonline"
   --put the text of field "author" of the owner of me into field "user filter" of group "search filter" of this stack
   set the cSelectedUser of group "search filter" of this stack to tUserId
   unlock screen
   updateView "list","user",tUserId
end mouseUp
