Script "stack_File_Attribs_button_id_1888"

/*
# Name: button "Pick Event" of card "Calendar" of stack "File Attribs"
# ID: button id 1888 of card id 1887 of stack "File Attribs"
# Hash: BCHjvID7OEmYb2etQkZ2hg==
*/


on mouseUp
   local tItemFound
   mobilePickEvent
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
   end if   
end mouseUp
