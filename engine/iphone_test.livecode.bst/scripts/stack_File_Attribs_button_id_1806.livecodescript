Script "stack_File_Attribs_button_id_1806"

/*
# Name: button "Get Next Sound" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1806 of card id 1782 of stack "File Attribs"
# Hash: gldelkkAP6WJhn8b2iT+BA==
*/


on mouseUp
   answer mobileNextSoundOnChannel(the label of button "channel")
end mouseUp
