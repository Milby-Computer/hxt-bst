Script "stack_File_Attribs_button_id_1646"

/*
# Name: button "Default" of card "Media Picker" of stack "File Attribs"
# ID: button id 1646 of card id 1573 of stack "File Attribs"
# Hash: NfxMImDlOTUn+tzWr/GAIQ==
*/


on mouseUp
   local tResult
   iphonePickMedia true
   put the result into tResult
   play tResult
   set the text of field "VolumeField" of card "Media Picker" to playLoudness    
end mouseUp
