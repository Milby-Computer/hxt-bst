Script "stack_File_Attribs_button_id_1423"

/*
# Name: button "Arg Test" of card "Compose Mail" of stack "File Attribs"
# ID: button id 1423 of card id 1391 of stack "File Attribs"
# Hash: 2FTUJAqpTo/4IEbY7NBQRQ==
*/


on mouseUp
   iphoneComposeMail
   iphoneComposeMail "just subject"
   iphoneComposeMail "", "example@example.com"
   iphoneComposeMail "", "", "example@example.com"
   iphoneComposeMail "", "", "", "example@example.com"
   iphoneComposeMail "", "", "", "", "Just Body"
end mouseUp
