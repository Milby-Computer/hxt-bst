Script "stack_File_Attribs_button_id_1441"

/*
# Name: button "Test for Heading Support" of card "Heading and Location" of stack "File Attribs"
# ID: button id 1441 of card id 1437 of stack "File Attribs"
# Hash: x7txUIHfsUzSTzmhPoV59g==
*/


on mouseUp
   if iphoneCanTrackHeading () is true then
      answer "Heading Tracking is Supported." with "Okay"
   else
      answer "Heading Tracking is not Supported." with "Okay"
   end if
end mouseUp
