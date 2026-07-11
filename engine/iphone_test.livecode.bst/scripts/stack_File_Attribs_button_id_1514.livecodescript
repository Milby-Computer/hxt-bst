Script "stack_File_Attribs_button_id_1514"

/*
# Name: button "DateTime Step" of card "DatePicker" of stack "File Attribs"
# ID: button id 1514 of card id 1494 of stack "File Attribs"
# Hash: PWCeNyDq4Nzvuk5YOX71TQ==
*/


on mouseUp
   local tTempResult
   iphonePickDate "dateTime",,,,5
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to internet date
      put tTempResult into field "DateField"
   end if
end mouseUp
