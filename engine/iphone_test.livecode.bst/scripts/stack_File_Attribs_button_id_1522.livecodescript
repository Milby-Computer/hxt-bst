Script "stack_File_Attribs_button_id_1522"

/*
# Name: button "Date End" of card "DatePicker" of stack "File Attribs"
# ID: button id 1522 of card id 1494 of stack "File Attribs"
# Hash: 3ByE/oSydbhtLsi6K4QHaQ==
*/


on mouseUp
   local tEndTime, tTempResult
   put "07/29/2011" into tEndTime
   convert tEndTime to seconds
   iphonePickDate "date",,, tEndTime
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to abbreviated date
      put tTempResult into field "DateField"
   end if
end mouseUp
