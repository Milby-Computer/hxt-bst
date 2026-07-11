Script "stack_File_Attribs_button_id_1594"

/*
# Name: button "Date C" of card "DatePicker" of stack "File Attribs"
# ID: button id 1594 of card id 1494 of stack "File Attribs"
# Hash: mxel9aRPMWu8UU90USaLqQ==
*/


on mouseUp
   local tSelected, tRangeStart, tRangeEnd, tInterval, tDateResult
   put "07/29/2011" into tSelected // the date and time selected by default
   put "07/20/2011" into tRangeStart // the minimum date and time that can be selected
   put "08/01/2011" into tRangeEnd // the maximum date and time that can be selected
   put 5 into tInterval
   // convert the dates into seconds since the UNIX Epoch
   convert tSelected to seconds
   convert tRangeStart to seconds
   convert tRangeEnd to seconds
   // launch the date picker
   iphonePickDate "date", tSelected, tRangeStart, tRangeEnd, tInterval, "cancel"
   // get the result
   put the result into tDateResult
   // check and display the result
   if tDateResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tDateResult from seconds to internet date
      put tDateResult into field "DateField"
   end if
end mouseUp
