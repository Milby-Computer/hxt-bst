Script "stack_File_Attribs_button_id_1669"

/*
# Name: button "Test for Support" of card "Rotation Rate" of stack "File Attribs"
# ID: button id 1669 of card id 1668 of stack "File Attribs"
# Hash: lz1jZDXxDjp8s3D4L4CTGg==
*/


on mouseUp
   if iphoneCanTrackRotation () is true then
      answer "Rotation Tracking is Supported." with "Okay"
   else
      answer "Rotation Tracking is not Supported." with "Okay"
   end if
end mouseUp
