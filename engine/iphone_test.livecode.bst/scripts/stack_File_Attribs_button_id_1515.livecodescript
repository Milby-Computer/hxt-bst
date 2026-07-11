Script "stack_File_Attribs_button_id_1515"

/*
# Name: button "Date Cur" of card "DatePicker" of stack "File Attribs"
# ID: button id 1515 of card id 1494 of stack "File Attribs"
# Hash: BMawgQYPw1zdpFA3YmRX9Q==
*/


on mouseUp
   local tCurrentTime, tTempResult
   put "07/30/2011" into tCurrentTime
   convert tCurrentTime to seconds
   iphonePickDate "date", tCurrentTime
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to abbreviated date
      put tTempResult into field "DateField"
   end if
end mouseUp
