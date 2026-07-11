Script "stack_File_Attribs_button_id_1652"

/*
# Name: button "Any Audio" of card "Media Picker" of stack "File Attribs"
# ID: button id 1652 of card id 1573 of stack "File Attribs"
# Hash: dY5VpAc+EBl7SfN1M+LIzQ==
*/


on mouseUp
   local tRes
   iphonePickMedia "anyAudio"
   put the result into tRes
   answer tRes with "Okay"
   play tRes
   set the text of field "VolumeField" of card "Media Picker" to playLoudness 
end mouseUp
