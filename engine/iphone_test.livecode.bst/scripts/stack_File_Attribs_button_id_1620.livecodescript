Script "stack_File_Attribs_button_id_1620"

/*
# Name: button "Music" of card "Media Picker" of stack "File Attribs"
# ID: button id 1620 of card id 1573 of stack "File Attribs"
# Hash: UHyNGgsnqkoZUtxsI/LBzw==
*/


on mouseUp
   local tRes, tLine
   iphonePickMedia true, "music"
   put the result into tRes
   repeat for each line tLine in tRes
      answer tLine with "Okay"
      play tLine
      set the text of field "VolumeField" of card "Media Picker" to playLoudness 
   end repeat   
end mouseUp
