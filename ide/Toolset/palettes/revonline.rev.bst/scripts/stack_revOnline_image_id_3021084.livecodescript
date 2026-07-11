Script "stack_revOnline_image_id_3021084"

/*
# Name: image "user thumbnail" of group "template new 2" of card "templates" of stack "revOnline"
# ID: image id 3021084 of group id 3021066 of card id 157677 of stack "revOnline"
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
