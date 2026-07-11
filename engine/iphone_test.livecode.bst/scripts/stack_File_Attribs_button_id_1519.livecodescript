Script "stack_File_Attribs_button_id_1519"

/*
# Name: button "Date Start" of card "DatePicker" of stack "File Attribs"
# ID: button id 1519 of card id 1494 of stack "File Attribs"
# Hash: Ur3h9Vc7Jf2c2TxmXph/hA==
*/


on mouseUp
   local tStartTime, tTempResult
   put "07/25/2011" into tStartTime
   convert tStartTime to seconds
   iphonePickDate "date",, tStartTime
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to abbreviated date
      put tTempResult into field "DateField"
   end if
end mouseUp
