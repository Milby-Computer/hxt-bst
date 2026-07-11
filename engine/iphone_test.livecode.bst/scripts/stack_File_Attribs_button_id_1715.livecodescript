Script "stack_File_Attribs_button_id_1715"

/*
# Name: button "NotifyAfter" of card "Notifications" of stack "File Attribs"
# ID: button id 1715 of card id 1712 of stack "File Attribs"
# Hash: VxJDwgubU5tY2KbuHq7P2g==
*/


on mouseUp
   local tPickRange
   put "0" & return & "1" & return & "2" & return & "3" & return & "4" & return & "5" & return & "10" & return & "15" & return & "20" & return & "25" & return & "30" & return & "35" & return & "40" & return & "45" & return & "50" & return & "60" & return & "70" & return & "80" & return & "90" & return & "100" & return & "110" & return & "120" into tPickRange
   iphonePick tPickRange, 1, "cancelDone"
   set the label of button "NotifyAfter" to "Notify After (secs):" && line the result of tPickRange
end mouseUp
