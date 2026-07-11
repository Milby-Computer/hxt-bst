Script "stack_File_Attribs_button_id_1856"

/*
# Name: button "Update Contact" of card "Contact" of stack "File Attribs"
# ID: button id 1856 of card id 1848 of stack "File Attribs"
# Hash: I7pTGu6VSLk0n0KfOC+95Q==
*/


on mouseUp
   local tItemFound
   mobileUpdateContact "message", "Big Cheese", "alternatename", "SteveO", "title", "Hello There", "firstname", "Steve", "lastname", "Jobs", "middlename", "Ronald", "suffix", "ESQ", "nickname", "Jobby", "organization", "Apple", "jobtitle", "Chief", "department", "Management", "emailwork", "steve@apple.com", "emailhome", "steve@apple-home.com", "addressstreethome", "Jobs Ave", "addresscityhome", "Job City", "addressstatehome", "Jobos", "addressziphome", "J123", "addresscountryhome", "USA", "addressstreetwork", "Orchard Road", "note", "some note text"
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
   end if   
end mouseUp
