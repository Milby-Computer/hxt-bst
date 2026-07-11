Script "stack_revOnline_field_id_3021054"

/*
# Name: field "author" of group "template new 1" of card "templates" of stack "revOnline"
# ID: field id 3021054 of group id 3021051 of card id 157677 of stack "revOnline"
# Hash: s5lIYu7EvIGpk8xeYRBlAQ==
*/


on mouseUp
   local tUserId
   put the cUserId of the owner of me into tUserId
   lock screen
   put the cUserDisplayName of the owner of me into field "user filter" of group "search filter" of stack "revonline"
   --put the text of me into field "user filter" of group "search filter" of this stack
   set the cSelectedUser of group "search filter" of this stack to tUserId
   unlock screen
   updateView "list","user",tUserId
   --   updateSearchList 0, tUserId
end mouseUp

on mouseEnter
   set the textStyle of me to "underline"
end mouseEnter

on mouseMove
   set the textStyle of me to "underline"
end mouseMove

on mouseLeave
   set the textStyle of me to empty
end mouseLeave
