Script "stack_File_Attribs_button_id_1661"

/*
# Name: button "Decrease Volume" of card "Media Picker" of stack "File Attribs"
# ID: button id 1661 of card id 1573 of stack "File Attribs"
# Hash: 03Tek1PmLwnIK+3sSJq4dQ==
*/


on mouseUp
   if playLoudness >= 10 then
      set the playLoudness to playLoudness - 10 
      set the text of field "VolumeField" of card "Media Picker" to playLoudness 
   end if
end mouseUp
