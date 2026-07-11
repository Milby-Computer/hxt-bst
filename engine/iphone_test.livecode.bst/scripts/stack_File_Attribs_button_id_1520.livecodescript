Script "stack_File_Attribs_button_id_1520"

/*
# Name: button "DateTime Start" of card "DatePicker" of stack "File Attribs"
# ID: button id 1520 of card id 1494 of stack "File Attribs"
# Hash: znZ/nCgyBFxKTzQcV92WSQ==
*/


on mouseUp
   local tStartTime, tTempResult
   put "07/25/2011" into tStartTime
   convert tStartTime to seconds
   iphonePickDate "dateTime",, tStartTime
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to internet date
      put tTempResult into field "DateField"
   end if
end mouseUp
