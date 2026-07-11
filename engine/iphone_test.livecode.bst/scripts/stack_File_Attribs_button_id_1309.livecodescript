Script "stack_File_Attribs_button_id_1309"

/*
# Name: button "Get Device ID" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1309 of card id 1009 of stack "File Attribs"
# Hash: BJ9qzM/fVn35A6DMZHQFpg==
*/


on mouseUp
   local tSystemIdentifier
   put iphoneSystemIdentifier () into tSystemIdentifier
      answer tSystemIdentifier with "OK" titled "The System Identifer"
end mouseUp
