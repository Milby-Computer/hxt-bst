Script "stack_File_Attribs_button_id_1794"

/*
# Name: button "Pause" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1794 of card id 1782 of stack "File Attribs"
# Hash: vxpW6KOwRW8EQ5A1tDeteA==
*/


on mouseUp
   mobilePausePlayingOnChannel the label of button "channel"
   if the result is not empty then
      put the result & return before field 1
   end if
end mouseUp
