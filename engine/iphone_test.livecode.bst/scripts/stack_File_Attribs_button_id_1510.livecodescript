Script "stack_File_Attribs_button_id_1510"

/*
# Name: button "Date Step" of card "DatePicker" of stack "File Attribs"
# ID: button id 1510 of card id 1494 of stack "File Attribs"
# Hash: PpBnlirLEfXSfI40EouA4Q==
*/


on mouseUp
   local tTempResult
   iphonePickDate "date",,,,5
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to abbreviated date
      put tTempResult into field "DateField"
   end if
end mouseUp
