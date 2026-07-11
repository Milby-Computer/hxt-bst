Script "stack_com.livecode.pi.filelist_button_id_1017"

/*
# Name: button "add folder" of group "template" of card id 1002 of stack "com.livecode.pi.filelist"
# ID: button id 1017 of group id 1019 of card id 1002 of stack "com.livecode.pi.filelist"
# Hash: ZGhvzhA+VK//VPXqC/nYeQ==
*/


on mouseUp
   answer folder "Select a folder to add:"
   if it is empty then exit mouseUp
   dispatch "addEntry" with it
end mouseUp
