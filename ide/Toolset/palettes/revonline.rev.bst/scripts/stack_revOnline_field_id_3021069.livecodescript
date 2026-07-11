Script "stack_revOnline_field_id_3021069"

/*
# Name: field "author" of group "template new 2" of card "templates" of stack "revOnline"
# ID: field id 3021069 of group id 3021066 of card id 157677 of stack "revOnline"
# Hash: RP1ERX9JED4Qdc6Pgumk/g==
*/


on mouseUp
   local tUserId
   put the cUserId of the owner of me into tUserId
   lock screen
   put the cUserDisplayName of the owner of me into field "user filter" of group "search filter" of stack "revonline"
   set the cSelectedUser of group "search filter" of this stack to tUserId
   unlock screen
   --updateView "list","user",tUserId
   # Need to send in 0 milliseconds because potentially this call will delete this group
   local tMode = "list"
   local tView = "user"
   send "updateView tMode, tView, tUserId" to stack "revonline" in 0 milliseconds
end mouseUp

on mouseEnter
   if the text of me is not empty then
      set the textStyle of me to "underline"
   end if
end mouseEnter

on mouseMove
   if the text of me is not empty then
      set the textStyle of me to "underline"
   end if
end mouseMove

on mouseLeave
   set the textStyle of me to empty
end mouseLeave
