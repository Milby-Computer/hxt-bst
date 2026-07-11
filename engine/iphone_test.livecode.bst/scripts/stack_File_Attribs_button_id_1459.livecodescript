Script "stack_File_Attribs_button_id_1459"

/*
# Name: button "Set Head Cal Timeout" of card "Heading and Location" of stack "File Attribs"
# ID: button id 1459 of card id 1437 of stack "File Attribs"
# Hash: ikQKGyshv9VWKsACZW+45w==
*/


on mouseUp
   ask question "What Timeout do You want?" with "10" titled "Heading Calibration Timeout"
   if it is an integer then
      iphoneSetHeadingCalibrationTimeout it
   end if
end mouseUp
