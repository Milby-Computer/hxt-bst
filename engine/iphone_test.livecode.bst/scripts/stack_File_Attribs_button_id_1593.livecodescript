Script "stack_File_Attribs_button_id_1593"

/*
# Name: button "Date" of card "DatePicker" of stack "File Attribs"
# ID: button id 1593 of card id 1494 of stack "File Attribs"
# Hash: 430QzukcTDXVBc1gAByxBQ==
*/


on mouseUp
   local tDateResult
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   
   // launch the date picker
   iphonePickDate "date", , , , , "cancelDone"
   // get the result
   put the result into tDateResult
   // check and display the result
   if tDateResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tDateResult from seconds to abbreviated date
      put tDateResult into field "DateField"
   end if
end mouseUp
