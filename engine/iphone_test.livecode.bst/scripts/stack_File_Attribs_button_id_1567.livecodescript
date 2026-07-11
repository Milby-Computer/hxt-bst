Script "stack_File_Attribs_button_id_1567"

/*
# Name: button "Pick Initial 8" of card "Pick Wheel" of stack "File Attribs"
# ID: button id 1567 of card id 1108 of stack "File Attribs"
# Hash: JU+DTwZCcepK9kxYTyAz3A==
*/


on mouseUp
   local tListOfItems1
   local tListOfItems2
   local tListOfItems3
   local tListOfItems4
   local tListOfItems5
   local tListOfItems6
   local tListOfItems7
   local tListOfItems8
   if the hilite of button "Use Dev Res" then
      iphoneUseDeviceResolution true, true
   else
      iphoneUseDeviceResolution false, false
   end if
   put "GRR2" & return & "England" & return & "Sctoland" & return & "Taiwan" & return & "Germany" & return & "United States of North America" & return & "Spain" & return & "Italy" & return & "France" & return & "China" & return & "Russia" & return & "South America" & return & "Peru" & return & "South Africa" & return & "Poland" into tListOfItems1
   put "G" & return & "E" & return & "S" & return & "T" & return & "G" & return & "U" & return & "S" & return & "I" & return & "F" & return & "C" & return & "R" & return & "S" & return & "P" & return & "S" & return & "P" into tListOfItems2
   put "GR" & return & "En" & return & "Sc" & return & "Ta" & return & "Ge" & return & "Un" & return & "Sp" & return & "It" & return & "Fr" & return & "Ch" & return & "Ru" & return & "So" & return & "Pe" & return & "So" & return & "Po" into tListOfItems3
   put "G" & return & "S" & return & "G" & return & "S" & return & "F" & return & "R" & return & "P" & return & "S" & return & "P" into tListOfItems4
   put "GRR2" & return & "England" & return & "Sctoland" & return & "Taiwan" & return & "Germany" & return & "United States of North America" & return & "Spain" & return & "Italy" & return & "France" & return & "China" & return & "Russia" & return & "South America" & return & "Peru" & return & "South Africa" & return & "Poland" into tListOfItems5
   put "G" & return & "E" & return & "S" & return & "T" & return & "G" & return & "U" & return & "S" & return & "I" & return & "F" & return & "C" & return & "R" & return & "S" & return & "P" & return & "S" & return & "P" into tListOfItems6
   put "GR" & return & "En" & return & "Sc" & return & "Ta" & return & "Ge" & return & "Un" & return & "Sp" & return & "It" & return & "Fr" & return & "Ch" & return & "Ru" & return & "So" & return & "Pe" & return & "So" & return & "Po" into tListOfItems7
   put "G" & return & "S" & return & "G" & return & "S" & return & "F" & return & "R" & return & "P" & return & "S" & return & "P" into tListOfItems8
   if the hilite of button "Use Check" then
      //set the text of field "ButtonResult" to iphonePick (tListOfItems, 2, "checkmark")
      iphonePick tListOfItems1,0,tListOfItems2,1,tListOfItems3,3,tListOfItems4,4,tListOfItems5,5,tListOfItems6,6,tListOfItems7,7,tListOfItems8,8,"checkmark"  
   else
      //set the text of field "ButtonResult" to iphonePick (tListOfItems, 2, empty)
      iphonePick tListOfItems1,0,tListOfItems2,1,tListOfItems3,3,tListOfItems4,4,tListOfItems5,5,tListOfItems6,6,tListOfItems7,7,tListOfItems8,8
   end if
   answer the result with "okay"
end mouseUp
