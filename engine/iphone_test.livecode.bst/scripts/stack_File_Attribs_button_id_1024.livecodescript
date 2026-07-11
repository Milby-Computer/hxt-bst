Script "stack_File_Attribs_button_id_1024"

/*
# Name: button "Mail" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1024 of card id 1009 of stack "File Attribs"
# Hash: gpLAASw5Omchm8cxHHm6+g==
*/


on mouseUp
   revMail "kevin@runrev.com", "ben@runrev.com", "Could this be...", "... an email sent by Rev from an iPhone?"
   put the result into the last field
end mouseUp
