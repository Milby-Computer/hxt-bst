Script "stack_File_Attribs_button_id_1893"

/*
# Name: button "Update Event" of card "Calendar" of stack "File Attribs"
# ID: button id 1893 of card id 1887 of stack "File Attribs"
# Hash: +bpbg9fhvhpdqS8tJbSllA==
*/


on mouseUp
   local tItemFound
   mobileUpdateEvent line (the word 2 of the selectedline of field "InputData ID") of field "inputData ID"
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
      put tItemFound into field "InputData ID"
   end if   
end mouseUp
