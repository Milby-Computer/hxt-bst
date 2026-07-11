Script "stack_File_Attribs_button_id_1665"

/*
# Name: button "Stormy Weather" of card "Media Picker" of stack "File Attribs"
# ID: button id 1665 of card id 1573 of stack "File Attribs"
# Hash: 24WbwQVCPymJDSAKjRN8lA==
*/


on mouseUp
   local tFile
   put specialFolderPath("engine") & "/stormy_weather.mp3" into tFile
   if there is not a file tFile then
      answer "stormy_weather.mp3 does not exist" with "Okay"
   else
      play tFile
      set the text of field "VolumeField" of card "Media Picker" to playLoudness 
   end if
end mouseUp
