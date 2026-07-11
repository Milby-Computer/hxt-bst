Script "stack_File_Attribs_button_id_1889"

/*
# Name: button "Create Event" of card "Calendar" of stack "File Attribs"
# ID: button id 1889 of card id 1887 of stack "File Attribs"
# Hash: eypHRXqFZHS8GY0U3MBofQ==
*/


on mouseUp
   local tItemFound
   mobileCreateEvent
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
      put tItemFound into field "InputData ID"
   end if   
end mouseUp
