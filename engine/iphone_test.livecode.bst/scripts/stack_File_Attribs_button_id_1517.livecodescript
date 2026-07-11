Script "stack_File_Attribs_button_id_1517"

/*
# Name: button "DateTime Cur" of card "DatePicker" of stack "File Attribs"
# ID: button id 1517 of card id 1494 of stack "File Attribs"
# Hash: BqdVmmZVIjd3QpU1RZ6a4g==
*/


on mouseUp
   local tCurrentTime, tTempResult
   put "07/30/2011" into tCurrentTime
   convert tCurrentTime to seconds
   iphonePickDate "dateTime", tCurrentTime
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to internet date
      put tTempResult into field "DateField"
   end if
end mouseUp
