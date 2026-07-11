Script "stack_File_Attribs_button_id_1836"

/*
# Name: button "Set Top Left" of card "Ads" of stack "File Attribs"
# ID: button id 1836 of card id 1807 of stack "File Attribs"
# Hash: xI+W8toJFb6vNhM2M70aWg==
*/


on mouseUp
   mobileAdSetTopLeft the label of button "ad", (field "left", field "top")
   if the result is not empty then
      put the result & return before field "log"
   end if
end mouseUp
