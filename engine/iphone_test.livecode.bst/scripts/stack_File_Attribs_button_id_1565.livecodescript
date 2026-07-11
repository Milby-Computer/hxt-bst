Script "stack_File_Attribs_button_id_1565"

/*
# Name: button "NI Show Picker CD" of card "Pick Wheel" of stack "File Attribs"
# ID: button id 1565 of card id 1108 of stack "File Attribs"
# Hash: qlRIfkWU6fCe3+o59Vhk/w==
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
   iphonePick tPickerList, 0, "cancelDone"
   answer the result with "ok"
end mouseup
