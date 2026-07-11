Script "stack_File_Attribs_button_id_1568"

/*
# Name: button "Pick Initial 4" of card "Pick Wheel" of stack "File Attribs"
# ID: button id 1568 of card id 1108 of stack "File Attribs"
# Hash: JX+/8uO5ZDB+0no1B0jQEw==
*/


on mouseUp
   local tListOfItems1
   local tListOfItems2
   local tListOfItems3
   local tListOfItems4
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   put "GRR2" & return & "England" & return & "Sctoland" & return & "Taiwan" & return & "Germany" & return & "United States of North America" & return & "Spain" & return & "Italy" & return & "France" & return & "China" & return & "Russia" & return & "South America" & return & "Peru" & return & "South Africa" & return & "Poland" into tListOfItems1
   put "G" & return & "E" & return & "S" & return & "T" & return & "G" & return & "U" & return & "S" & return & "I" & return & "F" & return & "C" & return & "R" & return & "S" & return & "P" & return & "S" & return & "P" into tListOfItems2
   put "GR" & return & "En" & return & "Sc" & return & "Ta" & return & "Ge" & return & "Un" & return & "Sp" & return & "It" & return & "Fr" & return & "Ch" & return & "Ru" & return & "So" & return & "Pe" & return & "So" & return & "Po" into tListOfItems3
   put "G" & return & "S" & return & "G" & return & "S" & return & "F" & return & "R" & return & "P" & return & "S" & return & "P" into tListOfItems4
   if the hilite of button "Use Check" then
      //set the text of field "ButtonResult" to iphonePick (tListOfItems, 2, "checkmark")
      iphonePick tListOfItems1,3,tListOfItems2,5,tListOfItems3,7,tListOfItems4,9,"checkmark"  
   else
      //set the text of field "ButtonResult" to iphonePick (tListOfItems, 2, empty)
      iphonePick tListOfItems1,3,tListOfItems2,5,tListOfItems3,7,tListOfItems4,9, "cancelDone"
   end if
   answer the result with "okay"
end mouseUp
