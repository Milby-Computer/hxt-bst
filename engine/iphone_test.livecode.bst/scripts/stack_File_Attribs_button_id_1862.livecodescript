Script "stack_File_Attribs_button_id_1862"

/*
# Name: button "Add Contact" of card "Contact" of stack "File Attribs"
# ID: button id 1862 of card id 1848 of stack "File Attribs"
# Hash: nVyUM8KklY60QcJHUQHAHg==
*/


on mouseUp
   local tItemFound
   mobileAddContact "phoneHomE","001234","phonework","08888","phoneotherfax","0345","message", "Auto Add1", "alternatename", "SteveO1", "title", "Adding this1", "firstname", "Steve11", "lastname", "Jobs11", "middlename", "Ronald11", "suffix", "ESQ11", "nickname", "Jobby11", "phonemobile", "123", "phonemain", "345", "phonepager", "567" 
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
   end if   

   
end mouseUp
