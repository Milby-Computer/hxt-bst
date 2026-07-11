Script "stack_File_Attribs_button_id_1023"

/*
# Name: button "Test beep" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1023 of card id 1009 of stack "File Attribs"
# Hash: GAR83bSVYQDrlebTrXljSg==
*/


on mouseUp
   set the beepSound to specialFolderPath("engine") & slash & "tap.aif"
   beep
   
   wait 1 second
   
   set the beepSound to empty
   beep
end mouseUp
