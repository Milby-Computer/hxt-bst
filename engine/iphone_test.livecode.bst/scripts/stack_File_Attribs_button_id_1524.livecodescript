Script "stack_File_Attribs_button_id_1524"

/*
# Name: button "Time End" of card "DatePicker" of stack "File Attribs"
# ID: button id 1524 of card id 1494 of stack "File Attribs"
# Hash: 0oz6YiZQ5s1OrBMoBioljw==
*/


on mouseUp
   local tEndTime, tTempResult
   put "07/29/2011" into tEndTime
   convert tEndTime to seconds
   iphonePickDate "time",,, tEndTime
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to short time
      put tTempResult into field "DateField"
   end if
end mouseUp
