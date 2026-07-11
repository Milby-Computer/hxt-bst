Script "stack_File_Attribs_button_id_1569"

/*
# Name: button "Pick Initial 2" of card "Pick Wheel" of stack "File Attribs"
# ID: button id 1569 of card id 1108 of stack "File Attribs"
# Hash: /18Wali8uIXLuoAgb+2h8g==
*/


on mouseUp
   local tListOfItems1
   local tListOfItems2
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   put "GRR2" & return & "England" & return & "Sctoland" & return & "Taiwan" & return & "Germany" & return & "United States of North America" & return & "Spain" & return & "Italy" & return & "France" & return & "China" & return & "Russia" & return & "South America" & return & "Peru" & return & "South Africa" & return & "Poland" into tListOfItems1
   put "G" & return & "E" & return & "S" & return & "T" & return & "G" & return & "U" & return & "S" & return & "I" & return & "F" & return & "C" & return & "R" & return & "S" & return & "P" & return & "S" & return & "P" into tListOfItems2
   if the hilite of button "Use Check" then
      //set the text of field "ButtonResult" to iphonePick (tListOfItems, 2, "checkmark")
      iphonePick tListOfItems1,5,tListOfItems2,7,"checkmark"  
   else
      //set the text of field "ButtonResult" to iphonePick (tListOfItems, 2, empty)
      iphonePick tListOfItems1,5,tListOfItems2,7
   end if
   answer the result with "okay"
end mouseUp
