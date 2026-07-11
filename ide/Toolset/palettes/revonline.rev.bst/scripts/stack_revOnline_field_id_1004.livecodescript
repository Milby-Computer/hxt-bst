Script "stack_revOnline_field_id_1004"

/*
# Name: field "types" of group "search filter" of card "main" of stack "revOnline"
# ID: field id 1004 of group id 1007 of card id 1002 of stack "revOnline"
# Hash: Mu9HrWs4zEIeVl1pSM/2WQ==
*/


on mouseUp
   local tLine
   put word 2 of the mouseLine into tLine
   if the mousetext is not empty then
      set the cSelectedType of the long owner of me to line tLine of the text of me
   end if
end mouseUp

on mouseMove
   local tLine
   get the mouseLine
   put word 2 of it into tLine
   hiliteHoverText tLine, (the long id of me)
end mouseMove

on mouseLeave
   clearColors (the long id of me)
end mouseLeave
