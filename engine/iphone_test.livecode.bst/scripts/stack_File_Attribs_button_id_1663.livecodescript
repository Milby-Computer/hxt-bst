Script "stack_File_Attribs_button_id_1663"

/*
# Name: button "Increase Volume" of card "Media Picker" of stack "File Attribs"
# ID: button id 1663 of card id 1573 of stack "File Attribs"
# Hash: SqeWqsjxI3x/DbmaMffDvA==
*/


on mouseUp
   if playLoudness <= 90 then
      set the playLoudness to playLoudness + 10
      set the text of field "VolumeField" of card "Media Picker" to playLoudness 
   end if
end mouseUp
