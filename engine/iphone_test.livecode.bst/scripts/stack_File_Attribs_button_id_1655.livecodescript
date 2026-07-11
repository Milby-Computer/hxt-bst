Script "stack_File_Attribs_button_id_1655"

/*
# Name: button "Default" of card "Media Picker" of stack "File Attribs"
# ID: button id 1655 of card id 1573 of stack "File Attribs"
# Hash: b3QPgcDx5I4Zx7YFF7Hcsg==
*/


on mouseUp
   local tResult
   iphonePickMedia false
   put the result into tResult
   play tResult
   set the text of field "VolumeField" of card "Media Picker" to playLoudness 
end mouseUp
