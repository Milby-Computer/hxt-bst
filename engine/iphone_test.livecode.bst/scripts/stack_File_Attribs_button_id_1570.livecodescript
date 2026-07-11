Script "stack_File_Attribs_button_id_1570"

/*
# Name: button "Pick Initial" of card "Pick Wheel" of stack "File Attribs"
# ID: button id 1570 of card id 1108 of stack "File Attribs"
# Hash: go7Kidu2IIxy+3PpQqu+HA==
*/


on mouseUp
   local tListOfItems
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   put "GRR2" & return & "England" & return & "Sctoland" & return & "Taiwan" & return & "Germany" & return & "United States of North America" & return & "Spain" & return & "Italy" & return & "France" & return & "China" & return & "Russia" & return & "South America" & return & "Peru" & return & "South Africa" & return & "Poland" into tListOfItems
   if the hilite of button "Use Check" then
      //set the text of field "ButtonResult" to iphonePick (tListOfItems, 2, "checkmark")
      iphonePick tListOfItems,5,"checkmark"  
   else
      //set the text of field "ButtonResult" to iphonePick (tListOfItems, 2, empty)
      iphonePick tListOfItems,5
   end if
   answer the result with "okay"
end mouseUp
