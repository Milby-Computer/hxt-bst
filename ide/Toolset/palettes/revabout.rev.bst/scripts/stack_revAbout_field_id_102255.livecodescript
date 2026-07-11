Script "stack_revAbout_field_id_102255"

/*
# Name: field "displayData" of card "card id 1002" of stack "revAbout"
# ID: field id 102255 of card id 1002 of stack "revAbout"
# Hash: SJeGm61wYcbaHXnA6//1YA==
*/


on mouseUp
   local tChunk, tClickWord
   
   put the clickChunk into tChunk
   put value(tChunk) into tClickWord
   
   set the textColor of char 1 to -1 of me to empty
   set the textColor of tChunk to aboutHiliteColor()
   
   loadText tClickWord
   send "revStartScroll" to field "Credits"
end mouseUp
