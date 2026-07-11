Script "stack_File_Attribs_button_id_1650"

/*
# Name: button "Pod Cast, Audio Book" of card "Media Picker" of stack "File Attribs"
# ID: button id 1650 of card id 1573 of stack "File Attribs"
# Hash: FWTmQt5vXa3/LZEM8+D1iA==
*/


on mouseUp
   local tRes
   iphonePickMedia "podCast", "audioBook"
   put the result into tRes
   answer tRes with "Okay"
   play tRes
   set the text of field "VolumeField" of card "Media Picker" to playLoudness 
end mouseUp
