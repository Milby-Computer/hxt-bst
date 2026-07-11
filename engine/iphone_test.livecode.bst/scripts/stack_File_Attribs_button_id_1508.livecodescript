Script "stack_File_Attribs_button_id_1508"

/*
# Name: button "DateTime" of card "DatePicker" of stack "File Attribs"
# ID: button id 1508 of card id 1494 of stack "File Attribs"
# Hash: Phq7tFAFEOuf0uaExZbWJQ==
*/


on mouseUp
   local tTempResult
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   
   iphonePickDate "dateTime"
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to internet date
      put tTempResult into field "DateField"
   end if
end mouseUp
