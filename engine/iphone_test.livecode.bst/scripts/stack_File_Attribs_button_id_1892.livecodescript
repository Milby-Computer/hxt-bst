Script "stack_File_Attribs_button_id_1892"

/*
# Name: button "Show Event" of card "Calendar" of stack "File Attribs"
# ID: button id 1892 of card id 1887 of stack "File Attribs"
# Hash: 36QUU1IOvg/H4JiymXa7yg==
*/


on mouseUp
   local tItemFound
   mobileShowEvent line (the word 2 of the selectedline of field "InputData ID") of field "inputData ID"
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
   end if
end mouseUp
