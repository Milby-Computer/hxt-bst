Script "stack_File_Attribs_button_id_1771"

/*
# Name: button "Can Send Text Message ?" of card "Text Messageing" of stack "File Attribs"
# ID: button id 1771 of card id 1769 of stack "File Attribs"
# Hash: TMyy3RHezgVEWSNx5ZrIjQ==
*/


on mouseUp
   if iphoneCanComposeTextMessage () is true then
      answer "Can send Text Messages" with "Okay"
   else
      answer "Cannot send Text Messages" with "Okay"
   end if 
end mouseUp
