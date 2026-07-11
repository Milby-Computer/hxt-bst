Script "stack_File_Attribs_button_id_1903"

/*
# Name: button "Button" of card "Contact" of stack "File Attribs"
# ID: button id 1903 of card id 1848 of stack "File Attribs"
# Hash: UsDsEau9FwcVlVCF1kL9rQ==
*/


on mouseUp
   mobilePickContact
   if the result is empty then exit to top
   put the result into tContactID
   mobileShowContact tContactID
   answer the result
end mouseUp
