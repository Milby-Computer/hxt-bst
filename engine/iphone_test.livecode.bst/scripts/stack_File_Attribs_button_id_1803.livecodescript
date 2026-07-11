Script "stack_File_Attribs_button_id_1803"

/*
# Name: button "Play Looping" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1803 of card id 1782 of stack "File Attribs"
# Hash: m96e8xD1CNYx2e2is7aJNA==
*/


on mouseUp
   mobilePlaySoundOnChannel specialFolderPath("engine") & "/stormy_weather.mp3", the label of button "channel", "looping"
   if the result is not empty then
      put the result & return before field 1
   end if
end mouseUp
