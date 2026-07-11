Script "stack_File_Attribs_button_id_1504"

/*
# Name: button "Date" of card "DatePicker" of stack "File Attribs"
# ID: button id 1504 of card id 1494 of stack "File Attribs"
# Hash: /809ur+kDVeKI+KQC4VWgQ==
*/


on mouseUp
   local tTempResult
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   
   iphonePickDate "date"
   put the result into tTempResult
   if tTempResult is 0 then
      put "No Selection Made" into field "DateField"
   else
      convert tTempResult from seconds to abbreviated date
      put tTempResult into field "DateField"
   end if
end mouseUp
