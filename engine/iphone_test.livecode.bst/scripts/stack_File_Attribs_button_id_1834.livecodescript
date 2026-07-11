Script "stack_File_Attribs_button_id_1834"

/*
# Name: button "Set Visible" of card "Ads" of stack "File Attribs"
# ID: button id 1834 of card id 1807 of stack "File Attribs"
# Hash: m2EpxVxWmoJ22UyqIQ46Mw==
*/


on mouseUp
   mobileAdSetVisible the label of button "ad", not (mobileAdGetVisible(the label of button "ad"))
   get the result
   if it is not empty then
      put it & return before field "log"
   end if
end mouseUp
