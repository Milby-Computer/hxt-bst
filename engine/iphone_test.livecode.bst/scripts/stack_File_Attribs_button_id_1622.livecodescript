Script "stack_File_Attribs_button_id_1622"

/*
# Name: button "Pod Cast" of card "Media Picker" of stack "File Attribs"
# ID: button id 1622 of card id 1573 of stack "File Attribs"
# Hash: vEnDU3iF23MCyCw5F4oJug==
*/


on mouseUp
   local tRes, tLine
   iphonePickMedia true, "podCast"
   put the result into tRes
   repeat for each line tLine in tRes
      answer tLine with "Okay"
      play tLine
      set the text of field "VolumeField" of card "Media Picker" to playLoudness 
   end repeat
end mouseUp
