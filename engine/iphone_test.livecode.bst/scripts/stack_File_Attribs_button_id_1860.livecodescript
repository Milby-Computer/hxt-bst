Script "stack_File_Attribs_button_id_1860"

/*
# Name: button "Remove Record" of card "Contact" of stack "File Attribs"
# ID: button id 1860 of card id 1848 of stack "File Attribs"
# Hash: Uu3L9ktJsNNZcTHiKHci0Q==
*/


on mouseUp
   local tItemDeleted
   mobileRemoveContact field "InputData ID"
   put the result into tItemDeleted
   if tItemDeleted is empty then
      answer "No Record Deleted" with "Okay"
   else
      answer "Deleted Record:" && tItemDeleted with "Okay"
   end if   
end mouseUp
