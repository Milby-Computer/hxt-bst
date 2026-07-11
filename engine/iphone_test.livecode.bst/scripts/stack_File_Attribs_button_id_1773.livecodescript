Script "stack_File_Attribs_button_id_1773"

/*
# Name: button "Send Text Message" of card "Text Messageing" of stack "File Attribs"
# ID: button id 1773 of card id 1769 of stack "File Attribs"
# Hash: WfX1QoEr3IhloJwKq5PqSA==
*/


on mouseUp
   iphoneComposeTextMessage field theRecipients, field theBody
   answer the result with "Okay" 
end mouseUp
