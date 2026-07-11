Script "stack_File_Attribs_button_id_1248"

/*
# Name: button "features front" of card "Take Photo" of stack "File Attribs"
# ID: button id 1248 of card id 1240 of stack "File Attribs"
# Hash: rxbWNzEDWmtEMWXxdkInqg==
*/


on mouseUp
   iphoneCameraFeatures "front"
   put the result into field "The_Result"
end mouseUp
