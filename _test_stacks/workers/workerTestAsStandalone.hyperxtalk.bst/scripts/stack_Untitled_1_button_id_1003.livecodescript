Script "stack_Untitled_1_button_id_1003"

/*
# Name: button "Button" of card id 1002 of stack "Untitled 1"
# ID: button id 1003 of card id 1002 of stack "Untitled 1"
# Hash: J+MdDV4bLnxA3KGJ1HcnLg==
*/


on MouseUp
   answer file "Select a file"
   if (the result = "Cancel") then exit MouseUp
   
   local tFile
   put it into tFile
   go stack tFile
   start using stack tFile
end MouseUp
