Script "stack_File_Attribs_button_id_1791"

/*
# Name: button "Play Now" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1791 of card id 1782 of stack "File Attribs"
# Hash: Ch66z3xRqlWkO4Llqrxghg==
*/


on mouseUp
   mobilePlaySoundOnChannel specialFolderPath("engine") & "/stormy_weather.mp3", the label of button "channel", "now"
   if the result is not empty then
      put the result & return before field 1
   end if
end mouseUp
