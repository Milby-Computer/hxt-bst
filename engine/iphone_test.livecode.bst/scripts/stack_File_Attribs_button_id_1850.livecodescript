Script "stack_File_Attribs_button_id_1850"

/*
# Name: button "Pick Contact" of card "Contact" of stack "File Attribs"
# ID: button id 1850 of card id 1848 of stack "File Attribs"
# Hash: C8dpsDVY3sWcAL0cvIjgCQ==
*/


on mouseUp
   local tItemFound
   mobilePickContact
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
   end if   
end mouseUp
