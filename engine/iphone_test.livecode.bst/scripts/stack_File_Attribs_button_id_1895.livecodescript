Script "stack_File_Attribs_button_id_1895"

/*
# Name: button "Get Calendars" of card "Calendar" of stack "File Attribs"
# ID: button id 1895 of card id 1887 of stack "File Attribs"
# Hash: DoigTef6UnN8TSft4JDQLQ==
*/


on mouseUp
   local tItemFound
   mobileGetCalendars
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
      put tItemFound into field "Output Field"
   end if  
end mouseUp
