Script "stack_File_Attribs_button_id_1439"

/*
# Name: button "Test for Location Support" of card "Heading and Location" of stack "File Attribs"
# ID: button id 1439 of card id 1437 of stack "File Attribs"
# Hash: 909lGOClSSoCeCMj1DTBOQ==
*/


on mouseUp
   if iphoneCanTrackLocation () is true then
      answer "Location Tracking is Supported." with "Okay"
   else
      answer "Location Tracking is not Supported." with "Okay"
   end if
end mouseUp
