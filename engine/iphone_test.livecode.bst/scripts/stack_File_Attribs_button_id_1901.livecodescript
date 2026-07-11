Script "stack_File_Attribs_button_id_1901"

/*
# Name: button "Find Event" of card "Calendar" of stack "File Attribs"
# ID: button id 1901 of card id 1887 of stack "File Attribs"
# Hash: RQXMsDF+5dd9WaPniWttrw==
*/


on mouseUp
   local tItemFound
   mobileFindEvent field "dateFrom", field "dateTo"
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
      put tItemFound into field "InputData ID"
   end if
end mouseUp
