Script "stack_File_Attribs_button_id_1518"

/*
# Name: button "NIL" of card "DatePicker" of stack "File Attribs"
# ID: button id 1518 of card id 1494 of stack "File Attribs"
# Hash: j4wq3yANndt5TRvBWP7itg==
*/


on mouseUp
   local tTempResult;
   iphonePickDate
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to internet date
      put tTempResult into field "DateField"
   end if
end mouseUp
