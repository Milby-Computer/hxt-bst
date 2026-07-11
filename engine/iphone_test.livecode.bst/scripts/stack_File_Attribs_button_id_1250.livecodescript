Script "stack_File_Attribs_button_id_1250"

/*
# Name: button "rear camera" of card "Take Photo" of stack "File Attribs"
# ID: button id 1250 of card id 1240 of stack "File Attribs"
# Hash: EwyuIWUDonJdYly42reBrw==
*/


on mouseUp
   iPhonePickPhoto "rear camera", 212, 122
   if the result is text then
      put the result into image "The_Image"
   else
      put the result into field "The_Result"
   end if
end mouseUp
