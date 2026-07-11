Script "stack_File_Attribs_button_id_1796"

/*
# Name: button "Get Volume" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1796 of card id 1782 of stack "File Attribs"
# Hash: wOotgfZumWKca7R/cBjWbw==
*/


on mouseUp
   answer mobileSoundChannelVolume(the label of button "channel")
end mouseUp
