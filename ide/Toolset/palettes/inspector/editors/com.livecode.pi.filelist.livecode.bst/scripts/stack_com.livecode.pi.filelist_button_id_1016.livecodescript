Script "stack_com.livecode.pi.filelist_button_id_1016"

/*
# Name: button "add file" of group "template" of card id 1002 of stack "com.livecode.pi.filelist"
# ID: button id 1016 of group id 1019 of card id 1002 of stack "com.livecode.pi.filelist"
# Hash: LQ2/z4e4kGalgH7UzRqJ+w==
*/


on mouseUp
   answer file "Select a file to add"
   if it is empty then exit mouseUp
   dispatch "addEntry" with it
end mouseUp
