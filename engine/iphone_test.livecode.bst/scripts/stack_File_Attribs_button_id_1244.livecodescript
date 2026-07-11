Script "stack_File_Attribs_button_id_1244"

/*
# Name: button "front camera" of card "Take Photo" of stack "File Attribs"
# ID: button id 1244 of card id 1240 of stack "File Attribs"
# Hash: YH51KLdX9yA+/BA5F+cy5w==
*/


on mouseUp
   iPhonePickPhoto "front camera", 212, 122
   if the result is text then
      put the result into image "The_Image"
   else
      put the result into field "The_Result"
   end if
end mouseUp
