Script "stack_File_Attribs_button_id_1022"

/*
# Name: button "Test Play" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1022 of card id 1009 of stack "File Attribs"
# Hash: pmk2EJRxNtSU/bNGGn7D2Q==
*/


on mouseUp
   --put specialFolderPath("engine") & slash & "stormy_weather.mp3" & return into the last field
   put empty into the last field
   play specialFolderPath("engine") & slash & "tap.aif"
   repeat until the sound is done
      put "waiting..." & return after the last field
      wait 20 millisecs
   end repeat
   put the result & return after the last field
end mouseUp
