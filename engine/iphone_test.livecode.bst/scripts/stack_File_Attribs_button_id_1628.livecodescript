Script "stack_File_Attribs_button_id_1628"

/*
# Name: button "Music" of card "Media Picker" of stack "File Attribs"
# ID: button id 1628 of card id 1573 of stack "File Attribs"
# Hash: Fu5568INjQQNUwrMEelSVg==
*/


on mouseUp
   local tRes
   iphonePickMedia "music"
   put the result into tRes
   answer tRes with "Okay"
   play tRes
   set the text of field "VolumeField" of card "Media Picker" to playLoudness 
end mouseUp
