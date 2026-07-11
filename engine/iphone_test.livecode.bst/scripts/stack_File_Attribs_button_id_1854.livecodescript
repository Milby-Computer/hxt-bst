Script "stack_File_Attribs_button_id_1854"

/*
# Name: button "Create Contact" of card "Contact" of stack "File Attribs"
# ID: button id 1854 of card id 1848 of stack "File Attribs"
# Hash: uMcfH+5qIP4OMFCQEKvsVA==
*/


on mouseUp
   local tItemFound
   mobileCreateContact
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
   end if   
end mouseUp
