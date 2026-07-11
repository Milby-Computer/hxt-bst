Script "stack_File_Attribs_button_id_1512"

/*
# Name: button "Time Step" of card "DatePicker" of stack "File Attribs"
# ID: button id 1512 of card id 1494 of stack "File Attribs"
# Hash: QZREpbPBiAhDtOMB/BuzoA==
*/


on mouseUp
   local tTempResult
   iphonePickDate "time",,,,5
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to short time
      put tTempResult into field "DateField"
   end if
end mouseUp
