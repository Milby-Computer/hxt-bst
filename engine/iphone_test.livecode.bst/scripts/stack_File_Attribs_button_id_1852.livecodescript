Script "stack_File_Attribs_button_id_1852"

/*
# Name: button "Show Contact" of card "Contact" of stack "File Attribs"
# ID: button id 1852 of card id 1848 of stack "File Attribs"
# Hash: 2gJPTtOZeD/WLhthaw33bA==
*/


on mouseUp
   local tItemFound
   mobileShowContact field "InputData ID"
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
   end if
end mouseUp
