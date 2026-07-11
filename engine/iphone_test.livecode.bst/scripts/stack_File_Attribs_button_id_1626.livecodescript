Script "stack_File_Attribs_button_id_1626"

/*
# Name: button "Music, Pod Cast" of card "Media Picker" of stack "File Attribs"
# ID: button id 1626 of card id 1573 of stack "File Attribs"
# Hash: 5VOYQYp/u2fuRA0hdYP6FA==
*/


on mouseUp
   local tRes, tLine
   iphonePickMedia true, "music", "podCast"
   put the result into tRes
   repeat for each line tLine in tRes
      answer tLine with "Okay"
      play tLine
      set the text of field "VolumeField" of card "Media Picker" to playLoudness 
   end repeat   
end mouseUp
