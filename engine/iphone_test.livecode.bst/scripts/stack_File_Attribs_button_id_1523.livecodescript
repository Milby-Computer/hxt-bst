Script "stack_File_Attribs_button_id_1523"

/*
# Name: button "DateTime End" of card "DatePicker" of stack "File Attribs"
# ID: button id 1523 of card id 1494 of stack "File Attribs"
# Hash: wJWovpgMR3EWsibs0Am4Ow==
*/


on mouseUp
   local tEndTime, tTempResult
   put "07/29/2011" into tEndTime
   convert tEndTime to seconds
   iphonePickDate "dateTime",,, tEndTime
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to internet date
      put tTempResult into field "DateField"
   end if
end mouseUp
