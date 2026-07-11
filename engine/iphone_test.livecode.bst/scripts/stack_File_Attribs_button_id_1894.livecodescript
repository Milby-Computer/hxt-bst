Script "stack_File_Attribs_button_id_1894"

/*
# Name: button "Remove Record" of card "Calendar" of stack "File Attribs"
# ID: button id 1894 of card id 1887 of stack "File Attribs"
# Hash: miV7TDnzlOgqFSPRthXv0g==
*/


on mouseUp
   local tItemDeleted
   mobileRemoveEvent line (the word 2 of the selectedline of field "InputData ID") of field "inputData ID", true
   put the result into tItemDeleted
   if tItemDeleted is empty then
      answer "No Record Deleted" with "Okay"
   else
      answer "Deleted Record:" && tItemDeleted with "Okay"
   end if   
end mouseUp
