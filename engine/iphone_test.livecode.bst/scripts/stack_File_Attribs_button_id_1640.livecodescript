Script "stack_File_Attribs_button_id_1640"

/*
# Name: button "Music, Audio Book" of card "Media Picker" of stack "File Attribs"
# ID: button id 1640 of card id 1573 of stack "File Attribs"
# Hash: zAtEvvJ3FKeEEjywdF2OSA==
*/


on mouseUp
   local tRes, tLine
   iphonePickMedia true, "music", "audioBook"
   put the result into tRes
   repeat for each line tLine in tRes
      answer tLine with "Okay"
      play tLine
      set the text of field "VolumeField" of card "Media Picker" to playLoudness 
   end repeat   
end mouseUp
