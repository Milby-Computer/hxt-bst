Script "stack_File_Attribs_button_id_1798"

/*
# Name: button "Delete" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1798 of card id 1782 of stack "File Attribs"
# Hash: sdxwzKGW4j4JSKq05AK04A==
*/


on mouseUp
   mobileDeleteSoundChannel the label of button "channel"
   if the result is not empty then
      put the result & return before field 1
   end if
end mouseUp
