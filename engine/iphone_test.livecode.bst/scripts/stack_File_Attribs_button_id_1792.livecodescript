Script "stack_File_Attribs_button_id_1792"

/*
# Name: button "Stop" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1792 of card id 1782 of stack "File Attribs"
# Hash: zEB1ggJDKI8tKxmuC5TU+g==
*/


on mouseUp
   mobileStopPlayingOnChannel the label of button "channel"
   if the result is not empty then
      put the result & return before field 1
   end if
end mouseUp
