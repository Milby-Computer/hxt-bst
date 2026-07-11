Script "stack_File_Attribs_button_id_1797"

/*
# Name: button "Set Volume" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1797 of card id 1782 of stack "File Attribs"
# Hash: pPZStEsMdVuH52Kmi0piZQ==
*/


on mouseUp
   mobileSetSoundChannelVolume the label of button "channel", the thumbpos of scrollbar "volume"
   if the result is not empty then
      put the result & return before field 1
   end if
end mouseUp
