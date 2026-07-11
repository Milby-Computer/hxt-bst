Script "stack_File_Attribs_button_id_1516"

/*
# Name: button "Time Cur" of card "DatePicker" of stack "File Attribs"
# ID: button id 1516 of card id 1494 of stack "File Attribs"
# Hash: tgIeLD+Ddo4vJkFuaAivWQ==
*/


on mouseUp
   local tCurrentTime, tTempResult
   put "07/30/2011" into tCurrentTime
   convert tCurrentTime to seconds
   iphonePickDate "time", tCurrentTime
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to short time
      put tTempResult into field "DateField"
   end if
end mouseUp
