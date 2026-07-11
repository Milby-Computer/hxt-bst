Script "stack_File_Attribs_button_id_1793"

/*
# Name: button "Play Next" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1793 of card id 1782 of stack "File Attribs"
# Hash: en/b4/99+s/Sg40WrP4NZg==
*/


on mouseUp
   mobilePlaySoundOnChannel specialFolderPath("engine") & "/stormy_weather.mp3", the label of button "channel", "next"
   if the result is not empty then
      put the result & return before field 1
   end if
end mouseUp
