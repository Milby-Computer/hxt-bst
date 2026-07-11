Script "stack_File_Attribs_button_id_1563"

/*
# Name: button "Show Picker" of card "Pick Wheel" of stack "File Attribs"
# ID: button id 1563 of card id 1108 of stack "File Attribs"
# Hash: 5dTVAe9Yv2QaV6B55LkSUg==
*/


on mouseup
   local tPickerList
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   repeat with x = 1 to 100
      put x & cr after tPickerList
   end repeat
   iphonePick tPickerList, 50
   answer the result with "ok"
end mouseup
