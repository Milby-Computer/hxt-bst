Script "stack_File_Attribs_button_id_1252"

/*
# Name: button "features rear" of card "Take Photo" of stack "File Attribs"
# ID: button id 1252 of card id 1240 of stack "File Attribs"
# Hash: GE4z/ZzHd3CKxtt2vNkp2g==
*/


on mouseUp
   iphoneCameraFeatures "rear"
   put the result into field "The_Result"
end mouseUp
