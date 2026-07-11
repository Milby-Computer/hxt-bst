Script "stack_File_Attribs_button_id_1832"

/*
# Name: button "Create" of card "Ads" of stack "File Attribs"
# ID: button id 1832 of card id 1807 of stack "File Attribs"
# Hash: 1xioOOpPZmvCTi9iCzWImg==
*/


on mouseUp
   local tDetails
   put "sdfsd" into tDetails["timeout"]
   put 25 into tDetails["age"]
   put "male" into tDetails["gender"]   
   mobileAdCreate the label of button "ad", the label of button "type", (0,0), tDetails
   if the result is not empty then
      put the result & return before field "log"
   end if
end mouseUp
