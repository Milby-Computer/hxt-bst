Script "stack_File_Attribs_button_id_1632"

/*
# Name: button "Audio Book" of card "Media Picker" of stack "File Attribs"
# ID: button id 1632 of card id 1573 of stack "File Attribs"
# Hash: VKdX6nP6+MTcd4IZVNM45A==
*/


on mouseUp
   local tRes
   iphonePickMedia "audioBook"
   put the result into tRes
   answer tRes with "Okay"
   play tRes
   set the text of field "VolumeField" of card "Media Picker" to playLoudness 
end mouseUp
