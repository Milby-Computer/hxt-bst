Script "stack_File_Attribs_button_id_1595"

/*
# Name: button "Time" of card "DatePicker" of stack "File Attribs"
# ID: button id 1595 of card id 1494 of stack "File Attribs"
# Hash: kUdP3Ao4nzMe1/aHdP2/hA==
*/


on mouseUp
   local tDateResult
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   
   // launch the date picker
   iphonePickDate "time",the time,,,10, "cancelDone"
   // get the result
   put the result into tDateResult
   // check and display the result
   if tDateResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tDateResult from seconds to short time
      put tDateResult into field "DateField"
   end if
end mouseUp
