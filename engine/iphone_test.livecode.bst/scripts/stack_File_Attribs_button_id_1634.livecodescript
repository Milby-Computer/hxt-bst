Script "stack_File_Attribs_button_id_1634"

/*
# Name: button "Music, Pod Cast" of card "Media Picker" of stack "File Attribs"
# ID: button id 1634 of card id 1573 of stack "File Attribs"
# Hash: qcHRjNuT2ym5/FE9iD5O4A==
*/


on mouseUp
   local tRes
   iphonePickMedia "music","podCast"
   put the result into tRes
   answer tRes with "Okay"
   play tRes
   set the text of field "VolumeField" of card "Media Picker" to playLoudness 
end mouseUp
