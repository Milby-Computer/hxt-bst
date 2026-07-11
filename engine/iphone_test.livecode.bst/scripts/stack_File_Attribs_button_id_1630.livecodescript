Script "stack_File_Attribs_button_id_1630"

/*
# Name: button "Pod Cast" of card "Media Picker" of stack "File Attribs"
# ID: button id 1630 of card id 1573 of stack "File Attribs"
# Hash: RbKc1MOBckcTsbe5Bp+TOw==
*/


on mouseUp
   local tRes
   iphonePickMedia "podCast"
   put the result into tRes
   answer tRes with "Okay"
   play tRes
   set the text of field "VolumeField" of card "Media Picker" to playLoudness 
end mouseUp
