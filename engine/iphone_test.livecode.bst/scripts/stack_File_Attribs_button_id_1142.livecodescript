Script "stack_File_Attribs_button_id_1142"

/*
# Name: button "Ask a Question" of card "Question Answer Password" of stack "File Attribs"
# ID: button id 1142 of card id 1138 of stack "File Attribs"
# Hash: v0qN3BkTY6ymaVEi8FCwpg==
*/


on mouseUp
   iphoneSetKeyboardType "numeric"
   ask question "What Time is it:" with "10:00" titled "Question Test"
   put it into field "Password" 
end mouseUp
