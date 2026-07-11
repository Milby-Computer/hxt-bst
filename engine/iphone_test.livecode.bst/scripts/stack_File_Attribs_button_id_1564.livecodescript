Script "stack_File_Attribs_button_id_1564"

/*
# Name: button "Show Picker C" of card "Pick Wheel" of stack "File Attribs"
# ID: button id 1564 of card id 1108 of stack "File Attribs"
# Hash: IgB0NLHgz9IzC8dHGRNswg==
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
   iphonePick tPickerList, 50, "cancel"
   answer the result with "ok"
end mouseup
