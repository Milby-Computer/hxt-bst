Script "stack_File_Attribs_button_id_1900"

/*
# Name: button "Modify Event" of card "Calendar" of stack "File Attribs"
# ID: button id 1900 of card id 1887 of stack "File Attribs"
# Hash: tr6Sn5U/f0370GrYjoaw9g==
*/


on mouseUp
   local tItemFound
   mobileAddEvent "eventid", (line (the word 2 of the selectedline of field "InputData ID") of field "inputData ID"), "title", "Updated"
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
      put tItemFound into field "InputData ID"
   end if  
end mouseUp
