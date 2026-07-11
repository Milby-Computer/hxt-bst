Script "stack_File_Attribs_button_id_1833"

/*
# Name: button "Delete" of card "Ads" of stack "File Attribs"
# ID: button id 1833 of card id 1807 of stack "File Attribs"
# Hash: FizdnR6HKX8wHrtEsWcuyA==
*/


on mouseUp
   mobileAdDelete the label of button "ad"
   if the result is not empty then
      put the result & return before field "log"
   end if
end mouseUp
