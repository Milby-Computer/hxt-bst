Script "stack_File_Attribs_button_id_1644"

/*
# Name: button "Any Audio" of card "Media Picker" of stack "File Attribs"
# ID: button id 1644 of card id 1573 of stack "File Attribs"
# Hash: Dwod6kTrlkQqQtZVbtc+Wg==
*/


on mouseUp
   local tRes, tLine
   iphonePickMedia true, "anyAudio"
   put the result into tRes
   repeat for each line tLine in tRes
      answer tLine with "Okay"
      play tLine
      set the text of field "VolumeField" of card "Media Picker" to playLoudness 
   end repeat   
end mouseUp
