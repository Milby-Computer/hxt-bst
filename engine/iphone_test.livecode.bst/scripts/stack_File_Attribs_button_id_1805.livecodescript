Script "stack_File_Attribs_button_id_1805"

/*
# Name: button "Get Status" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1805 of card id 1782 of stack "File Attribs"
# Hash: D2vJmMUxSPiP7hbeaKq8+A==
*/


on mouseUp
   answer mobileSoundChannelStatus(the label of button "channel")
end mouseUp
