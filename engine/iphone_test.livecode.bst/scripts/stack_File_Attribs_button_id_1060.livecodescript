Script "stack_File_Attribs_button_id_1060"

/*
# Name: button "Get URL" of card "URL functions" of stack "File Attribs"
# ID: button id 1060 of card id 1053 of stack "File Attribs"
# Hash: BRV/6B0l45wjLuP9GACGcQ==
*/


on mouseUp
   put empty into the last field
   get url binURL() 
   if the result is not empty then
      put "download failed:" && the result & return after the last field
   else
      put "download succeeded:" && the number of chars in it & return after the last field
   end if
end mouseUp
