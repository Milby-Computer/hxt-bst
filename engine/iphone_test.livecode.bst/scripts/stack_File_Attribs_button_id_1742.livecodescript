Script "stack_File_Attribs_button_id_1742"

/*
# Name: button "BadgeValue" of card "Notifications" of stack "File Attribs"
# ID: button id 1742 of card id 1712 of stack "File Attribs"
# Hash: OcsgwLrm8qhIHhV+D5Aejg==
*/


on mouseUp
   local tPickRange
   put "0" & return & "1" & return & "2" & return & "3" & return & "4" & return & "5" & return & "6" & return & "7" & return & "8" & return & "9" & return & "10" & return & "11" & return & "12" & return & "13" & return & "14" & return & "15" & return & "16" & return & "17" & return & "90" & return & "18" & return & "19" & return & "20" into tPickRange
   iphonePick tPickRange, 1, "cancelDone"
   set the label of button "BadgeValue" to "Badge:" && line the result of tPickRange
end mouseUp
