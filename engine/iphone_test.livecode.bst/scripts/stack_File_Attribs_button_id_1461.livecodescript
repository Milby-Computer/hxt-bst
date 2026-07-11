Script "stack_File_Attribs_button_id_1461"

/*
# Name: button "Get Head Cal Timeout" of card "Heading and Location" of stack "File Attribs"
# ID: button id 1461 of card id 1437 of stack "File Attribs"
# Hash: tS+akiluY8JfifkpaPkuxw==
*/


on mouseUp
   local tResult
   put iphoneHeadingCalibrationTimeout() into tResult
   if tResult is a number then
      answer "Heading Calibration Timeout is set to:" && tResult with "Okay"
   else
      answer "No Heading Calibration Timeout available." with "Okay"
   end if
end mouseUp
