Script "stack_File_Attribs_button_id_1864"

/*
# Name: button "Find Contact" of card "Contact" of stack "File Attribs"
# ID: button id 1864 of card id 1848 of stack "File Attribs"
# Hash: k4MmcT9+DIt03Rfh/OiquQ==
*/


on mouseUp
   local tItemFound
   mobileFindContact field "InputData"
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
   end if   
end mouseUp
