Script "stack_File_Attribs_button_id_1242"

/*
# Name: button "camera" of card "Take Photo" of stack "File Attribs"
# ID: button id 1242 of card id 1240 of stack "File Attribs"
# Hash: y5fLsuOoC5j6Os8FiILEqQ==
*/


on mouseUp
   iPhonePickPhoto "camera", 212, 122
   if the result is text then
      put the result into image "The_Image"
   else
      put the result into field "The_Result"
   end if
end mouseUp
