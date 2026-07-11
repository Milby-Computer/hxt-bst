Script "stack_File_Attribs_button_id_1648"

/*
# Name: button "Music, Audio Book" of card "Media Picker" of stack "File Attribs"
# ID: button id 1648 of card id 1573 of stack "File Attribs"
# Hash: ZdZnkz0Iq21Dzgaxz+x34w==
*/


on mouseUp
   local tRes
   iphonePickMedia "music", "audioBook"
   put the result into tRes
   answer tRes with "Okay"
   play tRes
   set the text of field "VolumeField" of card "Media Picker" to playLoudness 
end mouseUp
